---
title: "Vlaams Instituut voor Biotechnologie"
excerpt: "DevOps Engineer, Data Core · Change Manager · Major Incident Coordinator"
date: 2024-03-06
description: "DevOps Engineer, Data Core · Change Manager · Major Incident Coordinator — secure, governed infrastructure for genomic research"
showReadingTime: false
aliases:
    - /about/experience/professional/vib/
---

**Role:** DevOps Engineer, Data Core · Change Manager · Major Incident Coordinator

March 2024 – Present · Ghent, Belgium · Hybrid

## A New Chapter

In early 2024 I moved to Belgium to join my partner, and started at VIB — a world-leading life sciences research institute — as a DevOps Engineer in the Data Core team.

It was a deliberate change of direction — from UK defence and national security infrastructure to European life-sciences research. The skills carried straight over (infrastructure automation, security-first design, ITIL and ISO27001 governance); the domain was completely new.

---

## The Organisation

VIB (Vlaams Instituut voor Biotechnologie — Flemish Institute for Biotechnology) is one of Europe's leading life sciences research institutes, based in Ghent, Belgium. With multiple research centres across Flanders, VIB conducts world-class research across immunology, cancer biology, neuroscience, plant biology, microbiology, and computational biology.

Data Core provides the compute, storage, and platform infrastructure for that research. It's a shared, central service — and the goal is for every VIB centre and core facility to run on it. Data Core is mandated to become that common platform.

---

## The Role

My job at Data Core has two sides: platform engineering and governance. That combination is unusual for a DevOps engineer, and it's a big part of why I like the role.

---

## Platform Engineering

I'll describe these in roughly the order I built them, because each one leans on the one before it.

### Automated VM and compute deployment

The foundation is automation. I use Terraform to build the virtual machines, and a set of Ansible roles and collections to take them the rest of the way — fully configured VMs and compute servers, deployed without anyone touching them by hand.

It comes down to two commands: under 90 seconds to provision any number of machines, and under five minutes to have them configured, patched, and ready to use. Everything else I've built sits on top of this.

### HashiCorp Vault — secrets, PKI and encryption keys

Vault was one of the first platforms I stood up, because so much else depends on it. It gives us centralised, automated secret storage, automated PKI for certificates, and the backend encryption keys for our S3 storage.

On the PKI side it runs as a two-tier internal certificate authority for our internal domains, with two ways to issue: a traditional path for long-life certificates, and an internal ACME service that issues short-life (90-day) certificates automatically — the same model the public web uses, but run entirely in-house. The ACME service handles HTTP-01, TLS-ALPN-01, and (most recently) DNS-01, which I wired up through our FreeIPA DNS backend. It also integrates with a hardware security module for key protection.

Expired certificates are a classic, avoidable cause of outages. Automating the whole lifecycle takes that category of problem off the table.

### Containerised services (Docker Swarm)

For containerised workloads I built a production Docker Swarm cluster — highly available, with separate nodes for customer development, internal development, and specialist stacks.

One of the key things it runs is KES, the Key Encryption Service: it pulls encryption keys from Vault and hands them to MinIO, so our S3 storage is encrypted with keys we control. Everything on the Swarm sits behind Traefik as the ingress layer, which I picked up for this and now use as the front door for the platform's services.

### Secure and Open Compute

Researchers need somewhere to run their analysis, so I built two HPC clusters on Slurm.

**Secure Compute** is for the most sensitive data we handle — genomic data linked to patient identities, which is Article 9 special-category data under GDPR. It's built for exactly that: encryption at rest, strict access controls, and detailed logging of everything users do on it, down to individual commands.

**Open Compute** is near-identical, but for non-sensitive work — and deliberately without that enhanced logging, because the data doesn't call for it. Running both means researchers always land on the right environment for the sensitivity of their data.

### Security logging and SIEM

Standing up Secure Compute meant we had to capture what happened on it — every user action — both to meet NIS2's logging requirements and because a platform holding that kind of data has to be accountable. That's what drove the SIEM.

I built it from Wazuh, OpenSearch, Graylog and MongoDB: it collects logs from across the infrastructure, with the user-activity logs from Secure Compute at its core. It's the evidence base behind our User Activity Investigation process — the technical half of a capability that the policy and process then define what to do with.

### Self-service automation (Semaphore)

The newest piece is about getting out of people's way. I maintain our automation delivery platform (Semaphore UI), which lets the other Data Core teams — the ones who actually authorise a piece of work — run the automations themselves.

That shifts the automation left, to the people closest to the decision. It removes a whole layer of back-and-forth ("can you run this for us?") and takes work off my plate at the same time. Good automation should make itself easy enough that you're not the bottleneck.

### Monitoring

I help keep our monitoring running — Prometheus for metrics, Grafana for the dashboards, and Uptime Kuma watching service endpoints and feeding straight into the major-incident process. Between them you get both the detail and the at-a-glance view.

### Configuration management and researcher services

I maintain NetBox as our source of truth for infrastructure, and I handle onboarding researchers onto Data Core — setting up their object storage and accounts so they can get on with their work.

---

## Governance & NIS2 Compliance

This is where the career arc completes.

### The Progression

Governance has been a thread through my whole career — and the trajectory has been clear: from *learning* frameworks, to *operating* them, to *authoring* them.

