---
title: "University of Surrey"
excerpt: "Senior Systems Administrator (DevOps focused) — Faculty of Engineering & Physical Sciences"
date: 2017-02-13
description: "Senior Systems Administrator (DevOps focused) — Faculty of Engineering & Physical Sciences"
showReadingTime: false
aliases:
    - /about/experience/professional/uos/
---

**Role:** Senior Systems Administrator (DevOps focused) — Faculty of Engineering and Physical Sciences

February 2017 – June 2019 · Guildford, Surrey · On-site

## Where I Became a DevOps Engineer

The University of Surrey is where my career changed direction.

I arrived as a systems administrator. I left as a DevOps engineer. In between, I learned Infrastructure-as-Code, built CI/CD pipelines, got my first real experience of disciplined change control, and found the specialism that would shape the rest of my career.

It started with Chef.

---

## The Environment

I joined the IT team for the **Faculty of Engineering and Physical Sciences (FEPS)** in February 2017 — a Systems Administration team that grew from six to seven during my time there, providing dedicated IT services to around twelve departments and research centres, roughly 45% of the University's students and staff.

FEPS is not a generic corporate IT environment. It supports some of the UK's leading engineering and physical sciences research — the **5G Innovation Centre**, the **Centre for Vision, Speech and Signal Processing (CVSSP)**, the **Advanced Technology Institute**, the **Institute of Communication Systems**, and the **Ion Beam Centre**. The infrastructure had to meet demanding, high-performance research computing requirements alongside everyday teaching and professional services.

---

## Discovering DevOps

When I joined, the team managed its entire Linux estate through **Chef** — an Infrastructure-as-Code automation platform I'd never used before. Learning it changed how I saw the job. The idea that infrastructure could be written as code — version-controlled, tested, peer-reviewed, and rolled out automatically across hundreds of machines — was new to me, and it stuck.

I became an active developer on the FEPS Chef infrastructure, managing over **500 nodes as code** — more than 300 servers and 200 desktops across the Ubuntu (LTS) estate. Using Chef (Automate, Compliance, and InSpec) with Ruby cookbooks, we could deploy infrastructure changes across the entire estate quickly, consistently, and safely.

This was the spark. Chef was my first Infrastructure-as-Code tool — and it set me on a path. After Surrey, I went on to self-teach **Ansible**, which became my signature automation tool in every role that followed. But the foundation, the mindset, the DevOps philosophy — that all started here.

---

## Change Management — Working Within It

Surrey was my first real experience of working inside a proper change-management process. The workflow was already in place when I arrived — an eight-stage, peer-reviewed pipeline for every change to our Chef infrastructure — and I worked within it day to day, then helped improve it as I took on more of the platform.

It went roughly like this:

1. **Local testing first** — changes validated with Test Kitchen, or applied to one of our own systems with chef-zero
2. **Merge request** — once self-verified, pushed to GitLab as a Merge Request to the Test branch
3. **Peer review** — a careful review by another sysadmin: running the change on a local system or VM, or reading the code closely
4. **Staged promotion** — merged to Test, auto-rolled-out within a two-hour window, then checked across platforms
5. **Soak period** — at least two weeks in Test before Production
6. **Segregation of duties** — the final Production merge was rarely done by the change's author
7. **Protected branches** — no direct commits to Master or Test
8. **Full rollback** — guaranteed through GitLab version control and Chef's cookbook versioning

For a faculty IT team this was a careful piece of engineering discipline — peer review, staged promotion, segregation of duties, soak testing, and a guaranteed way back. It's where I first learned what good change control feels like in practice. The instincts I'd later carry into *formal* governance — authoring ITIL policy, chairing a Change Advisory Board — really took shape later, at UKCloud; Surrey is where I first saw why it mattered.

---

## Continuous Integration

We ran a full CI pipeline for all Chef cookbook changes, defined in a `.gitlab-ci.yml` file and executed by GitLab CI runners across three phases:

1. **Syntax checking** — every push and merge automatically validated
2. **Linting** — code quality and style enforcement
3. **Deployment** — gated to run only against the Master or Test branches

