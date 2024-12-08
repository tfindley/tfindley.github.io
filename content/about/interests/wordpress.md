---
title: WordPress
---

I first encountered WordPress back in version 2010 while learning different Content Management Systems for deployment on my home-built web server. Comparing it to other platforms such as Drupal, Mambo and Joomla, WordPress came across as the most complete solution, although at the time I did not grasp the scalability or capability of the platform. Once I had a good enough grasp of the platform, I set about building a new website that encompassed an online resumé, photo gallery and blog.

For me, the use of WordPress has greatly reduced the amount of time I need to spend on building and maintaining a web presence.

## WordPress MultiSite at Royal Holloway

In 2011, Royal Holloway undertook a Website Redesign project in order to modernise their web presence. As the IT Team supporting three departments within Royal Holloway, we decided to move our departmental content from our own web solution (LAMP, running Drupal) into the new platform. While the overall redesign and migration was a resounding success, one of the shortfalls of the new platform was (at least in the the short-term) the inability to host smaller websites for individuals, groups, teams, projects or events. Inside of the department, we had no desire to continue supporting an out-dated Drupal installation, so a new solution had to be divised.

### Requirements

The solution would have to be:

- easy to administer, with minimum amount of effort and time needed to provision new sites
- appealing and accessible to users of varying technical experience, ranging from experienced web developers to users who understand how to use the essentials of Microsoft Word
- adaptable enough to scale to requirements of more advanced web developers
- scalable, so the platform could grow and develop over time
- require minimum setup time and knowledge from the users
- built on standards so data could easily be migrated to other platforms in the future
- authenticated against the Royal Holloway central platform (AD/LDAP)
- SSL (HTTPS) capable for secure logon and data submission
- Regularly and automatically backed up

### Technical Challenges

After researching other Content Management Systems, I settled on sticking with WordPress as it was the most familiar to the team and myself, the most user friendly, and ticked almost all of the requirements. Scaling WordPress for multiple users is straightforward, as the MultiSite functionality is included in the standard WordPress installation.

The biggest challenge that I could foresee was the ability to support multiple subdomains simultaneously - while I knew that WordPress could be installed to support a single subdomain or a single domain, I was not sure if it could be used to support multiple subdomains with sites hanging off of those.

One solution would be to install multiple instances of WordPress Multisite, one for each subdomain, however this immediately introduces administration complexity and overhead, as four individual instances would have to be maintained.

### Implementation

After researching the problem, it seemed possible to use a combination of plugins to allow WordPress Multisite to create sites outside of its designed scope. I specced a new Virtual Server, built the LAMP (Linux, Apache, MySQL, PHP) installation  and tailored it specifically to running WordPress, and prototyped the installation (this setup was largely based off the configuration of my own personal server). After a few iterations, the system was working, stable, and met all the initial design requirements.

### Use Today

WordPress MultiSite Layout at Royal Holloway

Today, the platform supports nearly 100 users across 32 sites across the isg.rhul.ac.uk  ma.rhul.ac.uk  cs.rhul.ac.uk  sub-domains, as well as sites at the rhul.ac.uk domain, as well as some off-domain content, such as vome.org.uk.

Shortly after the platform was launched, I developed a landing portal for its users. This platform offered a development news feed, resources for site administrators, assistance and document on common problems and issues, and a method of contacting myself or the team supporting the platform.

### Looking Ahead

Going forward, there are plans to engage with other users of WordPress within Royal Holloway, to offer them a migration route into our managed platform.

Other plans include;

Better SSL support
Migration to a cloud service provider for true off-site reliability
Implementation of a site-wide CDN (Content Delivery Network) such as Amazon Web Services (AWS) or CloudFlare

## WordPress in Business

In 2015 I began consulting with two local businesses to update their web presence. Given my existing experience with WordPress and their requirements of having a website that they could later manage in-house with little effort, WordPress seemed a logical platform to adopt.

## WordPress for Me

My own history of web hosting has been a varied and colorful one. Starting out with my very first website on Geocities (yes, I'm THAT old!), then moving to free hosting with NTL World, and then on to my own home-hosted web server running on Linux. While my sites were originally developed in pure HTML, I eventually moved all my content over to a WordPress platform, which has been running (in various iterations) since 2006.

Fast forward to 2016 when my single site has grown into a collection of 4 primary sites, I decided that running 4 stand-alone versions of WordPress was too inefficient and decided to migrate them into a single instance based on my design at Royal Holloway. By May 2016, the core platform was online, tested and stable, and all site content had all been migrated over to the new platform (minus the themes pending some colossal redesigns). This platform along with any other hosting is all done through SiteGround.