| Role                 | Governance milestone                                                      |
| -------------------- | ------------------------------------------------------------------------- |
| Royal Holloway       | *Learned* ITIL — first exposure to formal service management              |
| University of Surrey | *First worked within* a change management process (an existing peer-reviewed pipeline) |
| UKCloud              | Where my change-management instincts formed — formal ITIL change control               |
| SiXworks             | *Advocated* automation-first governance to board level                    |
| **VIB**              | ***Authored* the governance framework and *chairs* the board**            |

Practitioner → Advocate → Author.

Most recently, I **qualified in FitSM** — the lightweight IT service management standard VIB operates — adding a formal service-management credential to the ITIL foundation I built earlier in my career.

### An ISO27001 Approach to NIS2

NIS2 defines *what* an essential entity must achieve; it doesn't prescribe *how*. I approach our obligations through the lens of **ISO27001** — using the rigour and structure of an established information security management standard as the methodology for meeting the directive's requirements. The standard provides the "how" for the directive's "what". It means our NIS2 compliance isn't a box-ticking exercise built to the minimum of a directive, but a genuine information security management approach measured against a mature, internationally recognised standard.

### NIS2 — Essential Entity

VIB is an essential entity under the EU's NIS2 Directive (EU 2022/2555), which came into effect in October 2024. Essential entity classification carries the most stringent cybersecurity obligations in the directive — and I've been at the centre of VIB's implementation programme from the start.

I have authored, from scratch, the governance framework underpinning our service management and security operations — policies and processes spanning Change Management, Incident Management, Major Incident Management, Risk Management, Patch Management, Document Control, and User Activity Investigation.

My Change Management and Incident Management frameworks are fully embedded in day-to-day operations. I've since been named the **FitSM Process Owner for Change Management** — holding formal, organisation-wide accountability for the process I authored.

The User Activity Investigation work is particularly significant: it's a SIEM-backed forensic investigation capability with both a formal policy and a defined process. The SIEM provides the technical evidence; the policy and process define what to do with it. Most organisations build one or the other — having both closes the loop.

### Change Advisory Board

I chair the Change Advisory Board — the governance forum through which all infrastructure changes are reviewed, risk-assessed, and approved. The CAB is the operational heart of the Change Management process I authored.

### Major Incident Coordination

I serve as Major Incident Coordinator: leading impact assessments, coordinating response efforts, and driving resolution during service outages.

The process has been tested in practice. Recently I coordinated our major incident response to the **Dirty Frag** (CVE-2026-43284 / CVE-2026-43500) and **Copy.Fail** (CVE-2026-31431) kernel vulnerabilities — which required a precautionary emergency shutdown of Compute services to protect the platform and the sensitive data it holds. The MIM framework held, and services were restored in a structured, documented, and communicable way.

Writing a major incident management process is one thing. Coordinating under it when something goes genuinely wrong is another. Both have now happened.

---

## Technology

### Automation & Infrastructure as Code

- **Ansible** — configuration management and deployment (roles & collections)
- **Terraform** — VM and infrastructure provisioning
- **Semaphore UI** — automation delivery platform (self-service for other Data Core teams)
- **Bash, Python** — scripting and automation

### Containerisation

- **Docker, Docker Swarm** — container runtime and orchestration (production-capable)
- **Traefik** — reverse proxy and ingress layer for all containerised services
- **KES** — Key Encryption Service for MinIO

### Virtualisation

- **VMware** — virtual infrastructure platform

### Infrastructure & Compute

- **Linux (RHEL)** — primary operating system
- **Slurm** — HPC workload manager powering the Secure Compute and Open Compute clusters
- **HashiCorp Vault** — internal PKI/CA, secrets management, encryption
- **FreeIPA** — identity management and DNS (BIND/`named`) backend; integrated for ACME DNS-01
- **Lego / ACME** — internal certificate automation (HTTP-01, TLS-ALPN-01, DNS-01)
- **MinIO** — S3-compatible object storage
- **NetBox** — CMDB and infrastructure source of truth

### SIEM & Security

- **Wazuh** — open-source SIEM and endpoint detection
- **OpenSearch / Elasticsearch** — log storage and search
- **Graylog** — log management and analysis
- **MongoDB** — SIEM data layer

### Monitoring

- **Prometheus** — metrics collection
- **Grafana** — metrics visualisation and dashboarding
- **Uptime Kuma** — service endpoint monitoring and alerting

### Source Control

- **Gitea** — self-hosted Git platform

### Databases

- **MongoDB, PostgreSQL**

### Compliance & Governance

- **NIS2** (EU Directive 2022/2555) — essential entity
- **ISO27001** — information security management (the methodology applied to NIS2)
- **ITIL** — service management foundation
- **FitSM** — qualified; lightweight IT service management standard
- **GDPR Article 9** — special category data (genomic)

---

## Why This Role Matters

VIB is where the two sides of my career come together.

The technical side — infrastructure automation, security-first design, building things that stay up — runs from VSS through UKCloud and SiXworks and into life-sciences research. The tools have changed; the way I work hasn't.

The governance side has travelled the same way: I learned ITIL at Royal Holloway, first worked inside a change process at Surrey, formed my change-management instincts inside formal ITIL change control at UKCloud, made the case for automation-first at SiXworks — and here I write the policies and chair the board. I'm not just working inside a governance structure; I helped build this one.

And the work feels different here. Infrastructure that supports cancer research, immunology, and genomics carries a weight that defence systems and cloud platforms didn't, for me. The data is more personal, the people relying on it are closer to hand, and getting it right — technically and ethically — matters just as much.