Any errors detected during submission were automatically emailed to the developer and pushed to Slack for instant notification. Quality gates ran before anything reached the estate.

---

## Observability

I built and maintained a complete monitoring and observability stack:

- **Zabbix** — automatically deployed to every system via Chef, providing real-time stats on environmental health, CPU, GPU, memory, and disk usage, plus real-time lab and server status dashboards
- **Grafana** — analysing the Zabbix data in graph form with richer dashboarding
- **Graylog** — aggregating log data across the entire estate for quick review and trend identification

A full observability stack — and another thing that would come back, in more serious forms, later in my career.

---

## Storage Administration

From Q4 2017 I took on storage administration across the faculty's SAN platforms:

- **Quantum StorNext** — high-performance storage for research computing
- **Dell FluidFS** — central infrastructure storage
- **OnStor Bobcat** — legacy storage, being decommissioned

The headline piece of work here was migrating **nearly a petabyte (1 PB) of academic research data** from the legacy OnStor Bobcat SAN to the in-support Quantum StorNext platform — a high-stakes, zero-data-loss migration of irreplaceable research data.

Research computing generates demanding storage requirements — large datasets, high throughput, long-running computation — and managing these platforms gave me hands-on experience with enterprise storage at genuine scale.

---

## The 5G Innovation Centre

Part way through my time at FEPS, I was sent in to look after the **5G Innovation Centre** — taking over from the two systems administrators who had been running it, and bringing the department's infrastructure up to FEPS IT standards.

It's also where I first worked with medical data. The centre ran NHS-related servers, and supporting them meant getting to grips with the particular requirements that come with healthcare systems and patient data — how it's handled, who can reach it, and the rules around it. At the time it was just another part of the job. Looking back, it was my first taste of something that would become central to my work years later at VIB, building secure infrastructure for genomic research.

---

## The Breadth

Beyond the DevOps work, the role covered the full range of systems administration:

- Managing mixed Linux (Ubuntu LTS) and Windows Server estates across physical (Dell, HP, bespoke) and virtual (VMware ESXi/vSphere, legacy KVM) infrastructure
- Capacity planning, storage tiering, and backup/replication policy for virtualisation
- PXE-based automated system installation — kickstarting a machine into a fully preconfigured state with no admin interaction
- Third-line support for escalated tickets within SLA, documented through the Knowledge Base
- License management across Windows and Linux (FlexLM and others) in Terminal Server and Workstation environments
- Consulting directly with academics and researchers to capture requirements for research-specific servers

---

## Technology

### Automation & Infrastructure as Code

- **Chef** (Automate, Compliance, InSpec) — primary IaC platform
- **GitLab Enterprise** (self-hosted) — version control and CI/CD
- **GitLab CI runners** — syntax/lint/deploy pipeline
- **Test Kitchen, chef-zero** — change testing
- **PXE / Kickstart** — automated provisioning
- **Bash** — scripting

### Virtualisation

- **VMware** (ESXi, vSphere)
- **Linux KVM** (legacy)

### Operating Systems

- **Linux** (Ubuntu LTS) — primary estate
- **Windows Server**

### Storage

- **Quantum StorNext, Dell FluidFS, OnStor Bobcat** (SAN)

### Monitoring & Observability

- **Zabbix, Grafana, Graylog**

### Web, Database & Endpoint

- **Apache2, MySQL**
- **Microsoft SCCM** (2012) — packaging, deployment, OS imaging
- **HAProxy, 2FA for SSH, FlexLM**

---

## Why Surrey Mattered

Surrey was the pivot point of my career.

Before Surrey, I was a systems administrator. After Surrey, I was a DevOps engineer — and a lot of what followed traces back here. The Infrastructure-as-Code mindset that took me from Chef to Ansible. The CI/CD pipelines that became second nature. My first real experience of disciplined change control, and my first taste of working with medical data. The observability stack that would come back, in more serious forms, as SIEM work later on.

In 2019 I made a deliberate move: out of education and into the commercial and secure-infrastructure sector, joining Vodafone's Secure Sector. It was time to apply what I'd learned in a new, more demanding context.

But Surrey is where the DevOps engineer in me was born.
