---
title: "University of Surrey"
date: 2017-02-13
description: "Systems Administrator / Automation Engineer"
showWordcount: false
showReadingTime: false
---

13/02/2017 – 31/05/2019

I began work for the Faculty of Engineering and Physical Sciences (FEPS) at The University of Surrey on 13 February 2017. working as a Systems Administrator  in a DevOps focused Systems Administration team of six.

Responsible for the delivery and development of the FEPS IT Infrastructure to support teaching, research and professional services. My primary focus is on Linux systems, comprising of a large server estate and desktop/lab estate running Ubuntu (LTS). I am an active developer on the FEPS Chef infrastructure which underpins our platforms, allowing for fast, responsive and collaborative development of our estate taking the ‘Infrastructure as Code’ approach.

As part of the FEPS Systems Administration team, we were jointly responsible for third-line support for support tickets escalated to us from first/second line User Support. I am responsible to ensure tickets are completed within the expected Service Level Agreement. Where I am unable to resolve tickets I must use my skills to research the problem and to develop a solution, and then ensuring that the solution is documented through our Knowledge Base.

Currently working on Storage Administration on Quantum StorNext (Research computing), Dell FluidFS (central infrastructure) and OnStor Bobcat (legacy infrastructure, migrating to FluidFS)
Managing a large Ubuntu (LTS) Server environment, including: Infrastructure, Web, Database, Compute, GPU, Terminal Servers, and general use servers
Managing the Windows Server infrastructure, including Terminal Servers, Compute and general use servers.
Support Business as Usual operations resolving SysAdmin and escalated support desk tickets (third line) within the Service Level Agreement set by FEPS IT Management
Use my skills to research and implement solutions, often requiring me to further develop my skillset beyond what I am already capable of.
Create detailed documentation to aid in knowledge transfer within the team, for use by other technical teams, or for customer use
License management and deployment through various different license managers (including FlexLM) on both Windows and Linux in both Terminal Server and Workstation environments, as well as identifying the need for new licenses and servers.

I was also responsible for developing and supporting the Windows Desktop and Server infrastructure in use throughout FEPS.

## DevOps

As systems administrators in the faculty, we managed our entire Linux infrastructure through the use of an automation tool known as Chef. This is underpinned by our in-house hosted version control system GITLab Enterprise.

### Environments

Our Chef infrastructure is split into two environments. Production and Test. Production covers around 95% of our workstations, labs and servers while the Test environment covers a small selection of computers from each category along with all 3rd-line FEPS IT workstations and Test VM’s.

Each environment has an associated GITLab Branch:

Changes are always built and submitted to development branches, and then merged into Test. Test is then merged into Master once changes have been verified (See Change Management for details). Submitting changes to Master and Test is not permitted through the use of Protected Branches.

### Change Management

When a change is made, the change is first tested using Test Kitchen, or by using chef-zero to apply it straight one of our own systems. Once the change is self-verified, the change is upload to GIT (Push) and submitted as a Merge Request to the Test branch. A stringent peer-review process is now undertaken by another member of the Systems Administration team. This could involve running the update on a local system, a VM, or simply by vetting the code visually. Once complete, the change will be merged into the Test environment and then immediately checked on various platforms. If no issues are discovered, the change will automatically roll out to other machines within a two-hour window.

Once the change has been in the test-environment for a suitable amount of time (minimum 2 weeks) then the change will be merged with the production environment. This is typically done after another peer review and the final merge into Production will rarely be done by the change author.

During the whole change process, we ensure that we can always back out of any changes we make through the use of the GITLab Version Control system as well as the in-built Cookbook version control system in Chef.

### Continuous Integration

Through the use of GITLab Continuous Integration runners (CI Runners), all Chef Cookbook changes are put through three phases. Syntax checking, Linting, Deployment. This is done through the use of a .gitlab-ci.yml file that automatically runs these stages.

All changes pushed or merged into branches are automatically checked for Syntax and Linting errors.

Any issues detected during the submission of code automatically throw errors, which are both emailed to the developer and pushed to Slack for instant notification.

Once these stages have been passed (successfully), the Deployment stage is entered, but only if this is run against the Master or Test branches.

## Areas of responsibility
The Faculty of Engineering and Physical Sciences is comprised of a number of Departments and Research Centers.

| Departments | Research Centers |
| ----------- | ---------------- |
| Chemistry | Advanced Technology Institute (ATI) |
| Physics | Center for Vision, Speech and Signal Processing (CVSSP) |
| Computer Science | Institute of Communication Systems (ICS) |
| Chemical and Process Engineering | 5G Innovation Centre |
| Mechanical Engineering Sciences | Ion Beam Centre |
| Civil and Environmental Engineering |  |
| Mathematics |  |
| Electrical and Electronic Engineering |  |
| Centre for Environment and Sustainability |  |


## Job Specifics

### Infrastructure

#### Virtualization vs Physical

A large amount of the UoS Server platform was built on VMware ESXi (with vSphere), or a legacy platform of Linux KVM hosts. During my time in FEPS I would frequently create new infrastructure in VMware. This would require careful consideration of Virtual Host capacity, as well as storage tiers and policies to ensure the correct backup and replication policy was applied to the correct infrastructure.

A large number of servers required for FEPS were for research-specific projects. I would discuss requirements with the academics or researchers to capture 

### Platforms

#### Chef

Chef Automate, Compliance, Inspec. FEPS IT Uses the Chef platform as the core component of our DevOps ‘Infrastructure as Code’ approach. Chef allows us to quickly and effectively deploy infrastructure changes to our entire estate using simple Ruby/Chef code in the form of ‘cookbooks’, immediately deployed to over 500 Chef clients across the Ubuntu estate.

#### GIT

Administrator of a  Locally hosted GITLab instance. Used in conjunction with Chef for development of cookbooks. Includes CI (continuous integration) / CD (Continuous Deployment), and administration of projects, groups, and server.

#### Monitoring

Zabbix, Grafana, GreyLog

#### SCCM

2012 version: packaging, software deployment, OS Installation / imaging for FEPS labs.

#### SVN

Administration, Maintenance

#### Apache

Migration, management, security, etc