---
title: "The Unmanaged Supplier in Your Stack"
date: 2026-05-21
author: Tristan Findley
categories:
  - Journal
tags:
  - ai
  - claude-code
  - ethics
  - vibe-coding
  - keycloak
  - oidc
description: "A personal policy on building purpose-built work tools with AI coding agents — what's fair game, what isn't, and how I draw the line."
showTableOfContents: true
draft: true
---

Organisations and their employees are adopting AI tools at an ever increasing rate. Not a day goes by when I don't hear about the use of AI in someones workflow now. We use it for everything, from accomplishing the mundane and monotonus tasks, to companies replacing entire groups of employees with their new digital worker.

From a fellow employee in one of these spaces, and one that has long faught the use of using AI in my own work, even I've had to succume to the

## Article Brief: The Unmanaged Supplier in Your Stack

### Premise

Organisations are adopting AI tools rapidly, restructuring around them, and depending on them — without applying the governance frameworks they'd apply to any other supplier or contractor. This isn't an anti-AI argument. It's a risk awareness one.

---

### Structure & Talking Points

#### 1. The Supply Chain Nobody Is Auditing

- In any other context, third-party code entering your systems triggers supplier qualification, IP checks, SBOM entries, acceptance criteria
- LLM output enters codebases, documentation, and workflows daily with none of that
- Questions to answer:
  - If a developer leaves and nobody can support the code they generated, who's accountable?
  - What's your organisation's position on IP ownership of LLM output?
  - Where does AI-generated code sit in your SBOM?
- Note: NIST SP 800-161 and OpenChain/SPDX are the reference frameworks here if you want to anchor it

#### 2. The Rug-Pull Risk

- Organisations are making headcount and capability decisions based on AI tools whose pricing, capability, and availability are not contractually guaranteed
- LLM providers are burning cash; pricing models will change; capabilities shift between versions (sometimes backwards)
- The famous case: GPT-4 quietly got worse at certain tasks mid-deployment — enterprises noticed in production
- Questions to answer:
  - Has your organisation modelled what happens if your primary AI tool doubles in cost, degrades, or disappears?
  - Is AI capability baked into delivery commitments or headcount justifications?
  - What's your exit strategy from a specific provider?
- Note: Frame this like any other single-source supplier risk — not "AI will disappear" but "unmodelled dependency is a business risk regardless of the supplier"

#### 3. Shadow AI — The Outsourced Employee

- The classic case: "Bob", the Verizon developer (~2013) who outsourced his entire job to a Chinese development firm for a fraction of his salary. Caught via VPN anomaly. Excellent code quality. Nobody noticed for months.
- Now that pattern is accessible to anyone with a ChatGPT account and no VPN required
- Employees are augmenting, delegating, and in some cases fully substituting their own work with AI — outside sanctioned tools, outside data governance policy
- Questions to answer:
  - Does your organisation know what data employees are pasting into non-sanctioned AI tools?
  - If an employee delivers AI-generated work without disclosure, where does liability sit?
  - What does "doing your job" mean when AI can do the mechanical parts?
- Note: This isn't purely a security/compliance issue — it's also a skills and trust issue. The Bob case is a useful hook because it predates AI entirely; the behaviour isn't new, the scale and accessibility is

#### 4. The Atrophy Problem — Strategic Use vs Passive Dependence

- Critical thinking, problem decomposition, debugging instinct — these are use-it-or-lose-it skills
- If junior engineers never have to reason through a problem without AI assistance, what's the shape of your team in five years?
- "Strategic use of AI" as the constructive framing: AI as a force multiplier for people who already have the skills, not a replacement for developing them
- Questions to answer:
  - Are your hiring and development practices accounting for AI-assisted work, or measuring outputs that AI could have produced?
  - Is your organisation aware that it may be systematically reducing its own critical thinking capacity?
  - How do you assess competence when the tool is invisible?
- Note: There's a parallel to GPS navigation atrophying spatial reasoning, or calculators and mental arithmetic. The question isn't whether to use the tool — it's whether you're maintaining the underlying capability

---

### Tone Notes

- Write as someone who uses AI daily and finds it valuable — that gives you standing to make the critical points
- "Be aware" not "be afraid" — every section should have an implicit "here's what good looks like" even if you don't spell it out
- The supply chain framing is your differentiator — it gives the piece a structural backbone that most AI commentary lacks

---

### LinkedIn Hook Angles

- Lead with the Bob/outsourcing story — it's instantly relatable and slightly uncomfortable
- Or lead with the supply chain question: *"Would you onboard a contractor with no CV, no references, no IP agreement, and no support SLA? You probably already have."*
- Keep it to 3-4 punchy lines then link — don't summarise the whole piece

---

### Reference Points Worth Pulling

- Bob/Verizon outsourcing case (2013, widely reported)
- NIST SP 800-161 — supply chain risk management
- SBOM / OpenChain for the software provenance angle
- GPT-4 capability regression reports (2023) for the rug-pull section
- Any recent LLM pricing changes (OpenAI, Anthropic) to ground the cost uncertainty point
