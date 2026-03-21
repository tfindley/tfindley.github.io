---
title: "SiXworks Ltd"
excerpt: "Platform Services Team Lead"
toc: false
date: 2024-03-06
description: "Platform Services Team Lead"
showWordcount: false
showReadingTime: false
---

**Platform Services Team Lead**

01/02/2023 - 31/12/2024

I was brought in to build and lead the Platform Services team from the ground up -- assembling a team of four DevOps engineers to deliver automated deployment and configuration solutions across physically air-gapped customer environments operating at multiple levels of classification.

---

## The Mission

Our team operated as a Site Reliability Engineering function with a DevOps mindset, providing automation solutions and expertise to both our customer environments and the wider business. The goal I set from day one was to establish an **automation-first, fully auditable** approach to deployments -- replacing the prevailing culture of undocumented manual work with repeatable, version-controlled infrastructure.

## What We Built

We designed and delivered automation solutions for deploying software installations and configurations into **physically air-gapped environments** -- separate networks with no internet access or intercommunication, often under different classifications or projects. This presented a unique challenge: staff needed to contribute meaningfully to projects they were not read into.

Our solution used **Ansible** as the primary delivery mechanism, wrapped in **Docker images** for version-controlled deployments. This ensured all code could be easily audited and inspected at any classification level prior to execution. We supplied configuration examples to each environment, enabling easy implementation of our automation without any environment-specific details ever being exfiltrated.

The team would build these automations, package them as deployable artefacts, and either deliver them directly into environments or hand them off to other engineers to consume and deploy.

### Automated OS Image Pipeline

A key part of our roadmap was taking control of the entire automation supply chain, starting with the base VM image. One of my engineers expressed an interest in security hardening, so I directed him to look at our image supply chain and apply hardening at the base level rather than further down the pipeline. He spent time learning **Terraform and Packer**, then worked through our security standards alongside industry best practice to produce a hardened OS image that could be built automatically and consumed by anyone in the business. This image became the standard for both target environments and our local development infrastructure, ensuring consistency from dev through to customer deployment.

## Outcomes

- **Deployments that "just worked"** -- feedback from other teams and leads consistently reported that our deployments into environments were practically zero-touch after initial rollout. Long after I left, my counterpart team lead reported that while other teams were still troubleshooting their deployments, ours remained stable and functional with no intervention required.
- **Automation-first adopted at board level** -- I successfully made the case to the board of directors for an automation-first way of working, pushing back against pressure to "just get it done" manually. This set the standard for how the business approached deployments going forward.
- **Cross-environment consistency** -- any feedback received from one customer environment was implemented and benefited all environments, creating a virtuous cycle of continuous improvement.
- **Foundation for the business** -- our approach laid the groundwork for automation practices across the company, establishing patterns and tooling that other teams could adopt.

## How I Led the Team

**One-to-ones** -- I held regular one-to-one meetings with each team member in an informal setting away from the main work area, creating a safe space for open conversation. These were their time -- focused on their wellbeing, blockers, and frustrations. For me, it was a way of checking on the mental health of my team and identifying where I could act as a sounding board or provide the tools and resources they needed.

**Daily standups** -- These kept me and the team aligned on project progress, and were especially important when team members were working in pairs or individually on parts of a larger task. Later, we merged our standup with an adjacent team to foster cross-team communication and closer working relationships. I worked closely with that team's lead to deliver on shared goals.

**Personal Development Plans** -- I created PDPs for each team member, aligning their personal interests and career aspirations with business needs. This generated a passionate team that brought innovative ideas to the table and actively investigated new technologies and ways of working. Through PDPs and one-to-ones, I could identify knowledge gaps in both my team and the wider business, then find the right resources -- whether that was dedicated learning time during the week, training courses, or software trials.

## Training

During my time at SiXworks I completed the [People Leadership Programme](/about/training/plp/) with the Chartered Management Institute, earning a **Distinction** in People Leadership (Level 3). I had started the programme in April 2022 while at UKCloud and concluded it in October 2023. This formal qualification underpinned my approach to team leadership, reinforcing the people-focused practices described above.

## The Roadmap

My approach was to treat the entire environment as a **flock of sheep, not pets**. No configuration instance would be special -- if a VM failed, we could replace it with an identical one that performed the same function. We cared about what the sheep produced (the data in, stored, and out), not about any individual sheep. This is the same philosophy found in containerisation, applied to virtual machines.

We started small with an MVP and added functionality iteratively, following Agile principles. By the time I left, the team had delivered the full automated deployment pipeline and the standardised OS image build. The next phase on the roadmap was active monitoring combined with runbook automation -- automatically detecting service failures, attempting restarts, escalating to reboots or replacement if needed, with full logging and automated war-room establishment. We hadn't begun implementation, but the vision was set.

## Notable Projects

- Deployment of supported applications into four separate offline environments across multiple levels of classification, using automation and containerisation
- Continuous security analysis, hardening and patching of deployed services through automated pipelines
- Automated deployment, configuration and HA/DR of:
  - Internal tooling -- Vault, Git, documentation, service desk and automation orchestration for platform and project teams
  - Infrastructure base services -- IDP, database, NTP, repository, federated services, logging and monitoring
- Linux OS hardening and security review for automated image creation (Terraform, Packer)

## Technology

- **Automation:** Ansible, Terraform, Packer
- **Containerisation:** Docker
- **Infrastructure:** VMware, Linux (RHEL)
- **Security:** OS hardening, image supply chain, classification-aware deployment
- **Practices:** Agile delivery, CI/CD, Infrastructure as Code, version-controlled deployments

## My Responsibilities

- Build and lead a new team of four DevOps engineers with a diverse mix of skills
- Provide technical leadership, oversight, and direction aligned to business and customer needs
- Drive the adoption of automation technologies to deliver repeatable and reliable services
- Manage and execute projects using Agile delivery methods
- Engage with the business and board to shape service direction and champion new ways of working
- Collaborate with adjacent team leads to deliver on shared goals
