---
title: "SiXworks Ltd"
excerpt: "Platform Services Team Lead — UK defence digital innovation"
date: 2023-02-01
description: "Platform Services Team Lead — automation-first platforms for classified, air-gapped defence environments"
showReadingTime: false
aliases:
    - /about/experience/professional/sixworks/
---

**Role:** Platform Services Team Lead

February 2023 – January 2024 · Farnborough, Hampshire (Cody Technology Park) · Hybrid

## The Company

SiXworks is a defence and national security digital innovation specialist — a trusted partner to the UK Ministry of Defence, focused on accelerating the adoption of secure, experimental technology to improve the operational agility of Defence and National Security.

Their model is distinctive: move fast, experiment, prove the concept, then sustain it. Where others stop at proof-of-concept, SiXworks crosses the "Valley of Death" into live service delivery. They describe their approach as "constructively disruptive" — high assurance, Zero Trust, Data-Centric architectures, deployed in environments most technology companies will never encounter.

I joined in February 2023 when the company had around 70 people and was at the start of a deliberate growth phase. By July 2024 — six months after I left — SiXworks had grown to around 170 people and was acquired by IBM Consulting, specifically for the defence digital transformation capabilities the team had built. I'm proud that the work my team delivered was part of that foundation.

---

## My Brief

I was brought in to build the Platform Services team from the ground up — there was no team to inherit, so I started one from nothing.

That meant hiring four engineers, working out how we'd operate, settling on a technical philosophy, building the delivery pipeline, and setting the cultural tone — all while delivering against live MOD requirements from the first week.

I reported to Francesca Wise, who had also been my manager at UKCloud — a relationship of mutual trust that gave us a strong foundation from the start.

---

## The Technical Mission

### The Environment

We delivered automation solutions for Project NEXUS — the RAF's Air Information Platform — and other MOD programmes. Project NEXUS is the RAF's Combat Cloud: a sophisticated digital infrastructure designed to deliver decision superiority by connecting sensors and effectors across domains and classifications.

The deployment context was unlike standard cloud or enterprise work. Multiple physically air-gapped environments, each at different classification levels, with no internet connectivity and no intercommunication between them. Every piece of tooling, every configuration, every software artefact had to be physically transported to the target environment.

There was an additional constraint: staff were not always read into all customer projects. This meant our automation had to work without any environment-specific knowledge embedded in the tooling. Classification-agnostic by design.

### Our Approach: Automation-First, Fully Auditable

From the start, I set the team's direction: **automation-first, fully auditable deployment.** No manual steps, no snowflake configurations — nothing that couldn't be inspected, replicated, and verified at any classification level before it ran.

In practice, this meant:

- Our configuration management tool as the primary delivery mechanism
- All automation wrapped in container images — portable, version-controlled, self-contained
- Any code auditable and inspectable at any security level before execution
- Configuration examples supplied to each environment — enabling deployment without exfiltrating environment-specific details
- All artefacts packaged with the full tooling needed for a consistent deployment environment

At the heart of this was a self-contained deployment container I designed — internally nicknamed the **briefcase** — built to carry our automations into the air-gapped environments. It bundled the automation, its dependencies, and the tooling needed to run it into a single, portable, auditable package: open it in the target environment and everything needed to deploy was inside. One of my engineers then added a neat layer of orchestration on top, so the automations inside ran in a clean, ordered sequence. This was orchestration aimed squarely at the engineers doing the deploying — technical and deliberate, built for the unusual constraint of shipping software into networks you can't reach over a wire.

I called this approach **[flock of sheep, not pets](/devops/principles/flock-not-pets)** — a philosophy where no VM or configuration instance is special. If something fails, you replace it with an identical one. You care about what the service produces, not about any individual instance. This is the same immutable infrastructure philosophy found in containerisation, applied at the VM level.

We started with an MVP and added functionality iteratively, following Agile principles. By the time I left, the team had delivered the full automated deployment pipeline and the standardised OS image build.

### Hardened OS Image Pipeline

A key part of our roadmap was taking control of the entire automation supply chain at the source: the base VM image.

One of my engineers expressed an interest in security hardening. Rather than directing him to harden individual services downstream, I pointed him at the image supply chain and gave him ownership of the problem at the base level. He spent time learning the infrastructure-as-code and image build tooling independently, worked through our security standards alongside industry best practice, and produced a hardened OS image that could be built automatically and consumed by anyone in the business.

This image ensured consistent, security-verified baseline from development through to customer deployment — hardening baked into the supply chain, not retrofitted per-service.

It also became a case study in how I like to develop people: identify an interest, point it at a real problem, give them ownership, and let them surprise you.

### Platform Tooling & Core Services

Beyond application deployment, the team automated the deployment, configuration, and high-availability setup of all platform tooling and core infrastructure services across every environment:

**Platform tooling:**

- Secrets management (HSM-backed)
- Version control
- Documentation
- Automation orchestration

**Core infrastructure:**

- Identity services
- Database services
- Time services
- Repository services
- Federated services
- Logging and monitoring

All of it version-controlled, repeatable, and auditable.

---

## How I Led the Team

### One-to-Ones

I held regular 1-2-1s with each team member in an informal setting away from the main work area — not at a desk, not in a meeting room. Their time, not mine. The agenda was theirs: wellbeing, blockers, wins, frustrations.

