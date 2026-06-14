---
permalink: /devops/principles/flock-not-pets
title: "DevOps Principle - Flock not Pets"
description: DevOps
excerpt: ""
toc: false
classes: wide
layout: simple
showPagination: false
---

There's a well-known philosophy in infrastructure engineering called **"cattle, not pets"** — the idea that servers shouldn't be treated as irreplaceable individuals. A pet server is one you name, nurse back to health when it's sick, and dread losing. A cattle server is one of many identical units — numbered, replaceable, and designed to be destroyed and recreated without a second thought.

I prefer **sheep**.

It's the same principle with a more British sensibility, and it captures something important: it's not that you don't care about your infrastructure — it's that you care about what it *does*, not what it *is*. You care about the wool, not any particular sheep.

### Why It Matters

The traditional approach to servers creates fragile systems. When a server has been manually configured over months or years — patches applied by hand, settings tweaked in place, institutional knowledge accumulated in its filesystem — it becomes a pet. You can't easily replace it. You can't guarantee another server will behave identically. And when something goes wrong at 2am, you're nursing it back to health instead of replacing it.

Immutable infrastructure inverts this. Nothing is configured manually in place. Every server is built from a known, version-controlled image. Every configuration is applied through automation. If a server fails, you don't fix it — you replace it with a fresh one built from the same source. Your automation is the single source of truth.

The result: systems that are consistent, auditable, and resilient by design rather than by luck.

### How I Applied It

When I built the Platform Services team at SiXworks, this philosophy became the foundation of how we approached every deployment.

We operated across physically air-gapped environments — no internet, no intercommunication, artefacts physically transported to each environment. In a context like that, there's no room for "it works on my environment." Consistency isn't just nice to have — it's the only way to operate at scale across multiple isolated systems.

Our approach:

**1. Start with the image.** Rather than hardening individual services, we took control of the supply chain at the base VM image level. Every server we deployed started from a security-hardened, automatically-built image. Hardening happened once, upstream, and every downstream service inherited it.

**2. Automate everything above it.** Configuration, deployment, tooling — all delivered through automation. No manual steps. Nothing that couldn't be replicated exactly.

**3. Package for portability.** All automation wrapped in container images — portable, version-controlled, and auditable at any classification level before execution.

**4. Replace, don't repair.** When something goes wrong, the answer is a fresh deployment from the same source, not a manual fix applied in place.

### The Outcome

Feedback from the teams consuming our deployments was consistent: they just worked. Zero-touch after initial rollout. And they kept working — long after I left the role, I heard our deployments remained stable while teams using different approaches were still troubleshooting theirs.

That longevity is the proof. Infrastructure built on immutable principles doesn't accumulate entropy the way manually-managed systems do. There's no drift, no undocumented change, no "I wonder what someone did here three months ago." There's just the source, and what the source produces.

### The Next Step I Didn't Get To Build

The natural evolution of this approach — and the next phase I'd planned before leaving — is active monitoring combined with runbook automation: detect a failure, attempt a restart, escalate to a full VM replacement if needed, log everything, and automatically establish a war room for the on-call team.

The system detects. The system responds. The system escalates. Humans only enter the picture when the automation has exhausted its options.

That's where immutable infrastructure leads if you follow it to its conclusion: not just consistent deployments, but self-healing systems.

### In Summary

Sheep are not precious. If one gets lost, you don't go out searching for *that particular sheep*. You know it was healthy when it left the pen, because every sheep came from the same stock and was raised the same way. What matters is the flock — what it produces, and that it keeps producing.

Build your infrastructure the same way.