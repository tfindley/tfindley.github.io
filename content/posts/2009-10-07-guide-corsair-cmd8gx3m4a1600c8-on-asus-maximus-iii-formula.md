---
title: "Guide: Corsair CMD8GX3M4A1600C8 on Asus Maximus III Formula"
date: "2009-10-07"
categories: 
  - "guides"
tags: 
  - "guides"
  - "hardware"
  - "reviews"
  - "solved"
  - "tech-problem"
---

With my recent experience of building two Core i5 systems on Asus Maximus III Extreme  Motherboards still fresh in my mind, I thought I would impart some of the knowledge to the general community to help people with similar or identical setups.

Before I begin, I must stress that; while this worked for me, it may not work for you. It could damage your hardware or software, so make sure you can get your components replaced under warranty should something go wrong. That said, I see no reason these settings shouldn't work.

### Components

- Asus Maximus III Formula (BIOS 0902)
- Intel Core i5 750 2.66GHz
- Corsair 8GB (4×2GB) XMS3 Dominator DDR3 PC3-12800 CAS 8 (8-8-8-24) (Rev 2.1)

### Backstory

![](images/8076-Memory-and-Fan-300x181.jpg "Corsair CMD8GX3M4A1600C8 Memory and Fan")

In my two recent system builds, I used Asus Maximus III Formula motherboards. Those of you who have used Asus motherboards before will know that Asus have a 'Qualified Vendor List' for RAM, in which they list all the RAM that is check and supported by each motherboard. For both systems, I initially purchased two sets of Corsair 4GB (2x2GB) Dominator PC3-12800 9-9-9-24 (TW3X4G1600C9D) RAM. One of these sets turned out to be faulty, and was returned to the supplier. As they did not have any more of that product in stock at the time, I opted to purchase a lower latency set of 8GB (4x2GB) for just over double the price, for Lakhota (my system). The RAM was not listed on the Asus Qualified Vendors List at the time, which I was fully aware of, however upon looking at the QVL I figured out that it should work without any hitch. Unfortunately, this was not so...

### Installation & Brief Review

Installation of the Corsair CMD8GX3M4A1600C8 went smoothly. The only two things I will note is that the power connector for the Fan pack could get caught in an unwary users CPU Fan if not channelled correctly, and that the Fan Pack does not fit 'too' well to the Asus Maximus III Formula as the DIMM slots only have the retention clips only on the tops of the DIMM slots, instead of on the top and bottom of the slots, which is the general standard for Motherboards. Don't get me wrong, the single-clip system is much better in my opinion (as you can not remove the RAM without having to remove the graphics card too), but it does cause problems for accessories which count on those clips being there.

### Initial Findings

Upon powering up the system, the motherboard auto-detected it as 9-9-9-24 @ 1333MHz, instead of the 8-8-8-24 @ 1600MHz that is should be. Naturally I manually overrode this to the correct settings using the onboard X.M.P. (eXtreme Memory Profile), then set the RAM timings & voltages manually, giving me 8-8-8-24 @ 1600MHz @ 1.65V (as per Corsair stock settings). Upon booting back into Windows 7 (having previously installed it using the previous set of RAM), and running the Experience Index, I was greeted by a BSoD and a system reboot. I realized that something had gone wrong, so I grabbed my [Memtest x86](http://www.memtest.org/) and ran a full test. No errors reported on the RAM at the stock settings... After trying a SiSoft Sandra Memory Benchmark and yielding another BSoD, I concluded that something was wrong. I pulled half the RAM, leaving bank 1 (slots 2 & 4) free. After running another test with the same stock settings, I ran another Experience Index and Memory Benchmark. To my shock, these both passed. I then tested the second pair of DIMMS, only to find that these passed too.

A quick google later turned up that one or two other users have this problem, and they had found that running a fully populated DDR3 setup of 1600MHz RAM @ 1333MHz was perfectly stable. I replicated this setup on my system, but was disappointed to find that I could not achieve XMP at the desired 1600. Not wanting to overclock or underclock, I persevered with my experimentation.

### Solving the issue

I won't go into all the different settings I tried, but I ended up modifying more or less everything in the BIOS to try and get the RAM to function. In the process, I learned a lot about the architecture of the Core i5's (and i7's), as well as what a lot of the advanced BIOS settings do (previously I had never had any need to touch these as I've never attempted overclocking before).

After a couple of days of research and tentative tinkering, I finally managed it...

8GB RAM at 8-8-8-24, running at 1600MHz in X.M.P.

#### BIOS Settings

- **Ai Overclock Tuner:** X.M.P.
- **eXtreme Memory Profile:** Profile #1
- **CPU Ratio Setting:** 17.0
- **Intel SpeedStep Tech:** Enabled

- **DRAM Frequency:** DDR3-1600MHz
- **DRAM Timing Control:** 8-8-8-24 (all others to auto, including DRAM Timing Mode)
- **IMC Voltage:** 1.35150
- **PCH Voltage:** Auto
- **DRAM Voltage:** 1.55025

- All others set to auto

- **CPU Configuration**
  - **C1E Support:** Enabled
  - **Intel SpeedStep Tech:** Enabled
  - **C State package limit setting**: Auto

### Long-term results

RAM burn-in and performance tests confirm that the system is stable and running as expected in its current configuration. At the time of posting, I have been running the new RAM for nearly a week, pushing various games through it, including Crysis with all settings at 'Very High'. No crashes, or stability problems to report.

### Feedback

If any of the settings here do or do not work from you, or if you have any suggestions and comments, please use the Comments section and post. I'd be interested to find out what works for others. Plus those comments may help others with similar problems. There is also the 'Contact' page if you wish to ask me something directly.

### Discuss the problem

[Corsair Support Forum discussion](http://forum.corsair.com/v3/showthread.php?t=81766) - The support discussion I started regarding this problem on the Corsair Support Forum

[Asus Support Forum discussion](http://vip.asus.com/forum/view.aspx?id=20090930014842109&board_id=1&model=Maximus+III+Formula&page=1&SLanguage=en-us)\- The support discussion I started regarding this problem on the Asus Support Forum

**For Reference**

[BitTech - Overclocking with Intel Core i5](http://www.bit-tech.net/hardware/cpus/2009/09/21/overclocking-intel-s-core-i5-750/1) - Useful information on the motherboard settings for the P55-based i5 boards

[AnandTech - Intel Core i5 & i7 Architecture overview](http://www.anandtech.com/printarticle.aspx?i=3634) - Very interesting overview of the shortfalls and achievements of the i5 & i7

[Corsair System Build Report for Lynnfield CPU's and P55 Chipsets](http://www.corsair.com/systembuild/print.aspx?report_id=1099104) \- What I used initially to get the optimal settings

[MSI Support Forum - Similar problem report](http://forum-en.msi.com/index.php?topic=128258.0) - Another report of a similar problem that I found
