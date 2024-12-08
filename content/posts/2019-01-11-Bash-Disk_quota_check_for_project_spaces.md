---
title: "Bash script: Disk Quota check for Project Spaces"
date: 2019-01-11
categories:
    - Technical
    - Reviews
tags: 
  - technical
  - bash
  - quantum
  - stornext
  - storage
---

Since my return to work after the Christmas break, I had a challenge to write a script to provide our users a way of querying the disk quota available to them on their network storage.

Linux users know that you can simply run `df <path>` to find out what space you have available, and for our regular Linux users you'd be absolutely correct (though I would suggest they add a `-h` to make it human readable).

This is all well and good until you start talking to users of our Quantum StorNext system, which gives you some silly amount which is of no use to the users. So how do we get around this?

Quantum StorNext do provide a command that allows (non-priv) users to query a Quantum StorNext directory, but the command has two drawbacks:

- It must be run from a SAN Client attached to the fabric
- It requires the user to query an entire storage area (physical path) and then search the results for their folder
- The user must know which physical path holds their project space
- nfs export name and automount must have a 1:1 name match
- User must know about the snquota command and how to use it

So let's make this more user friendly. Let's start by seeing what a user would see if they used the regular 'df' method to access their project space. For this example we'll use the directory *facer2vm*, a project area stored on Quantum StorNext.  We'll assume no special knowledge other than the automount location of the project space.

```bash
$ df -h /vol/vssp/facer2vm
Filesystem                                                        Size  Used Avail Use% Mounted on
apsn.surrey.ac.uk:/stornext/CVP-usnfs1/profile2/UQRS320/facer2vm  219T  122T   97T  56% /vol/vssp/facer2vm
```

As you can see, `df` is giving us a total size of *219TB* with *122TB* in use, and *977TB* available. In actuality *facer2vm* has an *80TB* quota allocated to it, so we know that `df` is giving us incorrect information.

Quantum provide the command `snquota` which can be run on a SAN Client to query folders, so let's take a look at how we run that and what it gives us:

```bash
$ /usr/cvfs/bin/snquota -P /stornext/CVP-usnfs1 -L | grep facer2vm
        0          0        0m      21T  NoLimit     group  cvsspfacer2vm
      81T        80T        1w      24T    Under       dir  /profile2/UQRS320/facer2vm
        0          0        0m     100M  NoLimit  dirfiles  /profile2/UQRS320/facer2vm
```

In this example I've already piped to grep to search for the project space. snquota and assumed a lot of information the user might not have access to.

So how do we make this simpler for the user? We can actually derive all the information we need to parse to snquota from the automount information stored in our ldap, so we can build a bash script (a wrapper) to do this for us, meaning the user would only need to provide it the project space name:

```bash
$ check_quota facer2vm

    Information for facer2vm
    ----------------------------------------------------------------------------------
     Quota:
               Quota Allocated:   80T
                    Quota Used:   24T
               Percentage Used:   30%
                    Quota Free:   56T
    ----------------------------------------------------------------------------------
     Limits:
                    Hard Limit:   81T
                  Grace period:   1w
    ----------------------------------------------------------------------------------
     Access:
               Linux User Path:   /vol/vssp/facer2vm
             Windows User Path:   \\surrey.ac.uk\research\facer2vm
                 Physical Path:   /stornext/CVP-usnfs1/profile2/UQRS320/facer2vm
    ----------------------------------------------------------------------------------
      Notes:
              To manage your storage quota and permissions,
              please log onto https://filestorage.surrey.ac.uk
```

The script itself is fairly long-winded for something seemingly so simple, but its process is to take the project space name and query four ldap ou's where we store our automount information. If it detects that it is a Quantum StorNext project space area it will read the ldap record and parse the relevant information to `snquota`. The same is true for a Non-StorNext project space (such as one on FluidFS), but in that instant it will run a df and parse the information to df. The output from the commands is then presented in a slightly more user-friendly layout.

At this time the biggest drawback to the script is that it must still be run on a SAN Client and cannot be run on a regular workstation. For our CVSSP research group this isn't a problem as they perform compute-tasks on SAN Clients instead of on regular workstations, however that requires an extra step of logging into a SAN Client to run the command. Even a wrapper provided on user desktops to execute the command remotely via SSH would still require an authentication step. The ultimate goal is to do away with that requirement.

An additional line of code provides the ability to utilise the script in a raw output form (this is still a work in progress). The idea being that a web interface (possibly just an HTTP GET request) could run the script and retrieve information about a project space. Right now the output it provides is:

```bash
$ check_quota --raw facer2vm
80T 81T 24T 30% /vol/vssp/facer2vm facer2vm research 1w
```

There are other ways we could go about presenting the information to our users, including through the file storage web form, but for now we have a quick and easy way that users can query the project space quota. So there's a few more things I can do to it, and probably will in the near future.

The code for check_quota.sh can be found on my GitLab portfolio.

## Update - Jan 11th 2019

A few days on and we've found a bug with the script, which is snquota doesnt always present TB or GB in both Limit and Used (i.e: Limit may be 1TB but used may be 10GB). This means that my calculation which works out the percentage storage space free is broken (apparently you can't have 3291% used... who knew?). So I'll have to write a function to determined what unit it needs to be calculated and displayed in.

| Allocated Space Unit (A) | Used Space Unit (U) | Output Space Unit (O) | Formula: Percentage and Free     |
| ------------------------ | ------------------- | --------------------- | -------------------------------- |
| T                        | T                   | T                     | O=(U/A)*100 O=A-U                |
| T                        | G                   | G                     | O=(U/(A*1024)*100 O=(A*1024)-U   |
| T                        | M                   | M                     | O=(U/(A*10242)*100 O=(A*10242)-U |
| G                        | G                   | G                     | O=(U/A)*100 O=A-U                |
| G                        | M                   | M                     | O=(U/(A*1024)*100 O=(A*1024)-U   |

We also found something rather notable about snquota while reading the 'man' page. You can directly query a project space quota, so long as you know the location path. The issue with this is that you still need to know the full path (my script derives this from looking up automount in LDAP), and snquota needs to be run as root to perform a lookup on an individual area...

```bash
$ sudo /usr/cvfs/bin/snquota -P /stornext/AP-usnfs1 -G -d profile4/UQRS141/mammo
HardLimit  SoftLimit  GracePer  CurSize   Status      Type  Name
     3.2T       3.0T        1w     2.7T    Under       dir  /profile4/UQRS141/mammo
```

So just leaving this but of code here just in case.

## Update - Jan 21st 2019

So after a bit of a sit down and think about the script, I decided to totally rework the order in which it works. For some reason I'd built it all in functions, which does allow me to reuse code in multiple places, but it didn't flow. Additionally I had two functions (the ones that output the actual data) doing basically the same thing as each other. Not efficient, right? A massive rewrite later and things are now back in-line with less functions and a more dynamic section of code that prints based on which project space it is further up.

Now as of today I've had a problem reported to me, which I was aware of, which may be a bit of a problem... What if the LDAP query returns multiple results. As far as I can see, this could occur in two scenarios.

When two project spaces exist with exactly the same name but in different paths. i.e: `/profile2/UQRS324/ucdatasets/smile  /profile2/UQRS322/smile`
When derivatives of the same project space exist. i.e: `smile & smile2`

- **Problem 1** will occur because ucdatasets is 'uncompleted datasets'
- **Problem 2** will occur because I stupidly removed a piece of code that stops searching for part of the string and not the full string.

More thought is needed on how to get around this.
