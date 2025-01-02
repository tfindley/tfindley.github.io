---
author: Tristan Findley
date:   "2025-01-01"
categories:
  - Site Updates
tags:
  - content
  - wordpress
  - update
showTableOfContents: false
draft: false
title: Happy New Year, Happy New Site.
---

A Happy New Year for 2025 to everyone, and time for a long overdue update about this site. 

While I really don't want to make this post about Wordpress and the loooong history of my web presence, it is where we have to begin.

I got started with Wordpress during my time working at Royal Holloway University, when we were looking for a multi-site capable hosting solution. This was back before 2010, when there wern't that many good solutions out there. The target audience for the deployment was the Mathematics, Information Security and Computer Science department academics and researchers, so a real mix of technical ability. We chose Wordpress for ease of management, simplicity of use and content creation, and the scalability that the platform offered. Of course I was fairly taken with what Wordpress offered, so spent some time building my own websites using this solution. I even started a small side business venture, running some websites for people I knew for their businesses. This of course meant I needed to host it in the cloud, as running my own webserver for someone elses site wasn't a great idea, as security, maintenance and reliability would of the underlying platform would have to factor into the decision. So purchasing some cloud-hosting was a sensible solution, and for many years I operated a multitude of sites from this solution, my own multisite Wordpress instance included.

Fastforward to the end of 2023 - I've succesfully offboarded my customer sites to different solutions (customer churn is nothing new), leaving me ready to embark on the next chapter of my life. However this left me with a small problem - where to run my own site?

Over the years I've experiemented with different self-hosting solutions, but for Wordpress this was mostly virtual machine based (full fat) hosting, and this was indeed what I migrated to as a stop gap solution.

This next chapter was something larger than even I could have thought about though - a move from the UK to Belgium. Of course I couldnt bring my home servers with me, so I consolodated my considerable amount of storage from a TrueNAS Scale solution into a SSD-based storage appliance. Included with this was the ability to run Docker containers. A bit of time later and my once full-fat Wordpress install was happily hosted in a Docker container.

Over the months that followed I fronted the entire hosting solution with Traefik. This solution allowed me to replace my manual nginx-based reverse proxies with an integrated and elegant solution that handled, amongst other things, my entire TLS layer, simplifying the entire cert renewal process and integration with Gandi's LiveDNS service for DNS-01 based site verification.

Now nearly a year on from my move, I find myself with an outdated Wordpress site, and a decision that I have to make - keep maintaining a Wordpress instance or migrate to something else?

With all the recent controvosies in the industry with Wordpress, my decision was looking more and more likely towards full site migration. But to what? A Very intelligent colleague who I've had the pleasure of working with (Jimmy) once mentioned static site generators to me. So.... why not?

My logic behind moving away from Wordpress to a SSG is simple - Using Wordpress requires a lot more effort than it should, even with its WYSIWYG interface. I want a site that 'gets out the way' when I want to create content, but has the half-dozen or so key features that I require when creating content. I spend most of my time working in Visual Code (and Joplin for my note taking), so I would like a system that would support Markdown. This also makes my content platform agnostic - I could simply move my content out of the SSG as it's in a completely open format. Moving away from Wordpress also reduces my dependence on theme-specific or plugin-based features that tie me into specific themes or plugins, requiring a lot of additional (re)work to move away from it. Additionally removing the online management plane controlling the content grately improves security of the site and lowers my risk profile. SSG's are well known to work well with Git so version control can take care of most of that.

So a bit of research later, and I landed on Jekyll. I prototyped a new site in it but ultimately I couldn't get it to look like I really wanted, so back to the list of Static Site Generators I went, and landed this time on Hugo. That brings me to this new site - this represents a merge of four sub-sites hosted in Wordpress, most importantly my 'about' site which is my online CV/Resume and companion to LinkedIn and my paper CV, down into a single generated site. A single theme no governs the entire site, allowing me to create a consistent brand across all of the different disciplins that I promote through here. Most notably my Photography site, my pride and joy for many years, has undergone a complete reduction, as did my journal and technical site presense. Some of this is due to lack of time to migrate away from an aging Wordpress installation, and part of this is a lack of desire to maintain what I would no longer consider content that best represents me.

As part of the migration I've brought across most of the content that had some actual 'content' to it. Most of this is already in place, however some of the static content needs a total rewrite. A lot of what I want to use this site for needed to be thought through, but more than anything I wanted a new place that I could talk about tech - things I've learned and found, things I've deployed, and my experiences and thoughts. It's been a long time since I've just created posts that do that, and I feel some of that has been the 'cost of entry' of using Wordpress.

So, watch this space. Hopefully a new simpler site will give me the inspiration I need to create more short and medium form content, cross-post that to LinkedIn, and to help me build my own brand and image again. AS I write this post, the site is not yet live. In fact I'm working offline from the hair salon while I wait for my partner to finish getting her hair done. I couldnt have easily done that with Wordpress. Thinking about it, there's still a few things for me to get done with Jekyll, some of which I'd probably like to write about once I've explored solutions for them, and I still have to learn some of the platform. But for the first time in probably 10 years I actually find myself wanting to write, and share what I'm up to.
