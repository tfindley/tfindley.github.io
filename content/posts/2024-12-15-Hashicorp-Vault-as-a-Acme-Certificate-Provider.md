---
title: 
date: 2024-12-15
author: Tristan Findley
categories:
  - Technical
  - Hashicorp Vault
tags:
  - technical
  - hashicorp
  - vault
  - hashivault
  - hcl
  - guide
  - python
  - automation
  - devops
  - linux
  - acme
  - certbot
  - tls
  - ssl
  - letsencrypt
showTableOfContents: true
draft: false
---

In my eyes, one of the greatest things that ever happened in the world of TLS was the start of the 'HTTPS Everywhere' movement. This gave rise to the worlds websites defaulting to HTTPS over HTTP, and reduction in price of TLS/SSL certificates to free thanks to ACME and LetsEncrypt.

For those of us who run public-facing web services, this is great, so long as you have a method to request those certificates. Even for those of us running homelabs, getting a certificate for an internal service is (with a small cost and some effort) relatively straight forward (I'll likely cover this in a future post). However this leaves homelab or corporate environments that run on internally build Certificate Authorities generating and distributing certificates using old fashioned methods, and typically this means not easily compatible with DevOps methedologies.

I've recently been working with a new method that ties into automated workflows using the well-known LetsEncrypt CertBot software and Hashicorp Vault as an internal Certificate Authority.

So how do we set this up?

## Vault Setup

Firstly, I'm not going to go into how to install or configure Hashicorp Vault. It's pretty straight forward, and for this exercice you can run everything on your local system using a development server instance.

We will largely follow the Vault ['Creating your own PKI - Self Hosted' guide from Hashicorp](https://developer.hashicorp.com/vault/tutorials/pki/pki-engine?variants=vault-deploy%3Aselfhosted)

### Root Certificate Authority

We won't cover how to create a root certificate authority in this article, however I will endeuver to publish one in the near future.

### Intermediate CA with seperate Certificate Authority

If you want to set up a Intermediate CA with an already existing Root Certificate Authority, you can use the steps below to create this.

You will require your intermediate Certificate along with the chain, and the key.

Create your Intermediate CA

```hcl
resource "vault_mount" "int_ca" {
  path        = "int_ca"
  type        = "pki"
  description = "This is an example intermediate PKI mount"

  default_lease_ttl_seconds = 7776000
  max_lease_ttl_seconds     = 33696000  # 13 months (max allowed by OpenSSL)
```

Now you need to import your certificate chain and key (intermediate certificate + root certificate + key)

```hcl
resource "vault_pki_secret_backend_config_ca" "intermediate" {
  depends_on = [vault_mount.int_ca]

  backend = vault_mount.int_ca.path

  pem_bundle = <<EOT
-----BEGIN CERTIFICATE-----
intermedia_cert_goes_here
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
root_cert_goes_here
-----END CERTIFICATE-----
-----BEGIN RSA PRIVATE KEY-----
intermedia_cert_private_key_goes_here
-----END RSA PRIVATE KEY-----
EOT
}
```

Next, create a role which will allow you to issue the certificates using ACME. For the fields, duplicate the certificate information used for the intermediate certificate

the key fields to look out for are:

| field            | type   |  example     |  Description
| ---------------- | ------ |------------- | ------------  |
| name             | string | domain.tld   | The CN or DNS.1 from the intermediate certificate that you're uploading |
| allowed_domains  | list   | domain.tld   | The TLD that you want to issue certificates under for `example.domain.tld` you should enter `domain.tld` |
| allow_subdomains | bool   | true         | This will allow domains like `another.sub.domain.tld` to be generated instead of just `sub.domain.tld` |
| ou               | string | Internal IT  | Your Organizational Unit Name - Recommended to match your Intermediate Certificate |
| organization     | string | Company Inc. | Your Organizational Name - Recommended to match your Intermediate Certificate |
| country          | string | GB           | Your Country Code - See [here](https://www.digicert.com/kb/ssl-certificate-country-codes.htm) for a complete list - Recommended to match your Intermediate Certificate |
| locality         | string | Farnborough  | Your City or Town - Recommended to match your Intermediate Certificate |
| province         | string | Hampshire    | Your County, State or Province - Recommended to match your Intermediate Certificate |
| street_address   | string | Ace Avenue   | The street where your organization resides - Recommended to match your Intermediate Certificate |
| post_code        | string | GU21 2EG     | Your organizations Post Code - Recommended to match your Intermediate Certificate |

```hcl
resource "vault_pki_secret_backend_role" "intermediate_role" {
  backend          = vault_mount.int_ca
  issuer_ref       = "default"
  name             = "domain.tld"
  ttl              = 7776000  # 3 months - default for ACME
  max_ttl          = 33696000 # 13 months (max allowed by OpenSSL)
  allow_ip_sans    = true
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["default.tld"]
  allow_subdomains = true
  ou               = ["Internal IT"]
  organization     = ["Company Inc."]
  country          = ["GB"]
  locality         = ["Farnborough"]
  province         = ["Hampshire"]
  street_address   = ["Ace Avenue"]
  postal_code      = ["GU21 2EG"]
  use_csr_common_name = true
```

Now the intermediate certificate is online we need to configure the cluster endpoint url. This is what we will be pointing our ACME clients towards as well as where are CRL will persist.

```hcl
resource "vault_pki_secret_backend_config_cluster" "example" {
  backend  = vault_mount.int_ca
  path     = "https://vault.domain.tld:8200/v1/int_ca"
  aia_path = "https://vault.domain.tld:8200/v1/int_ca"
}
```

Next we configure the following:

- Issuing certificate location:  The certificate used to issue this certificate. This appears under *Certificate > Extensions > Authority Information Access* on a generated certificate.
- OCSP (Online Certificate Status Protocol): used for obtaining the revocation status of an X.509 digital certificate. This appears under *Certificate > Extensions > Authority Information Access* on a generated certificate.
- CRL (Certificate Revocation List): The list of certificates revoked by the server. This appears under *Certificate > Extensions > CRL Distribution Point* on a generated certificate.

```hcl
resource "vault_pki_secret_backend_config_urls" "config-urls" {
  backend                 = vault_mount.int_ca
  issuing_certificates    = ["https://vault.domain.tld:8200/v1/int_ca/der"]
  crl_distribution_points = ["https://vault.domain.tld:8200/v1/int_ca/crl/der"]
  ocsp_servers            = ["https://vault.domain.tld:8200/v1/int_ca/ocsp"]
  enable_templating       = true
}
```

Now  we add some missing headers to the endpoint. 

```hcl
resource "vault_generic_endpoint" "pki_int_tune" {
  path                 = "sys/mounts/${vault_mount.int_ca}/tune"
  ignore_absent_fields = true
  disable_delete       = true
  data_json            = <<EOT
{
  "allowed_response_headers": [
      "Last-Modified",
      "Location",
      "Replay-Nonce",
      "Link"
    ],
  "passthrough_request_headers": [
    "If-Modified-Since"
  ]
}
EOT
}
```

Finally we publish the ACME path. This is what will be the endpoint for our certificate requests.

```hcl
resource "vault_generic_endpoint" "pki_int_acme" {
  # depends_on           = [vault_pki_secret_backend_role.learn]
  path                 = "${vault_mount.int_ca}/config/acme"
  ignore_absent_fields = true
  disable_delete       = true

  data_json = <<EOT
{
    "enabled": true
}
EOT
}
```

## Requesting a certificate

### Using Certbot

Using CertBot to request a certificate from vault is relatively straight forward now. Ensure you have Certbot or LetsEncrypt installed, then add the following flags to your command:

| Flag                                | Example Value                                            | Description |
| ----------------------------------- | -------------------------------------------------------- | ----------- |
| `--server`                          | `https://vault.domain.tld:8200/v1/int_ca/acme/directory` | This specifies the address of your vault server, followed by the path to the intermediate CA that you built earlier, and the required ACME endpoint |
| `--register-unsafely-without-email` | n/a                                                      | This bypasses the CertBot/ACME Email requirement   |

#### Renewal Hooks

There are some extra flags that can make your CertBot life a bit easier. These are pre, deploy, and post hooks. 

As you are likely building certs for internal services, some of those internal services may not have access to root-owned directories. This can cause a problem when your certs are stored in `/etc/letsencrypt/live/sub.domain.tld/`. So how do we get around this?
We can run these hooks to perform commands at certain times during the renewal process. 

| Flag                   | Example Value            | Description |
| ---------------------- | ------------------------ | ----------- |
| `--pre-hook`           | `/path/to/prehook.sh`    | Run commands before the cert renewal takes place |
| `--deploy-hook`        | `/path/to/deployhook.sh` | Run commands during the cert renewal process (immediatley after you have the certificates)- use this to copy your certificates from one place to another and set perms |
| `--post-hook`          | `/path/to/posthook.sh`   | Run commands after the cert renewal takes place |

These scripts should be executable and located in a suitable directory path. I would suggest `/etc/letsencrypt/renewal-hooks/{pre|deploy|post}/scriptname`. These scripts simply have to be executable, so could be bash, python, go, etc.

There are a number of variables that can be called in these hooks:

| Variable           | Example Value                          | Example in-use              | Description |
| ------------------ | -------------------------------------- | --------------------------- | ----------- |
| `$RENEWED_LINEAGE` | `/etc/letsencrypt/live/sub.domain.tld` | `$RENEWED_LINEAGE/cert.pem` | The full path to where your certificates have been stored. You just need to provide the cert/fullchain/chain/privkey filenames |

e.g:

```bash
certbot certonly --dry-run --server https://vault.domain.tld:8200/v1/int_ca/acme/directory --register-unsafely-without-email --noninteractive --agree-tos  --email user@domain.tld -d subdomain.domain.tld -d anothersubdomain.domain.tld --pre-hook /path/to/prehook.sh --deploy-hook /path/to/deployhook.sh --post-hook /path/to/posthook.sh
```

### Bootstrapping Certbot with Ansible

I have adapted a role from the famous [Jeff Geerling]{https://www.jeffgeerling.com/} to add full custom certbot support:

{{< github repo="tfindley/ansible-role-certbot" >}}

### Using Traefik3

In order to consume the ACME endpoint using Traefik, you need to add the following dynamic configuration

```docker
services:
  traefik:
    command:
      # The address of the Vault server endpoint
      - --certificatesresolvers.vault_int_ca.acme.caServer=https://vault.domain.tld:8200/v1/int_ca/acme/directory
      # Store the Let's Encrypt certificates in the mounted volume
      - --certificatesresolvers.vault_int_ca.acme.storage=/data/certs/vault_int_ca.json
      # This is what the Vault server will use to check the validity of the site (using .well_known)
      - --certificatesresolvers.vault_int_ca.acme.httpChallenge.entryPoint=http
```

Then to request and store a certificate for a new container instance, add the following label to your container:

The following is an excerpt from a Docker Stack compose file:

```docker
services:
  traefik:
    deploy:
      labels:
        - traefik.http.routers.traefik-public-https.tls.certresolver=vault_int_ca
```