For me, it was a way to check the mental health of the team, understand where I could act as a sounding board, and identify what tools or resources would help. It was also how I gauged engagement — with their current work, with adjacent teams, with the company overall.

### Personal Development Plans

I created PDPs for each team member, but not by assigning them tasks from a business wishlist. I started with their interests and career aspirations, then found the overlap with what the business needed. The difference is significant: people bring genuine energy and curiosity to work they care about.

This approach generated a team that brought ideas to the table and actively investigated new technologies and approaches — not because they were asked to, but because they wanted to. The OS image pipeline is the clearest example: one engineer's interest in security became a company-wide capability because we created space for it.

I used PDPs and 1-2-1s together to identify knowledge gaps — both within the team and in the wider business — and then found the right resources to address them: dedicated learning time, training courses, software trials.

### Daily Standups

Standups kept me and the team aligned on progress, particularly when engineers were working in pairs or individually on parts of a larger task. Later, I merged our standup with an adjacent team's to foster closer working relationships and shared visibility across team boundaries.

---

## Automation-First at Board Level

Early in my tenure, there was organisational pressure to take shortcuts — to "just get it done" manually and move faster. I understood the instinct. Manual deployment is faster in the short term.

I pushed back. I made the case to the board of directors that in our environment — air-gapped, multi-classification, physically isolated — there was no viable long-term alternative to automation-first. Manual deployment in this context meant inconsistency, unauditability, and brittleness. The cost of getting it wrong in classified environments is disproportionate.

The board agreed. Automation-first became the company standard for deployments.

It's one of the moments I'm proudest of from this role — less for the technical argument itself than for what it took to win it: turning a technical principle into a business case, and holding the line on it under pressure.

---

## The Outcomes

**Deployments that just worked.** Feedback from other teams and leads consistently described our deployments as zero-touch after initial rollout. No hand-holding required.

**Work that outlasted the role.** Long after I left, my counterpart team lead reported that while other teams were still troubleshooting their deployments, ours remained stable and functional with no intervention required. I find that more meaningful than any uptime metric.

**Cross-environment improvement cycle.** Any issue resolved in one environment was implemented across all four, creating a continuous improvement loop that benefited the full programme.

**Automation-first as company standard.** A technical principle I argued for became company policy.

**Foundation for IBM.** SiXworks was acquired by IBM Consulting six months after I left. The capabilities IBM acquired — defence digital transformation, automated secure deployment, classified environment expertise — were built by teams like mine.

---

## The Roadmap I Left Behind

By the time I left, the team had delivered the core: full automated deployment pipeline and hardened OS image. The planned next phase was active monitoring combined with runbook automation:

- Automatically detect service failures
- Attempt automated restarts
- Escalate to reboots or VM replacement if needed
- Full logging throughout
- Automated incident channel and war-room establishment on failure

The vision was a system that could detect, respond, escalate, and report on failures without human intervention — right through to spinning up a replacement instance and notifying the right people. We hadn't begun implementation, but the architecture was clear.

---

## Training

During this role I completed the **CMI People Leadership Programme** with a **Distinction** (Level 3). I had started the programme in April 2022 while at UKCloud, and concluded it in October 2023 at SiXworks. The formal qualification reinforced and gave language to the people-focused leadership practices I'd developed through experience. I'm grateful to colleagues and managers at SiXworks who supported me through it.

---

## Technology

> All tools referenced by function. Company remains active.

### Automation & Infrastructure as Code

- Configuration management and deployment tool — primary delivery mechanism
- Infrastructure-as-code platform — environment and VM provisioning
- Automated image build pipeline — OS image creation and security hardening
- Container runtime — deployment packaging; portable, auditable, version-controlled

### Infrastructure & Platforms

- Virtualisation platform — primary platform across all environments
- Linux (Debian-based) — primary operating system
- CMDB — configuration and asset management

### Supporting Services (Deployed & Maintained)

- Secrets management platform (HSM-backed)
- Version control platform
- Documentation platform
- Automation orchestration platform
- Monitoring platform
- Core services: identity, databases, NTP, repositories, federated services, logging

### Security & Practices

- OS hardening — supply chain level (base image)
- HSM-backed secrets and encryption-key management
- Classification-aware, auditable deployment
- Immutable infrastructure — [flock of sheep, not pets](/devops/principles/flock-not-pets)
- DevSecOps
- Infrastructure as Code
- Agile delivery (MVP-first, iterative)
- Zero Trust architecture

---

## The Departure

In January 2024 I moved to Belgium to join my partner, which brought a chapter I'm genuinely proud of to a close. The team and the standards I'd built carried on after I left — and I went knowing the work was in good hands.

---

## Why SiXworks Matters

This role was where everything came together. Technical depth from UKCloud, leadership foundations from the CMI programme, and an opportunity to build something from nothing in one of the most demanding technical environments I've worked in.

Building the Platform Services team — watching engineers develop, defending the right approach at board level, delivering infrastructure for the RAF's Air Information Platform — was the most complete expression of the technical leader I'd been working to become.

The IBM acquisition said something about what the team built. But the deployments still running long after I left say more to me about how we built it — and that's the part I keep coming back to.
