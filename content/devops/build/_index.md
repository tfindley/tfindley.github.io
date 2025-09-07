---
permalink: /devops/build
title: "DevOps"
description: DevOps Build Strategy
excerpt: ""
toc: false
classes: wide
layout: simple
showPagination: false
---

This page still needs some time to brew.

Right now it is some rough notes that will eventually become something. Check back soon to see what comes of it

## Build process

### New Server

Unbox, rack, stack, poweron, test

Install OS

### Configure

Accounts / Security

Storage

Networking

### First VM

Base OS

Netbox

{{< list title=Ansible limit=2 cardView=true where=".Params.devops_cat" value="ansible"  >}}

Packer

Terraform

Semaphore


## Controller VM

Operating System: Rocky 9 minimal or Ubuntu minimal or Debian minimal - what about alpine?

Install:
- Podman - Container hosting
- Hashicorp Vault - Secret storage
- Hashicorp Packer - VM Image building
- Hashicorp Terraform - VM Deployment
- Ansible - VM Configuration

Containers:
- Portainer
- Netbox + Database
- Gitea + Database
- Semaphore + Database
