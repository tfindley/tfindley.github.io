---
title: "UKCloud Ltd"
date: 2020-01-06
description: "DevOps Engineer, Pastoral Manager, Scrum Master, Infrastructure Engineer"
showWordcount: false
showReadingTime: false
---

Duration:** January 2020 – February 2023 (3 years)
**Location:** Farnborough, Hampshire (Hybrid)
**Roles:** Automation and Service Reliability Engineer → DevOps Engineer, Pastoral Manager, Agile Lead

---

## The Role

I spent three formative years at UKCloud, the UK's premier sovereign cloud provider for government, public sector, defence, and regulated industries. My time there spanned two distinct phases: infrastructure automation specialist delivering reliability across highly-secure government environments, then emerging leader taking on people management and project leadership while continuing my technical work.

### UKCloud: Context & Mission

UKCloud was built around a clear strategic mandate: deliver cloud services to organisations requiring data sovereignty, regulatory compliance, and security assurance. All infrastructure was hosted in UK datacentres under UK legal jurisdiction—deliberately designed for government and regulated sectors that cannot tolerate data crossing political or legal boundaries.

The company operated across specialised divisions:
- **G-Cloud:** Public sector cloud services, on the government procurement framework since 2012
- **UKCloud Health:** For healthcare organisations with compliance and data sensitivity requirements
- **UKCloudX:** "First public cloud for high classification systems in the UK"—serving defence and national security, operating completely air-gapped infrastructure

My team—the Automation Service Reliability (ASR) team, later renamed Core Delivery Platform—worked across all of these environments, automating and maintaining mission-critical systems across the full spectrum of UKCloud's security tiers.

### UKCloud's Environment Architecture

It's worth explaining, because the environment shaped almost everything about the work.

UKCloud operated four distinct environment tiers, each with different connectivity and security profiles:

| Environment | Connectivity | Purpose |
|-------------|-------------|---------|
| **Dev** | Equivalent to Assured | Development and testing; matched Assured architecture so code behaved identically in live |
| **Assured** | Semi-connected (extremely restricted) | Government workloads requiring some connectivity; data-restricted access |
| **Elevated** | No internet; data feeds from Assured only | More sensitive government workloads requiring isolation from internet |
| **UKCloudX** | Completely air-gapped, separate data centre | Defence and national security; high-classification systems |

UKCloudX deserves particular mention. Operating with a completely separate data centre and strict control over all information flow:
- All materials and data entering the environment via a **sheep-dip process** (security scanning and sanitisation of all incoming content)
- Anything leaving required a **multi-person authorisation and exfiltration process** (extremely restricted)
- This is sovereign cloud at its most rigorous — a security posture few engineers ever work inside

The ASR team worked across all of these tiers. This meant building automation that could operate in fundamentally different paradigms: from environments with restricted-but-present internet feeds, through to completely offline systems where every piece of tooling and data had to be physically controlled.

### The Technical Challenge

Every service we built faced two non-negotiable constraints:

1. **Availability:** 99.90% platform SLA—government and defence sectors cannot tolerate service outages
2. **Compliance:** Operating within an ISO27001-compliant organisation with formal change management, documented security procedures, risk management frameworks, and audit trails

Neither was an afterthought; they were the starting point. Every automation decision, every deployment pipeline, every monitoring choice had to answer to reliability and security at the same time.

---

## Phase 1: Infrastructure Automation Specialist (Jan 2020 – Jul 2022)

### Core Responsibilities

**Infrastructure Automation & Delivery:**
- Designed and implemented Ansible-based automation for deploying services across government and defence infrastructure
- Delivered automation jobs via Rundeck (automation delivery platform), consuming data from Device42 CMDB—much of our automation was grounded in, or informed by, Device42's asset and configuration data
- Built CI/CD pipelines enabling continuous, reliable delivery across Dev, Assured, Elevated, and UKCloudX environments
- Extended infrastructure-as-code practices with Terraform, supporting both semi-connected and air-gapped systems
- Integrated Test-Driven Development framework (Molecule) into existing Ansible workflows—elevated code quality and team confidence in infrastructure changes

