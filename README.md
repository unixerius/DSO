# Introduction

This repository holds files that are used by students in the Unixerius / ITVitae training "Introduction to DevSecOps". 

* The "Lab setup" folder has the files needed to build the workstation used in class.
* The "Pipelines" folder has the example YAML files for the Azure DevOps pipelines that we build in class.


# Worstation setup.

## Intel or AMD x86_64

Students using either a MacOS, Windows or Linux system with an x86_64 processor (Intel or AMD) can use the *Vagrantfile* under "Lab setup".

Preparations before you do so:

* [Install Virtualbox](https://virtualbox.org)
* [Install Vagrant](https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant)

Then download the Vagrantfile, put it in a separate folder and run `vagrant up`.

This process will take about 10-15 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.


## Apple Silicon (ARM M1/M2)

Students with a modern Macintosh computer with Apple Silicon processor have two options:

1. Using UTM, manually installing Ubuntu and running the provisioning script.
2. Using Homebrew, Qemu and Vagrant.

**Recommendation**: Despite that it's a bit harder to setup, I recommend using the UTM approach. Yes you will need to manually install Ubuntu, but the performance is great!


### Broken labs (ARM)

**Note:**

> On Apple Silicon and other ARM-based systems, certain labs may not work. I have probably fixed the Nessus lab, which leaves the lab with Juice Shop Solver. This is also broken on ARM, for now. Fix will come soon.


### Apple Silicon - UTM

1. [Download and install UTM.](https://mac.getutm.app)
2. [Download the Live ISO for Ubuntu Server 22.04 for aarch64](https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04.2-live-server-arm64.iso)
3. In UTM, define a Linux VM with 6-8 cores and 6144-8192 MB of RAM (depending on the amount of RAM in your system).
4. Install Ubuntu Server onto the newly defined Linux VM. I can't help you with that! 🥸
5. Once the installation is done, login to the VM.
6. In your home directory on the VM, run: `git clone https://github.com/unixerius/dso`
7. On the VM, run `sudo -i`, then `cd` into the cloned repo, into the "Lab setup" directory.
8. As root, run the `provision-vm-ARM.sh` script. This will install and configure all needed tools.

The installation/provisioning will require 10-20 minutes, depending on your Internet connection speed.

You can choose to work on the VM via the UTM graphical interface, or you can SSH into the server from your laptop's host OS. UTM VMs are directly accessible from the host OS, all you need to know is the IP.


### Apple Silicon - Qemu and Vagrant

**Notice! Speed is a drawback!**

> Qemu uses a network driver which offers very slow networking. Any downloads you do will be very slow!


1. [Install Homebrew.](https://brew.sh)
2. Install Vagrant and Qemu, by running `brew install qemu vagrant`.
3. Install the Qemu plugin for Vagrant: `vagrant plugin install vagrant-qemu`
4. Download the *Vagrantfile-ARM*, put it in a separate folder, rename it to *Vagrantfile*, then run `vagrant up`.

The building and installing of the VM will take 20-30 minutes, depending on your Internet connection speed.

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.

