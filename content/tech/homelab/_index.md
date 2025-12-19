---
permalink: /about/tech/homelab/
title: "HomeLab"
excerpt: ""
toc: false
classes: wide
showTableOfContents: true
---
Where the magic happens

My IT Career has been built largely around a journey of self learning and self discovery. My experience in business continually feeds my homelab build, and my homelab continually feeds and grows the infrastructrure in the business I work in.

## Is a homelab important?

Technically, no. But it's fun to have one!

From experience working with and managing individuals in the industry with varying degrees of experience, I've noticed those whom have grown fastest in their chosen career paths have been those who have expressed interests in the technology and learning journey outside of work. Their technology journey becomes a passion which feeds their career. That's not to say that this is for everyone. It has to be recognised that not everyones life lends itself to extra-curicular working. I would only encourage it if you have the time, or the inclination to do it.

If you are deciding whether or not to make a homelab, just remember; you are technically bringing your work home with you. Be sure that if you're going to build something that is running *critical* services for your home, that you have the ability to run and maintain those at production-like stability. This is especially important if you're doing this for other people who rely on the services you build. In these instances, consider having a development area in which you can test changes before you make them live on the production service. An alternative would be a green/blue deployment method, or use a rapid service fallback method that you can recover to in case of failure.

## My Homelab

### MinisForum MS-A2

#### Spec

| Item | Spec | Notes |
| --- | --- | --- |
| Chipset | Yes |     |
| CPU 1 | AMD Ryzen 9 9955HX | Zen 5, 16-core, 32-thread, 64MB L3 Cache, 100w TDP, Max boost click up to 5.4GHz |
| Memory | 96GB DDR5 @ 5600 MT/s  <br><br/>2x48GB, SO-DIMMS | 2 SO-DIMM sockets  <br>2 populated, 0 available<br><br>Crucial DDR5-5600 96GB Kit  <br>CT2k48G56C46S5 |
| GPU (Integrated) | AMD Radeon 610M | 1x HDMI 2.1  <br><br/>2x USB-C Alt DisplayPort |
| GPU (Discrete) | None |     |
| Internal Connectors | 1x PCIe 4.0 x16 slot (x8 wired) | Bifurcation (Splitting) enabled |
| Audio | Yes | 3.5mm Combo Jack (front)  <br><br/>HDMI  <br><br/>USB-C (Alt DisplayPort) |
| TPM | Yes |     |
| Storage - SSD | 1x 2280/u2 NVME SSD PCIe 4.0 x4  <br><br/>2x 2280/22110 NVME/SATA PCIe 3.0 x4 |     |
| Storage - SATA | None |     |
| Networking - SFP | 2x 10Gb Intel X710 |     |
| Networking - RJ-45 | 1x 2.5Gb Realtek RTL8125  <br><br/>1x 2.5Gb Intel I226-V |     |
| Networking - WiFi | WiFi 6e |     |
| Bays | 1x 2.5" SSD in U2 mode | This uses the 2280/u2 PCIe 4.0 slot |
| Front Ports | 1x 3.5mm Combo Jack  <br>1x USB 3.2 Gen1 (5 Gbps)  <br>1x USB 2.0 |     |
| Rear Ports | 2x SFP+  <br>2x RJ-45  <br>2x USB-C (USB 3.2 Gen2 10Gbps)  <br>1x USB 3.2 Gen2 (10GBps)  <br>1x USB 3.2 Gen1 (5 Gbps)  <br>1x HDMI 2.1 |     |
| PSU | 240W  <br><br/>19v/12.63a |     |
| Current Storage | Samsung 990 Evo Plus 2TB PCIe 4.0x4/5.0x2 |     |

### Dell OptiPlex 7070 Micro

#### Spec