**Highly-Available Systems:**
- Architected and maintained highly-available service configurations using cluster deployments, HAProxy, and KeepAliveD
- Designed for zero-downtime operations: every component redundant, every failure anticipated
- Supported virtualisation (VMware: ESX, vSphere, vCloud Director) and containerisation (Docker, Docker Swarm) platforms

**Multi-Environment Deployment:**
- Deployed solutions across the full UKCloud environment spectrum—from semi-connected Assured to completely air-gapped UKCloudX
- Different deployment strategies per environment: standard connectivity vs. air-gapped where all tooling and data must be physically controlled
- Used a single automation framework (Ansible) as the consistent foundation across all environments despite their fundamentally different constraints

**Monitoring & Observability:**
- Implemented monitoring using OpsView (Nagios-based) and Science Logic
- Designed alerting systems balancing rapid incident response with compliance requirements
- Built and maintained monitoring dashboards providing visibility across complex, multi-tier infrastructure

**Incident Ownership:**
- Took full ownership of service incidents from first alert through to resolution—regardless of complexity or hour
- In-hours and out-of-hours support for mission-critical systems, with proactive and reactive response
- Culture of accountability: no hand-off mid-incident; you own it through to conclusion

**Change Management & Compliance:**
- Enacted all changes using ITIL-compliant change management procedures
- Operated within a heavily certified organisation: **ISO9001** (Quality Management), **ISO20000** (IT Service Management), **ISO27001** (Information Security), and **ISO27018:2014** (Personal Data Protection in Cloud)—the last of which UKCloud was the first company to achieve statement of verification for from LRQA
- Formal information security management across documented procedures, access controls, risk management, and full audit trails for all infrastructure changes

**Cross-Team Collaboration:**
- Acted as a key bridge between ASR and Software Engineering teams
- Actively built stronger inter-team relationships, enabling ASR to be more responsive to Software Engineering's needs and requirements
- Set clear expectations from Software Engineering based on ASR team workload and priorities—improved transparency and reduced friction between teams

---

## Phase 2: Leadership Expansion (Jul 2022 – Feb 2023)

Note: everything from Phase 1 continued. The roles below were taken on *in addition to* technical responsibilities, not as a replacement.

### Pastoral Management

In 2022, I took on formal responsibility for the pastoral wellbeing of four full-time undergraduate staff members. This role was deliberately separated from technical management—creating space for team members to discuss challenges, frustrations, and career aspirations independent of technical performance pressures.

**What pastoral management meant in practice:**
- Regular 1-2-1 meetings to understand each team member's needs, career goals, and personal circumstances
- Collaboratively built Personal Development Plans aligned with individual aspirations and business needs
- Coached team members through challenges—for example, helping someone stuck on a technical problem develop strategies and personal boundaries for when to seek help, rather than staying stuck in frustration
- Provided a neutral space for workplace concerns and helped navigate organisational dynamics

To support the role properly, I also trained and qualified as a **Mental Health First Aider** (MHFA England, 2022) — giving me the tools to recognise and respond to wellbeing issues, not just manage tasks.

**Crisis Leadership:**

In late 2022, UKCloud entered administration. During this period, I shifted focus to protecting my team. I worked to find all four undergraduate staff members new positions with other companies—ensuring they had career continuity despite the organisation's difficulties.

Putting people first during uncertainty is one of the things I'm proudest of from this period.

### Agile Leadership & Project Delivery

**DevOps Management Dashboard (Scrum Master):**
- Led a team of 4 engineers to deliver a unified monitoring and tooling dashboard
- Aggregated APIs from multiple tools (OpsView, ticketing, infrastructure management) into a single view
- Implemented SSO authentication—users authenticate once, seamless access to all backend tooling
- Delivered using two-weekly sprints, managing the bridge between team and product owner throughout

