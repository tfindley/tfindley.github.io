---
title: "Building a Certificate Manager for Hashicorp Vault"
author: Tristan Findley
date: "2025-04-03"
categories:
    - Technical
tags: 
  - "letsencrypt"
  - "certbot"
  - "ssl"
  - "ha"
  - "hashicorp"
  - "vault"
  - "python"
showTableOfContents: false
draft: false
---

Services are everywhere; APIs, load balancers, control planes, monitoring dashboards — each needing their own TLS certificate. Back in 2012 a group of engineers from Mozilla set out to revolutionise the world of Secure Web Services with a little thing called 'LetsEncrypt' - a solution to bring TLS Certificates to the masses, for free. This little application reinvented the way we look at certificate issuance and managment, and has since become the defacto standard for web encryption.

In order to utilise the free LetsEncrypt certificates, all you needed was:

- A publicly registered DNS address
- A publicly facing service or service with port 80/tcp addressible

Those Platform Engineers and Systems Administrators managing private infrastrucuture managed to figure out ways to utilise LetsEncrypt to issue certificates for our internal services. In some instances this could completely eliminate the need for internal certificate authorities and snakeoil certificates, effectively reducing or even eliminating certificatre sprawl. However accomplishing this meant that certain specific critera had to be met:

- A publicly registered DNS Address
- DNS Registrar with: LetsEncrypt DNS-01 -or- API Capability and some [insert favourite language here] knowledge
- Internet-connected infrastructure

For those using this method to provide externally-valid certs for internal services, there were a number of additional gotchas;

1. Certificates only valid for 3 months and needed constant renewal - this was a big issue for those who wanted to use these certificats for anything other than web frontend.
2. Certbot certificate default permissions and locations (`/etc/letsencrypt/live/sub.domain.tld/`) - This was a massive problem for services that did not have access to this directory. Due to the way LetsEncrypt's default directory permissions and the (cleaver) use of Symbolic Links, access to this directory was limited to applications with more privilages than normal, such as web-servers / reverse proxies that were required to run with additional privilages.
3. Services requiring reload or restart upon certificate replacement

Points two and three could be resolved through the use of Certbot Pre, Deploy and Post hooks - simply put these were executable files that could be triggered before, during and after a certificate request/renewal to perform actions such as restarting services or copying certificates. Indeed [Jeff Geerling's Ansible Role; Certbot](https://github.com/geerlingguy/ansible-role-certbot) makes extensive use of this to restart services on demand. [My own fork of this role: certbot](https://github.com/tfindley/ansible-role-certbot) extended this to allow for the copying of the certificates to diffirent locations.

This, was the start of my journey into reinventing certbot for use with Hashicorp Vault. After trying to add support to Jeff's role for internal certificate authorities, the role became far too difficult to implement, so I abandoned my alterations, and instead began work on the Vault Certificate Manager script in Python.

## Vault Certificate Manager - LetsEncrypt for Hashicorp Vault

[VCM (Vault Certificate Manager)](https://github.com/tfindley/vault_certificate_manager) is a lightweight, scalable tool to manage TLS certificates issued by HashiCorp Vault’s PKI engine for internal environments. With VCM I have set out to address the most common issues with certificate management:

- Certificates can and will Expire
- Certificates need a longer life than 3 months (this is an ACME restriction)
- Services need certs in the right place, with the right permissions
- Services needs to be restarted or reloaded to read the certificats
- Sometimes HTTP or DNS verification can't work for certificate request validation
- Certificate request authorisation is required
- IP SANs or Non-conforming DNS SANS (localhost, *.dev, *.local) may be required
- Certificate reuse needs to be scalable.

At it's core, [VCM](https://github.com/tfindley/vault_certificate_manager) is a lightweight Python3 script that uses it's own Python virtual environment. It uses:

- `requests` to talk to Vault’s API
- `pyyaml` for config parsing
- `pyOpenSSL` to check cert expiry
- System commands like `chmod`, `chown`, and `systemctl` to handle deployment and reloads

It is configured entirely through a simple `.yaml` file, which handles the connection specifics for Hashicorp Vault, the certificates that will be requested, the location(s) they will be stored, and the service(s) it will be managing.

```yaml
config:
  vault: "https://vault.myorg.local:8200"
  pki: "pki_internal"
  role: "internal-service"
  renew: "14d"

certs:
  - name: "web.internal.myorg.local"
    ttl: "120d"
    renew: "10d"
    dns_sans:
      - "api.internal.myorg.local"
    ip_sans:
      - "10.1.1.20"
    service:
      - name: "nginx.service"
        control: "reload"
    deploy:
      - cert: "/etc/nginx/ssl/web.crt"
        owner: "www-data"
        group: "www-data"
        mode: "0644"
      - privkey: "/etc/nginx/ssl/web.key"
        owner: "www-data"
        group: "www-data"
        mode: "0600"
```

It’s small enough to audit, easy to extend, and doesn’t require a service or daemon. Just drop it into a cronjob or systemd timer:

```crontab
0 2 * * * /usr/bin/python3 /opt/vcm/vault_cert_manager.py
```

You can also run it on-demand — which is great for bootstrapping services or testing deployments

Finally, [VCM](https://github.com/tfindley/vault_certificate_manager) is idempotent - [VCM](https://github.com/tfindley/vault_certificate_manager) tracks nothing but inspects your certs directly:

- If they’re still valid — and not close to expiry — it does nothing.
- If they’re expiring — or don’t exist — it requests a new one.
- If deployment targets already contain the same file — they’re skipped.
- If something changes — only then are services restarted.

No state files. No lock-in. Just logic.

## Use Cases

We’ve used [VCM](https://github.com/tfindley/vault_certificate_manager) to automate cert management for:

- NGINX and Apache on internal services
- Dockerized apps where certs live on shared volumes
- Monitoring dashboards behind private load balancers
- VPN services that require IP SANs
- Services bootstrapped via Terraform + Ansible

## Solution Comparison

| Feature                       | Hashicorp Vault with VCM | Hashicorp Vault ACME       | LetsEncrypt via ACME      |
| ----------------------------- | ------------------------ | -------------------------- | ------------------------- |
| Method                        | API                      | ACME                       | ACME                      |
| Certificate Life (Max)        | User Definable           | 3 Months                   | 3 Months                  |
| Root CA distribution          | Manual                   | Included in OS RootCA      | Included in OS RootCA     |
| Authorisation                 | Vault Certificate Roles  | Vault Certificate Roles    | None                      |
| Authentication                | Vault Access AppRole     | Vault Certificate EAB      | None                      |
| Endpoint verification         | None                     | HTTP over :80 or DNS TXT   | HTTP over :80 or DNS TXT  |
| DNS Verification Support      | n/a                      | Private or Public          | Public Only               |
| IP-SAN Support                | Yes                      | Yes                        | No                        |
| SAN `localhost` support       | Yes                      | Yes                        | No                        |
| HTTP Verification Support     | n/a                      | Yes                        | Yes                       |
| Host Certificate Re-use       | Handled by VCM           | CertBot Hooks*             | CertBot Hooks*            |
| Service Management            | Handled by VCM           | CertBot Hooks*             | CertBot Hooks*            |

\* = Automatable only at time of request/renew without additional work to backport reuse locations into script


## Related Articles

- [LetsEncrypt with High Availabilty](/posts/2025-03-27-letsencrypt_on_ha/)