| Item | Spec | Notes |
| --- | --- | --- |
| Chipset | LGA1151 |     |
| CPU 1 | Intel Core i5-9600 CPU @ 3.10GHz | Coffee Lake, 6-core, 6-thread, 9MB L3 Cache, 100w TDP, Max boost click up to 4.2GHz |
| Memory | 32GB DDR4 @ 2666 MT/s  <br><br/>2x16GB, SO-DIMMS | 2 SO-DIMM sockets  <br>2 populated, 0 available  <br><br/>G.Skill Ripjaws DDR4-3200 32GB Kit   <br>F4-3200C22D-32GRS |
| GPU (Integrated) | Intel® UHD Graphics 630 | 2x DisplayPort 1.2 |
| GPU (Discrete) | None |     |
| Internal Connectors | None |     |
| Audio | Yes | 3.5mm Combo Jack (front)<br><br>3.5mm Microphone Jack (front)<br><br>DisplayPort |
| TPM | Yes |     |
| Storage - SSD | 1x 2280 NVME SSD PCIe 3.0 x4 |     |
| Storage - SATA | 1x 2.5-inch SATA |     |
| Networking - SFP | None |     |
| Networking - RJ-45 | 1x 1Gb Intel I219-LM |     |
| Networking - WiFi | None |     |
| Bays | 1x 2.5" SSD |     |
| Front Ports | 1x 3.5mm Combo Jack<br><br>1x 3.5mm Microphone Jack<br><br>1x USB 3.1 Gen1<br><br>1x USB-C (USB 3.1 Gen2) |     |
| Rear Ports | 1x RJ-45  <br>2x USB 3.1 Gen2  <br>2x USB 3.1 Gen1  <br>2x DisplayPort 1.2 |     |
| PSU | 130W |     |
| Current Storage | Samsung 990 Evo Plus 2TB PCIe 4.0x4/5.0x2 |     |

### Lenovo Thinkstation M73

- Intel Core i5
- 8GB RAM
- 500GB SATA SSD

### Asustor Flashstor FS6712X

[Link to product page](https://www.asustor.com/en-gb/product?p_id=80)

### HP DL360 Gen10

#### Spec

| Item | Spec | Notes |
| --- | --- | --- |
| Chipset | Intel C612 |     |
| CPU 1 | Intel Xeon Silver 4110 CPU @ 2.10GHz | 2-Socket, 8-Core, 16-Thread |
| Memory | 128GB DDR4 @ xxxx MT/s ECC   <br>8x 16GB | 8 DIMM sockets, 4-channel capable. RDIMM and LRDIMM (cannot be intermixed), ECC, DDR4-2133  <br><br/>4 populated, 4 available |
| GPU (Integrated) | None |     |
| GPU (Discrete) | None |     |
| Internal Connectors | 2x PCIe 3.0 x16 slots  <br>1x PCIe 3.0 x4 slot  <br>1x PCIe 2.0 x4 slot  <br>1x PCIe 2.0 x1 slot  <br>1x PCI Slot  <br>1x Flex Connector | Flex Connector populated with NVMe / SATA SSD adapter card. |
| Audio | None |     |
| TPM | TCG 1.2-compliant |     |
| Storage - SSD | 1x m.2 connector  <br>1x SATA SSD |     |
| Storage - SATA | 4x SATA Ports (RAID Capable)  <br>2x SATA Ports (ODD) | RAID 0, 1, 5, 10 with onboard SATA controller in chipset, SATA 6Gb/s |
| Bays | 2x external 5.25" bays  <br>4x Internal 3.5" bays (2.5" compatible) | 2x 5.25 bays converted to 2x 3.5/2.5" bays for SSD |
| Front Ports | 4x USB 3.0 (one Diagnostic, one Always On), one combo  <br>1x audio/microphone jack (3.5mm) headset  <br>1x SD Card Reader |     |
| Rear Ports | 4x USB 2.0  <br>4x USB 3.0  <br>1x serial (9-pin)  <br>1x ethernet (RJ-45)  <br>3x analog audio ports (line-in, line-out, mic-in)  <br>2x PS/2 |     |
| PSU | 2x 600w PSU | 6x SATA Power Connectors  <br>1x 6-pin GPU power |
| Current Storage | 128GB NVMe SSD (boot)  <br><br/>1TB SATA SSD (m-key connector | Optional:  <br><br/>4x6TB SATA SSD  <br>(2x 6TB RAID1 or 18TB RAID5) |