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

When working with internal production environments or development environments, it can be useful to have an Certificiate Authority (CA) to issue SSL Certificates to your infrastructure or services. This means that you don't have to worry about obtaining externally valid SSL Certificates.

In my recent work I've been building up a number of development environments, and I hate having to remember the exact sequence and commands that I require to build up a new CA, or to issue a new certificate. Therefore I built a simple bootstrap script to build the CA, and another script to issue certificates with minimum manual editing required.

---

First, create a new working directory in which you can store all your Certs. For the example we will just use 'ssl'. Do not have any spaces in the paths otherwise the bootstrap script will break.

```bash
mkdir ssl
```

cd into that directory and create a new file called 'generate.sh'

```bash
cd ssl
touch generate.sh
```

Now you need to edit 'generate.sh' using your favourite text editor (vim, nano, emacs, etc) and add the following code:

```bash
#!/bin/bash

# To execute this script:
# ./generate.sh sub.domain.tld
# where sub.domain.tld is the domain name you wish to generate certificates for.

# Get domain name. This should be in the format of domain.tld or sub.domain.tld
DOMAIN=$1

# Ensure domain name is set
if [ -z $DOMAIN ]; then
	echo "domain not specified"
	exit 1
fi

# Create directory structure for the new domain
mkdir $DOMAIN
mkdir -p $DOMAIN/ca
mkdir -p $DOMAIN/crt/archive
mkdir -p $DOMAIN/crt/live
mkdir -p $DOMAIN/conf
mkdir -p $DOMAIN/csr

# Build your domain RSA key - you will be prompted for a password to protect the key.
echo ""
openssl genrsa -des3 -out $DOMAIN/ca/myCA.key 4096

# Build your domain certificate. You will be prompted for the key password that you just entered.
echo ""
openssl req -x509 -new -nodes -key $DOMAIN/ca/myCA.key -sha256 -days 1825 -out $DOMAIN/ca/myCA.pem

echo ""
echo "Done"

# Generate a sample subdomain configuration
cat <<EOF > $DOMAIN/conf/sample.$DOMAIN.conf
[ req ]
default_bits            = 4096
distinguished_name      = req_distinguished_name
req_extensions          = req_ext
prompt                  = no
default_md              = sha256

[ req_distinguished_name ]
countryName             = BE
stateOrProvinceName     = East Flanders
localityName            = Gent
organizationName        = Vlaams Instituut voor Biotechnologie
organizationalUnitName  = Data Core
commonName              = service.$DOMAIN

# Your commonName should match DNS.1 

[ req_ext ]
subjectAltName          = @alt_names

[alt_names]
DNS.1                   = service.$DOMAIN
DNS.2                   = alias.$DOMAIN
IP.1                    = 192.168.69.2
IP.2                    = 192.168.69.3
EOF

# Build the gencert script
cat <<EOF > $DOMAIN/gencert.sh
#!/bin/bash
CERT=$1
DATETIME=$(date "+%Y%m%d-%H%M%S")
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ -z $CERT ]; then
	echo "Cert name not specified"
	exit 1
fi

if [ ! -f $SCRIPTPATH/conf/$CERT.conf ]; then
        echo "Config file $CERT.conf does not exist"
        exit 1
fi

if [ ! -d $SCRIPTPATH/crt/live/$CERT ]; then
	echo "Creating new cert directory"
	mkdir $SCRIPTPATH/crt/live/$CERT
else
	echo "certificate already exists - moving to archive"
	mv $SCRIPTPATH/crt/live/$CERT $SCRIPTPATH/crt/archive/$CERT.$DATETIME
	echo "Creating new cert directory"
	mkdir $SCRIPTPATH/crt/live/$CERT
fi

NEW_KEY=$SCRIPTPATH/crt/live/$CERT/privkey.pem
NEW_CRT=$SCRIPTPATH/crt/live/$CERT/cert.pem
NEW_FULLCHAIN=$SCRIPTPATH/crt/live/$CERT/fullchain.pem
NEW_CHAIN=$SCRIPTPATH/crt/live/$CERT/chain.pem
NEW_CSR=$SCRIPTPATH/csr/$CERT.csr
NEW_CFG=$SCRIPTPATH/conf/$CERT.conf
CA_KEY=$SCRIPTPATH/ca/myCA.key
CA_PEM=$SCRIPTPATH/ca/myCA.pem

echo "Generating Key"
openssl genrsa -out $NEW_KEY

echo "Generating CSR"
openssl req -new -key $NEW_KEY -out $NEW_CSR -config $NEW_CFG

echo "Generating CRT"
openssl x509 -req -in $NEW_CSR -CA $CA_PEM -CAkey $CA_KEY -CAcreateserial -out $NEW_CRT -days 365 -sha256 -extfile $NEW_CFG -extensions req_ext

echo "Generate Chain"
cp $CA_PEM $NEW_CHAIN

echo "Generating Full Chain"
cat $NEW_CRT > $NEW_FULLCHAIN
cat $CA_PEM >> $NEW_FULLCHAIN

echo ""
echo "Done"
exit 0
EOF

# make the gencert script executable.
chmod +x $DOMAIN/gencert.sh

echo ""
echo "Done"
exit 0
```

