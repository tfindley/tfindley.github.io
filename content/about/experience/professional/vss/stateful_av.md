---
title: Stateful AntiVirus Solution
---
Design of a 'stateful' Antivirus solution for use with Import/Export (Imp/Ex) between Low-side and High-side secure environments prior to transmission via DIODES.

The key requirements of this solution that must be incorporated:
- System must be stateless
- Self-test and integrity-check capability
- Must use multi-vendor AntiVirus solutions
- AntiVirus platforms must be able to fetch definitions from public or internal servers
- Reporting from each scan to be fed back to the user and stored in a central location for auditing
- High level of logging for the build and each instance to ensure transparency and auditing
- Usable in Secure / no-internet environments
- Bootstrap capability

My approach to this solution was to start with Docker, as it allows a 'gold-master' version to be deployed which can spawn instances which will only exist for the life of a single run.

A build process would begin with the installation of the AV platforms. A Malware detector and rootkit checker were also built into the solution. Updates would be run to ensure they were on the latest definitions. In its initial form, this was build with one premium AV solution and one free AV solution, however the system was built in such a way to allow for 'modules' to be written to include new AV's as required.

Once built, the system would perform an Integrity-check using the included software. A Self-Test was also run using EICAR test signatures.
Once the system integrity was confirmed the build was complete. Version numbers, build dates, signature versions and other build information was all stored and logged.

When an instance was spawned, the platform would initiate another full self-test and integrity-check prior to running a live scan on the target files. All files were logged back to a central MySQL database, and text reports fed-back to the user. Clean files would be moved to a clean output directory and infected files quarantined in another folder for further inspection