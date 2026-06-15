---
title: "The Ethics of Vibe-Coding Purpose-Built Tools"
date: 2026-05-19
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

## Why this post exists

"Vibe coding" is a term that arrived faster than the discussion around it. The label is now widely used — usually pejoratively — to describe building software by talking to an AI agent and accepting most of what it produces. For purely personal projects, that framing is fair enough. The stakes are low. If you vibe-code a Pomodoro timer that crashes, the only person inconvenienced is you.

But I've increasingly been using AI coding agents — primarily [Claude Code](https://www.anthropic.com/claude-code) — to build **purpose-built tools that touch my professional work**. Tools that connect to systems I administer at $DAYJOB. Tools that read real production data. Tools that, on a bad day, could meaningfully break things.

That's a category that deserves a more deliberate discussion than the "vibe coding" framing typically gets, and I want to be on record about how I approach it. This post sits alongside the site's broader [AI Policy](/legal/ai), but is specifically about **purpose-built tooling** rather than content or general AI-assisted code.

These are the principles I work by.

---

## The principles I work by

### 1. Build for the problem in front of you, not the abstraction behind it

Every tool I've shipped this way solves **one specific problem I had hit in production that week**. The [Keycloak Group Attribute Editor](https://github.com/tfindley/Keycloak_Group_Attribute_Editor) exists because the Keycloak admin UI was making a particular task miserable on a particular Tuesday. The [Keycloak User Query](https://github.com/tfindley/Keycloak_user_query) tool exists because answering "where is this user's `department` attribute coming from?" through the UI takes minutes of clicking.

I don't try to build a "Keycloak admin CLI v2." I don't try to build "the missing toolkit." I build the smallest thing that resolves the specific pain in front of me. The agent will happily build something larger if I let it — and I don't let it.

**Why this matters ethically:** a small, well-scoped tool is one I can fully read, fully understand, and fully test. A sprawling toolkit is one I shipped on trust.

### 2. The agent doesn't get to decide what's in scope

This is the discipline I've found hardest to maintain. Claude is genuinely good at noticing adjacent problems — "I see you're editing this attribute, should we also add a bulk-edit mode?" — and the temptation to say yes is constant.

I say no. Scope is mine. I'm the product owner; the agent is the engineer. The engineer can suggest. The PO decides.

### 3. Data sovereignty is non-negotiable

Any tool that touches systems I administer at work follows three rules:

1. **Runs locally.** No remote dependencies, no cloud calls, no telemetry. The Python utilities are CLIs that run on my workstation. The OIDC Diagnostics tool is a static HTML page that runs in the browser. Nothing more.
2. **Takes credentials at runtime, never at rest.** No hardcoded tokens. No stored credentials. Auth happens at invocation; the tool forgets when it exits.
3. **Ships nothing externally.** No analytics. No "phone home." No error reporting. If the tool sees production data, that data ends with the tool.

There is one place where this comes into tension with how AI coding agents work: when I'm building these tools, **the agent can see my code and prompts**. So I never paste real production data into a prompt. Test fixtures are fabricated. Schemas are described abstractly. The agent learns from the *shape* of the problem, not the contents.

### 4. Open-source what's reusable, private what's contextual

The Keycloak utilities are public on GitHub. They contain no secrets, no employer-specific configuration, no business logic that belongs to anyone but me. They could be used by anyone running a Keycloak deployment.