This was my first experience leading a technical project from a purely leadership perspective—not contributing code, focused on team coordination, sprint delivery, and unblocking obstacles.

The key insight it crystallised: **technical leadership ≠ technical contribution.** The value I added was through orchestration, communication, and alignment. This distinction became foundational for how I approached leadership going forward.

**Other Project Leadership:**
- Agile Lead on CI/CD Infrastructure project (engineer and lead role)
- Agile Lead on Core Management Platform Portal
- Engineer on Runbook Automation framework

### Formal Leadership Training

In 2022, I undertook the **CMI (Chartered Management Institute) People [People Leadership Programme](/about/training/plp/)** — a formal apprenticeship in people management, supported by UKCloud as part of my career development.

When UKCloud entered administration, I chose to continue the programme independently. I completed it with a **Distinction** in October 2023 (while at my next role at SiXworks). The practical experience from pastoral management, combined with the formal training, was a direct contributor to my next opportunity—where I was given the chance to build and lead a team from scratch.

---

## Key Projects

### Patching as a Service
**Period:** Designed year 1 (2020); ran operationally for ~1 year until company closure

**The Challenge:** Deliver reliable, compliant patch management across customer Linux and Windows infrastructure while maintaining uptime and compliance audit trails.

**The Approach:**
- Linux: Ansible-based automation for both deployment and reporting
- Windows: Ivanti Security Controls, integrated into the service workflow
- Built to run reliably without manual intervention, with full reporting for compliance and audit purposes

**The Outcome:** Flawless operational record—zero customer system outages from patching throughout the service's operational life.

### Portal Deployment Automation
**The Challenge:** Deploy customer-facing portal reliably and repeatedly across Dev, Assured, and Elevated environments.

**The Approach:** Built Ansible-based CI/CD pipeline enabling repeatable, automated deployments with consistent configuration across all environments.

**The Outcome:** Reduced deployment time and error rate; enabled faster feature delivery while maintaining parity across environments.

### Platform Migration
**The Challenge:** Migrate supported services from legacy infrastructure to new platform without service disruption.

**The Approach:** Planned and executed migration using infrastructure-as-code practices, with availability as the primary constraint.

**The Outcome:** Successful transition of critical systems—availability maintained throughout.

### TDD Framework Integration
**The Challenge:** Improve code quality and reliability in existing Ansible roles.

**The Approach:** Integrated Molecule test-driven development framework into existing codebase, enabling automated testing of infrastructure changes before deployment.

**The Outcome:** Elevated team confidence in infrastructure changes; reduced regression risk.

### Mail Relay Infrastructure
Designed and deployed replacement for outbound mail relay infrastructure, ensuring reliable and compliant mail delivery across government services.

### DevOps Management Dashboard
As Scrum Master, led delivery of unified monitoring dashboard aggregating multiple tools with SSO authentication. First major leadership experience from a non-technical perspective.

---

## Technology Stack

### Automation & Infrastructure as Code
- **Ansible** — Primary automation tool for all infrastructure deployment and management
- **Terraform** — Infrastructure-as-code for cloud resources
- **Rundeck** — Automation delivery platform; used to orchestrate and deliver automation jobs at scale
- **Git & CI/CD pipelines** — Version control and continuous deployment
- **Molecule** — Test-driven development framework for Ansible roles

### CMDB
- **Device42** — Configuration Management Database; significant portion of automation work built on or around data consumed from this platform

### Virtualisation & Containerisation
- **VMware** (vSphere, vCloud Director, ESX) — Primary virtualisation platform
- **Docker & Docker Swarm** — Container runtimes and orchestration
- **Cluster deployments** — HAProxy, KeepAliveD for high availability and failover

### Infrastructure & Operating Systems
- **Linux** (RHEL) — Primary operating system
- **Windows Server** — Secondary platform support
- **Highly-available architecture** — Cluster design, failover, redundancy

