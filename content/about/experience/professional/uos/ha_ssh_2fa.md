---

---
HAProxy / KeepAliveD - High Availability 

In mid 2017 I designed a new High Availability platform through the use of HAProxy and KeepAliveD. This platform allows us to deliver a single service with multiple end-points while presenting a single common service to our customers. KeepAliveD then underpinned the reliability of HAProxy by allowing multiple HAProxy gateways to exist in a redundant (active/passive) configuration. Servers were then placed on different virtual infrastructures to further improve reliability and the dependence on any single piece of infrastructure which could lead to outages.

For this project I was required to look at the departments upcoming requirements and to engineer a solution which could be scaled to future requirements. HAProxy allows us to provide a basic  High Availability front-end for services such as SSH, but also allows a more advanced implementation with HTTP/S services such as our external/internal web hosting, or our internal Apt-Repo, Apt-mirror and YUM-Repo services.

The HAProxy and KeepAliveD configurations were built within Chef and then bootstrapped using PXE/Kickstart. This approach (along with the use of templates within Chef) allows us to dynamically build/destroy HAProxy gateways at will.

HA SSH with Two-Factor Authentication service 

Delivery an SSH service for access to FEPS systems while enforcing new security requirements that all external users must authenticate against services using two-factor methods.

Leveraging the existing centralised authentication and storage infrastructure, I deployed the Google Two-Factor authentication PAM Module to two new SSH Servers. Both of these were placed behind the load balancers so that users would be directed to each server on a round-robin basis. Deploying the Google 2FA module to all FEPS Linux Desktops and terminal servers allows users to generate / store Google 2FA tokens, which are accessed by the SSH Servers upon login.

Next I deployed two more SSH servers without the 2FA PAM module, adding them to a different resource pool and configuring the load balancer to direct internal logons to those instead, thus bypassing the 2FA requirements for users already inside the University networks.

The new SSH servers were built using Chef, with the 2FA PAM Module being turned on/off using Chef tags and templated configuration files. This method (along with bootstrapping the server build process into Kickstart/PXE) allows us to build/destroy SSH servers as needs arise, with new servers being automatically inserted into the pool of servers controlled by HAProxy.