[LoraTraps](https://github.com/tfindley/LoraTraps) is private, because its design encodes contextual choices that aren't mine to share. The distinction isn't "is this clever?" — it's "is this *mine* to give away?"

When in doubt, private. It is much easier to open-source something later than to put a leaked thing back in the bottle.

### 5. Tested by me, not by the agent

The agent will say it has tested the code. It hasn't, not in the way I mean. It has compiled it, it has run a unit test it wrote itself, and it has reasoned about the output. **It has not used the tool the way I will use it.**

So I test. Every change. I run the tool against a real (but disposable) test environment. I try the edge case I know it forgot. I read the logs. When something is broken, I don't accept "I've fixed it" — I reproduce the failure, I describe what I saw, and I push back until the fix is real.

For purpose-built work tools, this is the most important principle on the list. The quality of the tool is almost entirely a function of the rigour of the human QA pass.

### 6. Attribution is honest

The README of every AI-led repository says it was built with Claude Code. The commit messages don't hide it. The tag `claude-code` is on the repo topics. I don't pretend to be the author of code I co-wrote with an agent any more than I'd pretend to be the sole author of a paper I co-wrote with a colleague.

**Why this matters:** because the alternative — opaque attribution — erodes the trust that makes AI-led work viable in a professional context at all. If I'm transparent, my colleagues can make informed judgements about my output. If I'm not, I'm asking them to trust a black box, and they shouldn't.

---

## A worked example: the Keycloak toolset

The three Keycloak utilities — [User Query](https://github.com/tfindley/Keycloak_user_query), [Group Attribute Editor](https://github.com/tfindley/Keycloak_Group_Attribute_Editor), and [User Migration](https://github.com/tfindley/Keycloak_User_Migration) — are the clearest examples I have of these principles in practice.

Each one began as a real production friction. Each took an evening to build. Each is small enough that I can read it cover-to-cover in fifteen minutes. None of them would exist without AI assistance — the friction-to-value ratio for "spend a weekend writing Python" was too high before, and is approximately zero now.

But the ethics aren't in the implementation speed. They're in what I chose to scope:

- **No tool ships secrets.** Credentials come from environment variables or interactive prompts.
- **No tool writes anything destructive without a confirmation step and a backup.** The Group Attribute Editor takes a JSON backup before *any* write.
- **No tool assumes a specific Keycloak deployment.** All endpoints, realm names, and connection details are runtime parameters.

The User Migration tool is currently marked WIP and isn't safe to point at production. **That's also an ethical position.** I'd rather have a tool that says "don't use me yet" than one that quietly does the wrong thing with someone's user database.

## A second example: OIDC Diagnostics

[OIDC Diagnostics](https://github.com/tfindley/oidc-diagnositcs) is the tool I now reach for whenever I'm wiring up a new Keycloak realm or debugging a misbehaving integration. It walks a real OIDC flow, decodes the tokens, and shows you exactly what came back.

The ethical choices baked into its design:

- **Client-side only.** No backend. No server. The entire thing is a static HTML page.
- **No claim ever leaves the browser.** What's in your tokens stays in your tokens.
- **No persistence.** Refresh the page, and everything is forgotten.
- **Open source.** Anyone can read the code and verify the above is true.

These choices weren't an afterthought. They were the brief. *Before* I started building, I'd written them down — because if I built the tool without them, the agent would have happily added a "save flow results" feature, or a "share this link" feature, and I'd have introduced exfiltration risk into a tool I built to debug security infrastructure.

The agent doesn't know what *security tools* are. I do.

---

## What I won't do

The negative space is as important as the positive:

- **I won't ship a tool I don't fully understand.** If I can't explain every meaningful piece of logic in a code review, I'm not the author yet.
- **I won't use a vibe-coded tool to bypass professional review or governance at work.** These are personal utilities, used at my own discretion, on my own machine. They don't enter the change-management pipeline. They don't go on shared infrastructure. They don't get blessed by the team as "the way we do things."
- **I won't pretend the agent's output is mine alone.** No false attribution. No claiming AI-generated code as solo authorship.
- **I won't build tools that would be uncomfortable to show my employer.** This is the sniff test. If the answer to "would I be happy to demo this to my manager?" is anything less than an immediate yes, I shouldn't have built it.

---

## Closing

Vibe coding isn't a virtue and it isn't a vice. It's a tool, and like every tool that's come before it, the ethics live in *how* you use it.

For personal projects, the bar is low. Build whatever you want. Have fun. The same has always been true of every personal coding project, AI-assisted or not.

For tools that touch your professional life, the bar is the same as it has always been: be deliberate about scope, be honest about authorship, be conservative with data, and never ship something you haven't tested yourself.

The agent has changed *what* I can build in an evening. It hasn't changed *what I'm responsible for* once I've built it. Those two things are easy to confuse, and I'd rather be very clear about which is which.

---

*AI Statement: this post was drafted collaboratively with Claude. The principles, examples, and positions are entirely my own.*
