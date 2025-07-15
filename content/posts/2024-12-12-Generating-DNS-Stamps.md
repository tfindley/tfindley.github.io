---
title: Generating DNS Stamps
date: 2024-12-12
author: Tristan Findley
categories:
  - Technical
  - Ansible
tags:
  - technical
  - dns
  - DoT
  - DoH
showTableOfContents: true
draft: false
---
Encrypted DNS support was added to Ubiquiti's UniFi Network service in a recent update. Like a lot of UniFi network users, I was excited to finally have this feature appear on one of my core networking products, however DNS-over-TLS (DoT) and DNS-over-HTTPS (DoH) were strangely absent from the 'Custom DNS' field options, instead a *DNS Stamp* starting with `sdns://aBcDeFgG` was shown. So how do you add your own upstream encrypted DNS server?

## What is a DNS Stamp?

Put simply, a DNS Stamp encodes all details required to connect to a secure DNS server in a single string.

## Pre-requisites

In order to generate a DNS Stamp, you will require a DNS Provider that supports DNS-over-HTTPS (DoH). I recommend using (NextDNS)[https://nextdns.io] for this!

You will also require a network appliance or downstream DNS service that supports DNS Stamp (`sdns://`).

## Generating a DNS Stamp

For the DNS Stamp Generation we will use [DNSCrypt's DNS Stamp Generator](https://dnscrypt.info/stamps/).

For the examples below, we will use NextDNS information. You will require your unique six-character ID which can be obtained by visiting your [NextDNS Dashboard](https://my.nextdns.io) and signing in. Your ID is unique per profile (the drop down at the top next to the NextDNS banner), and is displayed under the **Endpoints** section. Your **DoH** should look like `https://dns.nextdns.io/aBc123`

1. Open [DNSCrypt's DNS Stamp Generator](https://dnscrypt.info/stamps/) in your web browser.
2. Set the following
    - **Protocol:** DNS-over-HTTPS (DoH)
    - **IP Address:** *leave blank*
    - **Host name:** dns.nextdns.io *(note that we don't include the https protocol string)*
    - **Hashes:** *leave blank*
    - **Path:** *your six character unique ID provided by NextDNS. e.g: `/aBc123`. Don't forget the preceding `/`.
        - **Optional:** if you want to include a Device ID or name (useful in NextDNS if you want to log what specific devices are querying) add */device_name* to the end of the **path**. E.g: `/aBc123/Router`
    - **DNSSEC:** Checked
    - **No Filter:** Unchecked
    - **No Logs:** Unchecked
3. Your DNS Stamp should be displayed at the top right under **Stamp**. Save this.

### Decoding an existing DNS Stamp

- Open [NextDNS Dashboard](https://my.nextdns.io) in your web browser and log in
    1. Scroll down *Setup Guide* and choose *Routers*
    2. Scroll down again until you see *DNSCrypt*
    3. Copy the `stamp` string, starting with `sdns://`
- Open [DNSCrypt's DNS Stamp Generator](https://dnscrypt.info/stamps/) in your web browser.
- Paste your `sdns://` string into the **Stamp** field at the top right. This will decode your sdns string and allow you to inspect its content.
- **Optional:** if you want to include a Device ID or name (useful in NextDNS if you want to log what specific devices are querying) add */device_name* to the end of the **path**. E.g: `/aBc123/Router`

## Applying DNS String

###  UniFi Network

1. Open your [UniFi Network Console](https://unifi.ui.com)
2. Select the site you want to configure
3. Navigate to Security > General
4. Under **DNS Shield**, select **Custom**
5. Enter your desired **Server Name** (the name of the service you're adding, such as *NextDNS*) and enter the **DNS Stamp** generated in the last section. Choose 'Add'.

### AdGuard Home

1. Access your AdGuard Home instance in your web browser
2. Navigate to Settings > DNS Settings
3. Under *Upstream DNS servers* paste your `sdns://` string

Alternatively just paste your DoT (`tls://`) or DoH (`https://`) string(s) in here and don't use DNS Stamps at all... Much easier!

## Conclusions

So as demonstrated in the AdGuard Home Setup, DNS Stamps seem to be fairly redundant. At least for most users. As NextDNS pointed out on the [UniFi community forum](https://help.nextdns.io/t/x2yt5nn?r=x2yt5s1):
 > It feels like they are leaking an implementation detail of their choice of underlaying software (dnscrypt-proxy).

So should  we use DNS Stamps? If you have to, sure. But if your appliance has the option to use raw DoT or DoH strings, then go with those instead.

## Disclosures

### AI Statement

In conjunction with my [AI Use](/legal/ai) Statement;

No AI, LLM or Chat Bot was not used in the creation of this article

### Credits

Shout outs to

- The UniFi Community, and especially NextDNS for information that helped shape this article.
- Reddit user **Almahadeus** who inspired this post.
- Reddit user **SantaCruzJimbo** for some helpful change suggestions. *(07/15/2025)*
- The many users who have read this article and supported the auther.

Thank you all!

## Supporting the Author

If you liked this post and would like to show some support, then head to my [Ko-Fi page](https://ko-fi.com/tfindley) and consider donating to my coffee fund. After all, behind all good IT people and technical articles is a mug of perfectly brewed coffee!