Once saved, make the file executable:

```bash
chmod +x generate.sh
```

You can now execute the script, with the domain name that you want to generate a certificate authority for. 

```bash
./generate.sh sub.domain.tld
```

This will prompt you for a password which is required to secure the CA's private key.

Now you should have the following directory structure:

```plaintext
ssl
├── generate.sh
└─- sub.domain.tld
   ├── ca
   │   ├── myCA.key
   │   ├── myCA.pem
   │   └── myCA.srl
   ├── conf
   │   └── sub.domain.tld.conf
   ├── crt
   │   ├── archive
   │   └── live
   ├── csr
   └── gencert.sh
```

Inside your ssl directory you should now see a directory with the name of the domain you entered (in this example, `sub.domain.tld`).

cd into this directory and you should see a `gencert.sh` script. This script is used in conjunction with a configuration file (stored in the `conf` directory) to generate you a new certificate.

If you cd into the `conf` directory you will now see a sample configuration file in here. This file is non-functional, but you can use it as a template to create a real conf for a certificate request (csr). 


Create a file in conf using the following configuration:
> conf/name.sub.domain.tld.conf

or
> conf/name.domain.tld.conf

The content of this file should look like the following example

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

Be sure to edit:
- `commonName`
- `[alt_names]`
	- `DNS.[0-*]`
	- `IP.[1-*]` (if applicable )


Now to generate a certificate, cd to the root directory containing the gencert.sh bash script and run:

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

By the end of this, your tree will look like the following (including two domain examples with one service each which has had its certificate re-issued once):

```plaintext
ssl
├── generate.sh
├── sub.domain.tld
|   ├── ca
|   │   ├── myCA.key
|   │   ├── myCA.pem
|   │   └── myCA.srl
|   ├── conf
|   │   └── service.sub.domain.tld.conf
|   ├── crt
|   │   ├── archive
|   │   │   └── service.sub.domain.tld.20240826-152506
|   │   │       ├── cert.pem
|   │   │       ├── chain.pem
|   │   │       ├── fullchain.pem
|   │   │       └── privkey.pem
|   │   └── live
|   │       └── service.sub.domain.tld
|   │           ├── cert.pem
|   │           ├── chain.pem
|   │           ├── fullchain.pem
|   │           └── privkey.pem
|   ├── csr
|   │   └── service.sub.domain.tld
|   └── gencert.sh
└─- another.sub.domain.tld
   ├── ca
   │   ├── myCA.key
   │   ├── myCA.pem
   │   └── myCA.srl
   ├── conf
   │   └── service.another.sub.domain.tld.conf
   ├── crt
   │   ├── archive
   │   │   └── service.another.sub.domain.tld.20240826-152506
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
   │   └── service.another.sub.domain.tld.csr
   └── gencert.sh
```
