---
title: "Royal Holloway University London"
# excerpt: "Systems Administrator"
date: 2006-09-11
description: "Systems Administrator"
showWordcount: false
showReadingTime: false
categories:
    - Employment
---

**Systems Administrator**

School of Mathematics & Information Security, Department of Computer Science

11/09/2006 – 03/02/2017

---

In 2006 I started as the Systems Administrator at Royal Holloway University of London, one of the UK’s leading research-intensive universities housing 21 academic departments and schools, over 9,000 students and over 1,500 staff.

Where as most IT Staff employed by Universities support the entirety of the site, I am (along with two colleagues) tasked with supporting the IT and technical requirements of the School of Mathematics and Information Security, and the Department of Computer Science.

The School of Mathematics and Information Security Group is a world renowned name in the field of Information Security. It’s pioneering cyber security education training is known around the globe as some of the finest in the industry. Recently awarded the EPSRC Centre for Doctoral Training in Cyber Security. The school comprises over 40 staff, 15 researchers, 70 PhD’s / CDT’s and 120 Postgraduate MSc Students. The Department of Computer Science is comprised of over 30 staff, 10 researchers, 30 PhD’s and 300 Undergraduate BSc students, and rank 11th in the UK REF (Research Excellence Framework) 2014.

Being responsible for the three departments lets me enjoy supporting a wide range of requirements from a diverse and uniquely individual Staff and Student body. Every day brings new challenges in the forms of new research requirements, diverse equipment and software requirements, and a multitude of technical queries and issues ranging from the ordinary to the extraordinary. All of this makes for a dynamic and challenging environment where a high degree of research, learning and implementation is required to support such a broad range of requirements.

Being part of a small team of between 3 and 6, while supporting such a wide and diverse user-base, I was required to have many roles on a single day.

- First an Second Line support
- Systems Administrator
- Network Administrator
- IT Platforms Solutions Architect
- IT Purchasing Manager for Desktop, Server and Infrastructure hardware

Being a member of the Royal Holloway Information Security Group comes with a high responsibility. No matter what hat I am wearing, security must always be at the forefront of what we do. The data security and subsequent reputation of the ISG (and associated departments) must always be of chief concern.

## Responsibilities

My Primary responsibilities focus around providing excellent customer experience to our staff and students, which entails maintaining existing customer systems (Desktops and Laptops) and rolling out new systems in accordance with our Desktop Replacement Program policy. This would involve a full system life-cycle plan:

**Initial spec** – Finding a system that meets the requirements of the department within the budget. Systems also had to have a long term product road-map available from the manufacturer (typically HP or Dell), with the ability to increase the spec of the system (more RAM / Storage, better CPU, external graphics card, etc), or have the ability to switch between form factors (Micro, Small, Mini, Full, or 12″, 14″, 15″, etc), all while maintaining a single system image. Support for Windows and Ubuntu Linux LTS was also a must. The standard machine would need to fit into our budget for machine replacement across three departments, while higher spec machine costs would be supplemented by additional department funding, research grants or Academic free-spend.

**Capturing individual requirements** – Prior to any ordering, academics would be communicated with to ensure that their individual requirements are being met. For departments of this size, it is easy to arrange a five-minute chat with each member of staff to discuss their machine options (Desktop, Laptop), OS options (Windows, Linux, Mac), and capture any specific requirements they might have for upcoming research that may generate higher spec variations of the standard build. Some Display Screen Assessment  requirements (Docking station, etc) can also be captured during this stage. All of these requirements are put into a matrix which will form the basis of the final order to the supplier.

**Testing & Image Build** – Once the system is specified, one or two machines will be ordered ahead of schedule. This allows me to prototype and test a stable build with the latest OS version. This build can then be imaged using in-house imaging software (Symantec Ghost) for in-house deployment, or sent to the hardware supplier for pre-delivery imaging.

**Machine Delivery & Provisioning** – When the systems are delivered, (either in staggered delivery or in bulk) the machines are either deployed locally in the IT office for imaging or deployed straight to the user’s desk. This will involve arranging a convenient time with the academic to replace their machine. The keyboard / mouse / display are also replaced during this process.

**Windows Imaging & Setup** – As soon as the machine is deployed to the network it can be booted either from PXE into the Symantec Ghost WinPE Image and specifying the machine name in the Ghost Console, or by installing the Ghost Client straight into Windows allowing the machine name to be specified in Windows or on the Ghost Console. At this point the image can be deployed to the machine. Upon completion of the Ghost image, the Ghost console will kick off one of my Batch files to automatically join the computer to the domain in the correct OU (Organisational Unit) for the relevant department. At this point the user is about to start using their system.

**Mac Imaging & Setup** – Mac machines will usually be imaged using SuperDuper or Disk Utility (Alternative methods for mac imaging). Once the image was complete the user account would be set up locally on the machine. As most Mac’s purchased were Laptops, using Central Authentication was not considered a requirement at this stage. Backup would be handled using a Time Machine server provided by the department (was in testing stage at the time of my leaving).

**Linux Setup** – Given the small number of Linux users in the department, Linux OS’s used to be installed by hand using Ubuntu LTS from a memory stick. Installation would take less than 15 minutes and then all packages and changes could either be executed by hand, or via a single Bash script.

Managing and maintain servers running Ubuntu, SUSE and Windows operating systems across four distinct networks, with a focus on minimising user impact or affecting outward-facing visibility (i.e: Web Server downtime).

Virtual Infrastructure management is also key, with more emphasis being placed on this infrastructure as we continue to migrate our Physical machines to Virtual machines (P2V). User VM management is also becoming more centric – as our customers move more toward laptops as their daily computer, the requests for dedicated user VM’s for longer term / high load computation increases.

Throughout all of this is the requirement to operate within policies governing the provisioning, life-cycle and use of all physical and virtual machines. Part of my work involves the constant fine-tuning and setting of such policies in conjunction with the team.

In addition to this, I frequently liaises with the central IT Service Department of the university to deliver larger projects to departments, or to the wider University.

