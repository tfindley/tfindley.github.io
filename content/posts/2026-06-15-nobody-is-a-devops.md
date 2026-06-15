---
title: Nobody is a DevOps
date: 2026-06-15
author: Tristan Findley
categories:
  - Technical
tags:
  - devops
  - sre
  - platform-engineering
  - career
description: "DevOps Engineer is one of the most-advertised job titles in tech — and purists insist DevOps isn't a job at all. Both are kind of true. Here's how I square it, and where I fit."
showTableOfContents: true
draft: true
---

Two of the most common things said about DevOps flatly contradict each other.

On one hand, "DevOps Engineer" is one of the most-advertised job titles in the industry — tens of thousands of open roles at any given moment. On the other, the people who were there at the start will tell you, with some conviction, that DevOps isn't a job at all.

Here's the awkward thing: they're both kind of right. And untangling *why* turns out to be the most useful way I know to explain what I actually do for a living.

Let me start with the provocation that the purists are pointing at: **you can't hire someone to "do DevOps" any more than you can hire someone to "do Agile."**

## Where DevOps actually came from

DevOps was coined in 2009 — Patrick Debois, the first DevOpsDays. It wasn't a toolset and it certainly wasn't a job description. It was a *culture* — a movement to dissolve the wall between Development and Operations, the two tribes that had spent decades throwing software over the fence at each other and blaming whoever was on the far side when it broke.

The whole point was collaboration, flow, fast feedback, and continuous improvement. And if you read the frameworks that grew up to describe it, they describe *organisations*, not people. **CALMS** — Culture, Automation, Lean, Measurement, Sharing. The **Three Ways** from *The Phoenix Project* — flow, feedback, and continual learning. Not one of those is a job spec. They're descriptions of how a whole team works.

So by that logic, "DevOps Engineer" is almost a contradiction in terms. DevOps is a way of working, not a person you hire. The purists have real pedigree on their side.

## So… is it a job?

The market says yes — emphatically. And I think fighting that is a losing battle, for a simple reason: **language follows usage, not etymology.** "DevOps Engineer" has come to mean something real and well understood — the person who builds and runs the automation, tooling, and infrastructure that lets the DevOps way of working actually happen. Insisting it's "not a real job" is technically pure and practically pointless. It's like insisting "literally" can't mean "figuratively." You're correct, and nobody cares.

But the purist instinct is catching something real, and it's worth saying out loud: **"DevOps is everyone's responsibility" reliably degrades into "nobody owns the platform."**

Culture with no owner is just a poster on the wall.

## Someone has to build the paved road

Here's where the role earns its existence. The enabling platform — the automation, the pipelines, the infrastructure-as-code, the golden paths that let product teams ship safely without reinventing the plumbing every time — that is a genuine specialism. It needs people who own it, maintain it, and are accountable for it.

That's real engineering. It requires real expertise. So the role exists for a good reason, even when the *label* on it is imprecise.

This is the bit I do.

## The resolution: philosophy, practice, role

The industry has, quietly, mostly settled this — and the resolution is the genuinely interesting part.

**DevOps is the philosophy. Platform Engineering and SRE are the roles that implement it.**

*Team Topologies* (Skelton and Pais) formalises it: a platform team provides self-service capability so that product teams can own their full lifecycle without drowning in infrastructure. Google puts it even more bluntly — *"class SRE implements DevOps."* SRE is a specific, opinionated implementation of the philosophy.

And while we're here — the related terms aren't synonyms. They're a *stack*, not a single thing:

- **Agile / Scrum** — how you organise and deliver work (and it predates DevOps).
- **DevOps** — extend that flow across the Dev→Ops boundary, all the way to production.
- **CI/CD** — a practice and toolchain that makes it possible.
- **SRE / Platform Engineering** — specific, opinionated roles that implement it.

They nest. *Philosophy → practice → role.* They don't collapse into one job title, however much the recruitment market would like them to.

If you want the bumper sticker: **DevOps is the verb; Platform Engineering and SRE are the nouns.**

## So what am I, then?

I'm not "a DevOps." Nobody is. I'm an engineer who builds the platforms that make the DevOps way of working possible — and I come at it from the **Ops** side of the slash.

I spent more than a decade running infrastructure by hand before I ever wrote a line of Infrastructure as Code — racking, hardening, migrating, patching, and being on the end of the pager when it all went wrong at 2am. Then I brought the *Dev* discipline across the line: version control, testing, peer review, repeatability. That's the whole shape of me. I didn't arrive at DevOps from software engineering wanting to get closer to operations; I arrived from operations, and learned to treat infrastructure as code.

In practice, that means infrastructure that is **defined as code, repeatable and auditable, reliable by design — a flock, not a pet — and secure from the base image up.**

And the throughline that ties all of it together is the thing the purists are most right about: **continuous improvement.** The platform is never "done." That's not a failure state — it's the job.

If I'm honest, *Platform Engineering* is probably the more precise title for what I do. But I'll answer to all three.

Call it DevOps, call it Platform Engineering, call it SRE — I'll come either way. What I actually do is build infrastructure that's reliable, repeatable, auditable, and secure, and that keeps working long after I've moved on. The title is negotiable.

That part isn't.

---

*This is the longer think-piece behind my [DevOps manifesto](/devops) — the short version of where I stand, and which DevOps is mine.*
