---
title: Phoenix Project - The importance of Monitoring
date: 2024-12-12
author: Tristan Findley
categories:
  - jekyll-update
  - Markup
tags:
  - content
  - wordpress
showTableOfContents: true
draft: true
---

# Monitoring

At my current point in The Phoenix Project (Part 2), we're at the point where our protagonists are debating whether or not to launch their Monitoring Project.

This, combined with my current work generating project documentation, got me thinking:

What is Monitoring, and how does it relate to the business, especially through Change Management and Major Incident Management.

## Why do we monitor?

> The operational risks of IT need to be managed just like any other business risks.

IT exists 

## Kinds of monitoring

### Technical

#### Internal Systems Monitoring

For VM's that will likely be
- CPU
- Memory
- Network

For Physical systems, we'll look at all of the above but also add some physical and environmental monitoring:
- CPU / Memory / Board / Chassis temperature
- Component Health - e.g: Disk SMART data
- Fan RPM
- Power draw

For these physical systems we can start taking the approach of proactive maintenance in order to reduce IT risk, but this is only possible with some components:
- Disks will likely raise SMART errors before the disk fails
- Fans (at least in servers) will often be installed in a bank of more than one, allowing a system to absorb the impact of a fan failure
- PSU's are often installed in pairs (or sometimes more), allowing a system to run with N-1 (so long as the current power draw doesn't exceed C*(N-1) (where C is the capacity of a single PSU))

On business critical applications where no downtime could be afforded, multiple servers can be utilised to provide redundancy. Of course none of this negates the need for an active support contract with fast service times. This is another data point we should monitor - Purchase dates of equipment and support contract End of Life (EOL). Should a server need to be replaced, its procurement time needs to be factored, as does its cost. This is part of the server's Total Cost of Ownership (TCO) along with its power costs.

While most IT Managers will be loathed dealing with budgets, annual costings should also be monitored closely, as server replacement costs can suddenly appear on a poorly planned upcoming year's budget.

#### Resource monitoring

Resource monitoring is a lot like Internal Systems Monitoring, but on a grander scale. This time we're not looking at resources that make individual CIs tick, but we're looking at what capacity we have in our platforms. These could include:
- CPU and Memory of a Hypervisor
- Disk space of a storage array
- Internet Bandwidth 

#### Endpoint Monitoring

Is the services live?

Is that service providing 'good' (expected) content?

#### Security

#### Logging

### Performance

- DORA Metrics (or DevOps Metrics)

### Non-Technical

#### Key Performance Indicators (KPIs)

- Business KPIs
- Customer KPIs
- IT KPIs

#### Customer Churn

#### Ticketing
    - Number generated
    - Time to completion

#### Change metrics
    - Input
    - Success
    - Failure
    - Length of change

### Pastoral

#### Employee wellbeing

#### Skills awareness

A good manager needs to constantly monitor the skills and capabilities of their teams. It is critical for an IT team to be current in the skills that the company currently requires, but also either have or be able to gain the skills required to elevate the company technology and services over the foreseeable future. A wide number of these skills will likely be driven by market direction, business need, and of course the technology industry itself. 

A commonly accepted way to track internal skills is through the use of a Skills Matrix. This can be used to map current business skill requirements and to identify areas of weakness or risk within IT teams. This can also be a useful platform for highlighting areas of possible peer-learning (a useful way to further improve the skills of the peer providing the knowledge

> The best way to become an expert in a subject is to teach it.

#### 

#### Customer Satisfaction

When I talk about customer satisfaction to IT peers, I'm usually met with a lot of confused stares: "IT don't deal with the customers". They're external. Or from my time in Research and Education: "We don't have customers, we have students / researchers / staff".

Well, those researchers and staff and students *are* the customers. So are other teams, or our peers. In fact anyone who consumes a service from your team is a customer. While I feel I'm going off down the ITIL route again here, I feel this mindset can provide a paradigm shift in providing services. If we treat everyone who consumes a service of function (our product) of ours as a customer, and we strive to excellent customer service, then that will continuously improve our product. This 'customer satisfaction' can be monitored, both through quantifiable means and by far more analogue methods. Listening to the feedback and identifying issues with the product can lead to small changes that provide big improvement to the overall product experience.

> There's no better way to unify a group than to collectively bash IT.

## Monitoring and Change Management

## Monitoring and Major Incident Management

