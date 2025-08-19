---
permalink: /devops
title: "DevOps"
description: The DevOps Journey
excerpt: ""
toc: false
classes: wide
layout: simple
showPagination: false
---

## Build process:

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