### Monitoring & Observability
- **OpsView** (Nagios-based) — Primary monitoring and alerting platform
- **Science Logic** — Infrastructure monitoring
- **Custom dashboards** — Aggregated tool visibility

### ITSM, Change Management & Compliance
- **ITIL procedures** — Formal change control and governance for all infrastructure changes
- **ISO9001** — Quality Management
- **ISO20000** — IT Service Management
- **ISO27001** — Information Security Management
- **ISO27018:2014** — Personal Data Protection in Cloud (UKCloud was first to achieve LRQA verification)
- **Jira** — Ticketing and project tracking
- **Confluence** — Documentation and knowledge management
- **Ivanti Service Manager** — Customer-facing ITSM
- **Ivanti Security Controls** — Windows patch management (Patching as a Service)

### Methodologies & Practices
- **Agile/Scrum** — Sprint-based delivery cadence (2-weekly)
- **Test-Driven Development** — Quality-focused infrastructure changes (Molecule)
- **Infrastructure as Code** — Reproducible, version-controlled infrastructure
- **ITIL change management** — Formal change control procedures
- **Incident ownership** — End-to-end accountability from detection through to resolution

---

## What I Learned

### Sovereign Cloud & Secure Infrastructure

Working across UKCloud's environment tiers — from semi-connected Assured through to fully air-gapped UKCloudX — gave me a breadth of experience few cloud engineers get near. Each environment demanded a different approach to deployment, tooling, and security posture:

- Standard cloud assumes connectivity; air-gapped environments require every tool, patch, and data source to be physically controlled
- Compliance isn't an audit exercise—it's a design constraint that shapes every architectural decision
- Building reliable systems in restricted environments requires more rigour, not less, in automation practices

It's uncommon experience, and increasingly relevant: sovereign cloud is a growing priority for governments worldwide, and the ability to operate and automate infrastructure at this security tier is in real demand.

### Availability-First Thinking

In environments where outages impact government and defence operations, availability is non-negotiable. The 99.90% platform SLA wasn't a target—it was the floor. This shaped how I approach infrastructure: redundancy by default, failure modes anticipated, and changes enacted under formal control.

### End-to-End Incident Ownership

UKCloud's culture was one of owning problems through to conclusion. You took the alert, you investigated, you resolved—regardless of complexity or time of day. No hand-offs mid-incident. This discipline of seeing things through to resolution is something I carry forward to any technical role.

### Leadership Is Additive

Taking on pastoral management and Scrum Master responsibilities while continuing technical work taught me that leadership is additive to technical capability, not a replacement for it. The skills developed in parallel—managing people, driving project delivery, navigating organisational dynamics—made me a more effective engineer, not a less technical one.

### People-First in Crisis

When UKCloud entered administration, the instinct to protect my team was immediate and clear. Finding new positions for all four team members during organisational uncertainty wasn't a task I was asked to do—it was the right thing to do. That instinct, and the ability to act on it, is something I value in leaders and try to embody myself.

### Foundation for What Came Next

These three years directly enabled my transition to SiXworks, where I was given the opportunity to build and lead a technical team from scratch. The combination of deep infrastructure expertise in regulated environments and emerging people leadership skills was the foundation for taking on that responsibility.

---

## Why UKCloud Matters

UKCloud was a pivotal period of professional growth. It was here I:

- Consolidated infrastructure automation expertise in high-stakes, compliance-heavy government environments
- Gained rare experience operating across air-gapped and classified defence systems (UKCloudX)
- Took on first formal people management responsibilities
- Learned to balance technical depth with people development—in parallel, not in sequence
- Understood what it means to lead during organisational crisis
- Built the confidence and skills to take on greater leadership responsibility

The company's mission—sovereign cloud for the UK public sector, defence, and regulated industries—meant every technology decision carried genuine weight. That sharpened how I think about infrastructure: security, compliance, and availability as first-class concerns. It's a perspective I carry into every role that follows.
