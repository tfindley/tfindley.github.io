---
title: Building a Self-Signed Certificate Authority
date: 2025-02-03
author: Tristan Findley
categories:
  - Technical
tags:
  - technical
  - ansible
  - guide
  - automation
  - devops
  - web
  - development
  - testing
  - ssl
  - ca
  - bash
showTableOfContents: true
draft: false
---

Create a new working directory in which you can store all your Certs. Do not have any spaces in the paths otherwise the bootstrap script will break!

CD into that directory and create the following directories

```bash
mkdir ca conf crt csr crt/live crt/archive
```

By the end of this, your tree will look like the following (including examples):
```
.
├── ca
│   ├── myCA.key
│   ├── myCA.pem
│   └── myCA.srl
├── conf
│   └── mdb.graylog.vib.local.conf
├── crt
│   ├── archive
│   │   └── mdb.graylog.vib.local.20240826-152506
│   │       ├── cert.pem
│   │       ├── chain.pem
│   │       ├── fullchain.pem
│   │       └── privkey.pem
│   └── live
│       └── mdb.graylog.vib.local
│           ├── cert.pem
│           ├── chain.pem
│           ├── fullchain.pem
│           └── privkey.pem
├── csr
│   └── mdb.graylog.vib.local.csr
└── gencert.sh
```

In the root working directory create gencert.sh.

now change the permissions of this file to give it execute

```
chmod +x gencert.sh
```

```bash
openssl genrsa -des3 -out ca/myCA.key 4096
```

Enter a password and store this somewhere safe! you'll need this whenever you generate a cert

```bash
openssl req -x509 -new -nodes -key ca/myCA.key -sha256 -days 1825 -out ca/myCA.pem
```

This is your root certificate. you can share this to establish your chain of trust.

Now create a file in conf using the following configuration:
> conf/name.subdomain.domain.tld.conf

or
> conf/name.domain.tld.conf

i.e:
> conf/mdb.graylog.vib.local

The content of this file should reflect the following

Be sure to edit:
- `commonName`
- `[alt_names]`
	- `DNS.[0-*]`
	- `IP.[1-*]` (if applicable )

```
[ req ]
default_bits		= 4096
distinguished_name	= req_distinguished_name
req_extensions		= req_ext
prompt			= no
default_md		= sha256

[ req_distinguished_name ]
countryName		= BE
stateOrProvinceName	= East Flanders
localityName		= Gent
organizationName	= Vlaams Instituut voor Biotechnologie
organizationalUnitName	= VIB Data Core
commonName		= mdb.graylog.vib.local

[ req_ext ]
subjectAltName		= @alt_names

[alt_names]
DNS.1			= mdb.graylog.vib.local
DNS.2			= vm-vibglog-mdb01.vib.local
DNS.3			= vm-vibglog-mdb02.vib.local
DNS.4			= vm-vibglog-mdb03.vib.local
IP.1			= 10.181.3.2
IP.2			= 10.181.3.4
IP.3			= 10.181.3.10
```

Now to generate a certificate, run:

```bash
./gencert.sh name.subdomain.domain.tld
```

i.e:
```bash
./gencert.sh mdb.graylog.vib.local
```

Your new certificates will appear under crt/live/name.subdomain.domain.tld

If a certificate existed by that name previously, it will be moved to crt/archive/name.subdomain.domain.tld.YYYYMMDD-HHMMSS/

You will have the following files (these filenames will match LetsEncrypt / Certbot generated certs):
- cert.pem - your certificate
- chain.pem - the chain for the certificate, also known as your CA or Certificate Authority
- fullchain.pem - Your certificate plus your CA
- privkey.pem - The private key for your certificate