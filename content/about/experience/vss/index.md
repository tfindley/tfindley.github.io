---
title: "Vodafone Secure Sector (VSS)"
excerpt: "Systems Administrator — Vodafone Business"
date: 2019-06-03
description: "Systems Administrator — secure infrastructure for critical national infrastructure"
showReadingTime: false
aliases:
    - /about/experience/professional/vss/
---

**Role:** Systems Administrator — Vodafone Business, Vodafone Secure Sector (VSS)

June 2019 – January 2020 · Farnborough, Hampshire · On-site

## The Starting Point

VSS is where it began.

The roles that followed — UKCloud, SiXworks — was a deepening of the same core thread: secure environments, infrastructure that cannot fail, and systems serving organisations that depend on them. The security hardening mindset, the early automation instinct, the understanding of what it means to work with data that needs to be protected at every boundary — all of it started here.

---

## The Company

Vodafone Secure Sector (VSS) was the secure services division of Vodafone Business, providing Security Architecture and Specialist Solutions to major businesses and critical national infrastructure (CNI) providers across the UK. The environment was on-site, access-controlled, and built around the needs of customers for whom security was not optional.

Working here meant systems and organisations where a misconfiguration carries real consequences — a risk to services people depend on, not just a bad afternoon.

---

## What I Did

### Security Hardening & Penetration Testing Remediation

A significant part of the role was taking penetration testing findings — both from scheduled external tests and internal monitoring — and systematically remediating them. That meant analysing logs, understanding root causes, applying system hardening measures against customer requirements, and verifying that fixes held.

This was hands-on security work at a time when "DevSecOps" wasn't yet a job title anyone used. Security wasn't something a separate team bolted on afterwards; it was just part of managing every system.

### System Build, Migration & Management

- Built and configured new customer systems from scratch, ready for go-live delivery
- Managed patching and monitoring across Linux and Windows platforms
- Migrated platforms and services from legacy hardware, OS, and networks to supported infrastructure
- Consolidated legacy physical hardware to virtual instances on VMware (P2V)

### Automation Delivery

I delivered a complete Ansible automation solution for the team — automating base-OS configuration across systems, and standing up a high-availability deployment of StableNet, the network monitoring platform. I'd already been working with Ansible before I joined, so this wasn't first steps; it was real, production automation in a secure environment.

It's the same thread that deepened into Ansible mastery at UKCloud and an automation-first company standard at SiXworks.

---

## Key Projects

### Stateless Imp/Ex Antivirus Solution

One of the more interesting problems I worked on was designing a stateless, containerised antivirus scanning solution for data crossing security boundaries.

Import/Export (Imp/Ex) in a secure environment refers to data entering or leaving the controlled environment — a transfer that creates a potential vulnerability if not handled carefully. The solution used an isolated, ephemeral container for each scan: no state persisted between operations, nothing accumulated between runs, each scan starting from a clean baseline.

Statelessness was a deliberate choice. It's more secure — nothing carries over from a previous scan — as well as more scalable, since the containers are cheap and disposable, and easier to reason about. It also meant the scanner itself couldn't become a vector.

This was early-2019 experience with the kind of cross-domain data security problem I'd run into again, in different forms, at UKCloud and SiXworks.

### Ansible Automation Solution

I delivered a complete Ansible automation solution for the team, targeting two things in particular: automated base-OS configuration across systems, and a high-availability deployment of StableNet, the network monitoring platform. This was infrastructure-as-code applied in a secure, production environment — system state defined, version-controlled, and reproducible rather than applied by hand and remembered.

I'd been writing Ansible for a while by this point, so it was a real delivery rather than a first experiment — the kind of automation that became the through-line of every role that followed.

---

## Technology

- **Operating Systems:** Linux (primary), Windows Server
- **Virtualisation:** VMware (P2V consolidation)
- **Automation:** Ansible, Bash scripting
- **Containerisation:** Docker (Imp/Ex AV solution)
- **Practices:** System hardening, penetration testing analysis and remediation, platform migration, log analysis

---

## Why I Left

I joined VSS deliberately — it was the entry point I wanted into secure infrastructure. After seven months I had the grounding I'd come for. UKCloud offered the next step: a cloud-native environment, a harder automation challenge, and the chance to deepen the skills I'd started building here.

Leaving was always the plan. VSS had done exactly what I needed it to.

---

## The Thread

VSS was the first chapter of a career that's kept moving the same way: deeper into secure, high-stakes infrastructure, and wider in how I contribute to it — from engineer to team lead, from a few Bash scripts to making the automation case at board level.

What came after was built on what started here.
