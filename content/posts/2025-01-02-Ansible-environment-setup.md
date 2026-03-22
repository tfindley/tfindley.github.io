---
title: Building an Ansible Development Environment
date: 2025-01-02
author: Tristan Findley
categories:
  - Technical
  - Ansible
tags:
  - technical
  - ansible
  - guide
  - python
  - automation
  - devops
  - linux
  - macos
description: "Step-by-step guide to setting up an Ansible development environment with Python virtual environments on Linux and macOS."
showTableOfContents: true
draft: false
params:
  devops_cat: ansible
---

## Forward

For all of the following article I will assume the reader has basic Linux knowledge, and a familularity with the CLI in either the Bash (Linux default) or ZSH (Mac Default) Shell. All of the following will work on both.

For Windows Users, you will need to install Windows Subsystem for Linux (WSL) v2, and configure a appropriate Linux Distro (at time of writing I would recommend Ubuntu 24.04). 

## Intruduction

I started with Ansible back in 2019, and since then I've read about and tested numerous ways of setting up your local 'development' environment so you can start building and running Ansible content. During this time I've developed my own way of doing this, which I try to empart on my coleagues or trainees. I thought I'd try to formalise, document and share that setup to make things a little more consistent in the future, and hopefully work towards a (possibly interactive) automated process for building this.

## Prerequisites

For this you will require the folowing:

- `python3` - included by default every system, however it may not be the latest version. At time of writing Python 3.12 is considered stable and current
- `python3-venv` - likely not included and will need to be installed

For the following examples we will be installing Python 3.12 - you can change the verison number to a higher version if needed, just make sure to update all of the commands you run.

### MacOS

Before continuing, run: `which python3` to locate your stock/system python binary, and `python3 --version` to find out what version you're running.

