---
permalink: /devops
title: "DevOps"
description: "DevOps from the Ops side — the systems-administration lineage: infrastructure as code, reliability, and auditability, security-first."
excerpt: ""
toc: false
classes: wide
layout: simple
showPagination: false
---

## There are two DevOps

Somewhere along the way, "DevOps" came to mean two quite different things — and the difference matters enough that I want to be clear about which one I am.

One DevOps grew out of **software engineering**. In this world, DevOps is a software practice: developers owning the full lifecycle of their applications, building the pipelines that ship their own code, instrumenting what they've written — *you build it, you run it*. The centre of gravity is the application, and the operations work exists to serve its delivery.

The other DevOps grew out of **systems administration** — and that one's mine.

In this world, DevOps is what happened when systems people stopped configuring infrastructure by hand and started treating it as code. It's the discipline of bringing software-engineering *rigour* — version control, testing, peer review, repeatability — to infrastructure and operations. Its centre of gravity is the platform: reliable, reproducible, auditable systems that other people's applications stand on. It leads naturally to Infrastructure as Code, to Site Reliability Engineering, to immutable infrastructure. The code I write isn't the product — it's how the product stays up.

### Why I draw the line

Both are legitimate. Both call themselves DevOps. But they attract different people, value different things, and — in a hiring conversation — talk past each other constantly.

I've lost count of the times I've been pitched roles built for the first kind: heavy application development, microservices, "you'll be writing a lot of Go." That's good work. It just isn't mine. I came up through more than a decade of hands-on infrastructure before I ever wrote a line of Infrastructure as Code — and that's the whole point. I bring the instincts of someone who has *run* systems: hardened them, migrated them, kept them up, and been on the end of the pager. Then I bring engineering discipline to all of it.

### The slash matters

DevOps has a slash in it for a reason — it's the meeting of two worlds. I came to it from the **Ops** side, and I've spent my career bringing the **Dev** discipline across the line: making infrastructure that's as version-controlled, tested, and reviewable as any application — without ever forgetting that its job is to *run*.

If that's the kind of DevOps you're after, we'll get on well.

* * *

## The principles I work by

DevOps is more than a toolkit — it's a mindset. It's the commitment to build systems that are repeatable, resilient, observable, and secure, while never losing sight of the people who run and depend on them.

- **Automation first:** Manual work is waste. Automation should be reusable, sustainable, and documented so it can be understood and improved by anyone. My Ansible roles, Terraform modules, and CI/CD pipelines are designed for repeatability, resilience, and auditability.

- **Disposable, by design:** Infrastructure should be disposable, redeployable, and recoverable. We don't need to cling to broken systems — we replace them. The real value lies in data, code, and service delivery. "Flocks, not pets".

- **Observability as governance:** Monitoring isn't an afterthought. Systems must be self-healing where possible, and failures should be visible, measurable, and traceable. Observability is a shared responsibility, not just a tool.

- **Security by design:** Compliance isn't bureaucracy — it's reliability. From ISO27001 practices to NIS2 readiness, strong policies like change management and major-incident frameworks allow rapid iteration with lower risk.

- **People at the core:** DevOps is a team sport. Tools and processes succeed only when teams are engaged, trained, and empowered. Coaching, mentoring, and setting a shared vision matter as much as YAML and pipelines.

- **Pragmatism over perfection:** Not everything needs automating. Sometimes speed trumps purity. The art of DevOps is knowing when to script, when to automate, and when to just get the job done.

### Why I do this

I'm motivated by the impact: seeing teams succeed because the friction has been removed, systems scale because the foundations are solid, and individuals grow because they feel supported and part of a shared vision. DevOps is not the destination — it's the constant journey of improving how people and systems work together.

* * *

## Principles in depth

Longer-form essays unpacking individual principles from the manifesto above:

- [**Flock not Pets**](./principles/flock-not-pets) — why I treat servers as a flock of sheep rather than a herd of cattle, and what that means in practice.