In order to upgrade Python3 on MacOS, you require [Brew](https://brew.sh/) - install this first, then come back here for more information

Next you need to run `brew install python3.12` 

For python3-venv you should be able to run `brew-install python3.12-venv`.

You can test these have been installed by running: `which python3` and `which python3-venv`. These will likely both redirect to your local user directory, and not to the system python binaries. Also run `which python3.12` and `which python3.12-venv`.

### RHEL / Debian based Linux

Before continuing, run: `which python3` to locate your stock/system python binary, and `python3 --version` to find out what version you're running.

Using your package manager, you can install a later verison of Python and the required python3-venv package.

**RHEL:**

**Note:** for the instrucitons below I have defined Python version 3.12, however you can usually install for the current system version of Python by requesting the module without the version number. i.e: `apt install python3-venv`

```bash
sudo yum update
sudo yum install python3.12 python3.12-venv
```

**Debian:**

```bash
sudo apt update
sudo apt install python3.12 python3.12-venv
```

Doing this will not replace your system's Python environment, but will install an additional environment alongside. How re-run `which python3` and you will see this is unaffected. Run `which python3.12` and you will see this points to a new location.

### Microsoft Windows

For Windows I recommend using WSL2 and following the Linux instructions above. I recommend using Ubuntu and following the Debian instructions above.

## Your development directory

Where you decide to store your code will ultimatley depend on your preference, existing directory structures, or habbits. We'll assume that you're only going to work in your home directory (~).

On a new system (or WSL container) I typically start off by creating a 'devel' directory (`~/devel`), however if you're running on a single machine that is supporting multiple clients you may wish to create client or employment directories, each containing a 'devel' directory. On WSL, you may want to just create a seperate distro installatio for each client, or for the more advanced among you, have a Docker/Podman Container for each customer. Maybe more about that in the future...

For now, let's keep it simple, and create a 'devel' directory in your home directory

```bash
mkdir ~/devel
```

Assuming you used this path, we're going to export it to a variable so we can reference this consistently throughout this document. If you used a different path, adjust this exported variable accordingly.

```bash
cd ~/devel
EXPORT DEVEL="$(pwd)"
```

You can test this is set by running `echo $DEVEL` (which will echo the varialbe `DEVEL`) or run `env` which will print all currently set Environmental Variables

{{< alert icon="fire" cardColor="#e63946" iconColor="#1d3557" textColor="#f1faee" >}} **Be Aware:** If you close your shell instance, the variable you just set will be lost. You will need to re-run the `export` command to set it again {{< /alert >}}

Next, create your Ansible directory  and sub-directory structure within this devel directory.

```bash
mkdir $DEVEL/ansible
```

This is where all of your Ansible files and binaries will live. Eventually the directory structure should look similar to this:

```bash
ansible                         # Core Ansible directory located in $DEVEL/ansible
├── .venv                       # Python Virtual Environment (venv)
│   ├── bin                     # Python Binaries
│   │   ├── activate            # Used to activate the Python Virtual Environment (venv)
│   │   ├── ansible
│   │   ├── ansible-galaxy
│   │   ├── ansible-lint
│   │   ├── pip
│   │   ├── pip3                
│   │   ├── python
│   │   ├── python3
│   │   └── ...
│   ├── include
│   │   └── ...
│   ├── lib
│   │   └── ...
│   ├── lib64
│   │   └── ...
│   └── pyvenv.cfg
├── env.sh                      # Your own environment setup script
├── collections                 # Ansible Collections
│   └── namespace               # A namespace that your collections will live under
│       └── collection_name     # An ansible collection. This contains many different aspects of Ansible all packaged into a single repo for easy download
│           ├── docs
│           ├── meta
│           ├── playbooks
│           ├── plugins
│           ├── roles
│           ├── galaxy.yml
│           └── README.md
├── inventory                   # Here we will store your inventory files, both static and dynamic
│   └── inventory.yml
├── playbooks                   # Playbooks can run tasks or call roles, and can also hold variables
│   ├── compute.yml
│   ├── minio.yml
│   ├── production
│   │   ├── certbot.yml
│   │   ├── deploy.yml
│   │   ├── hashivault.yml
│   │   ├── monitoring.yml
│   │   └── wazuh-agent.yml
│   ├── testing
│   │   ├── test.yml
│   │   └── wazuh-indexer.yml
│   └── wazuh-index.yml
├── roles                       # Roles are collections of tasks that are designed to all accmplish a task, such as install / configure a service.
│   └── example_role
│       ├── NODES.md
│       ├── README.md
│       ├── TODO.md
│       ├── defaults
│       ├── files
│       ├── handlers
│       │   └── main.yml
│       ├── meta
│       │   └── main.yml
│       ├── requirements.txt
│       ├── requirements.yml
│       ├── tasks
│       │   └── main.yml
│       ├── templates
│       ├── tests
│       │   ├── inventory
│       │   └── test.yml
│       └── vars
│           └── main.yml
├── scripts                     # Somewhere to hold playbooks that perform a specific function that are too small to be a role.
│   └── example_script.yml
└── ssh                         # Optional location for your SSH public/private key to run Ansible playbooks against remote systems
    ├── id_ed25519
    └── id_ed25519.pub
```

### Base Directories

To begin with we'll create the core directories so we have somewhere to store our files

```bash
mkdir $DEVEL/ansible/inventory $DEVEL/ansible/playbooks $DEVEL/ansible/roles $DEVEL/ansible/roles $DEVEL/ansible/scripts $DEVEL/ansible/ssh $DEVEL/collections
```

## Ansible and Python

In order to get the Ansible binaries onto our system, we're going to install them using the Python method. Ansible is written in Python, so while there are methods to installing Python using your favourite package manager (YUM/DNF, Apt, Brew, etc) we want to maintain tighter control over our development enviornment, as well as handle other module prerequisites as they come up.

In order to do this we will set up a Python Virtual Environment, the install Ansible and our other dependencies into that Virtual Environment. This has the benefit of keeping Ansible and its dependencies contained in its own environment - this allows you to publish your list of requirements in your role or collection so when someone comes to consume it, they know exactly how to make it work!

{{< alert icon="fire" cardColor="#e63946" iconColor="#1d3557" textColor="#f1faee" >}} **WARNING:** Never alter your system's python environment (i.e: install packages as root, or change your base python version). Lots of parts of Linux / MacOS require Python to function, and changing the base environment can have catestrophic concequences. {{< /alert >}}

### Your Python Virtual Environment

First we'll start off by creating your Python Virtual Environment - this is the area that additional python packages will be installed so as the system Python environment is never modified.

Now we need to create a new Python Virtual environment inside of which we can install Ansible
```zsh
python3.12 -m venv $DEVEL/ansible/.venv
```

Now activate your new venv

```zsh
cd 
. $DEVEL/ansible/.venv/bin/activate
```

You should see a (.venv) appear at the start of your command prompt, indicating that your virtual environment is active and functioning.

You can test this by running `which python3` which should give you a location to the python3 binary located in $*DEVEL/ansible/.venv/bin*.

Now your environment is active we can install Ansible and its Dependencies using *pip* (the Python Package Manager)

```bash
pip install --upgrade pip
pip install ansible ansible-lint
```

This will cover the basic requirements to run Ansible
The following commands will now be available to you, so long as your venv is activate

- ansible
- ansible-config
- ansible-console
- ansible-galaxy
- ansible-lint
- ansible-pull
- ansible-vault
- ansible-community
- ansible-connection
- ansible-doc
- ansible-inventory
- ansible-playbook
- ansible-testble-lint

{{< alert icon="fire" cardColor="#e63946" iconColor="#1d3557" textColor="#f1faee" >}} **Be Aware:** If you close your shell instance, your python virtual environment will also be closed. {{< /alert >}}

## Environmental Variables

During the course of your Ansible development work, you will likely need to call upon multiple environmental variables (Envs). These are a good place to set information that is relevant to your environment. You can also use them for passwords (So long as they are stored / retrieved somewhere that is safe such as a password manager).

Create a new environment file:

```bash
touch $DEVEL/ansible/env.sh

cat << EOT > $DEVEL/ansible/env.sh
#!/bin/bash
echo ""
######## Environmental Variables below here #
echo "Loading Envs..."

export ENV_KEY=env-value

######## Environmental Variables above here #
echo ""
if [ -z $VIRTUAL_ENV ]; then
    echo "Activating Python Virtual Environment (venv) for Ansible development..."
    source $DEVEL/ansible/.venv/bin/activate
else
    echo "Python Virtual Environment already active: $VIRTUAL_ENV"
fi

EOT

chmod +x $DEVEL/ansible/env.sh
```

Now this file has been created and is executable it can be ran, however you can't simply ./ the file as this does not set environmental variables. Instead run: `source $DEVEL/ansible/env.sh`.

If you've followed all of this correctly you should now have a fully working Ansible development environment.
