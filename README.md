# Introduction

This repository holds files that are used by students in the Unixerius / ITVitae training "Introduction to DevSecOps". 

* The "Lab setup" folder has the files needed to build the workstation used in class.
* The "Lab slides and exercises" folder has PDFs with the exercises we do in class.
* The "Pipelines" folder has the example YAML files for the Azure DevOps pipelines that we build in class.


# Workstation setup.

## Windows on x86_64

Students using Windows 10 or 11 on Intel/AMD systems have to options:

1. Use Hyper-V. Best performance, but requires local admin rights to run.
2. Use VirtualBox. Bad performance, but can run as a normal user.

**For VirtualBox**, use the instructions described below under "VirtualBox (Windows/MacOS/Linux)".

Preparations to use Hyper-V:

* You must have access to local administrator rights. 
* Windows **must** have Hyper-V and virtualization services installed.
* [Install Vagrant](https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant)

From the "Lab Setup" folder, download the `Vagrantfile-HyperV-x86_64`, put it in a separate folder, rename it to `Vagrantfile`. 

Then search for Powershell in your Start-menu **and run it as Administrator**. Then `cd` into the directory with the Vagrantfile and run `vagrant up`.

This process will take about 10-15 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.

> Using any of the Vagrant commands with the HyperV VM will require a Powershell window which runs with Administrator rights.


## VirtualBox (Windows/MacOS/Linux) on x86_64 (Intel core i5/i7/i9)

Students with an older MacOS system with an x86_64 processor (Intel) or using Windows 10/11 can use the *Vagrantfile-VirtualBox-x86_64* under "Lab setup".

Preparations before you do so:

* [Install Virtualbox](https://virtualbox.org)
* [Install Vagrant](https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant)

Then download the `Vagrantfile-VirtualBox-x86_64`, put it in a separate folder, rename it to `Vagrantfile` and run `vagrant up`.

This process will take about 10-15 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.


## MacOS on Apple Silicon (ARM M1/M2)

Students with a modern Macintosh computer with Apple Silicon processor have two options:

1. Using UTM, manually installing Ubuntu and running the provisioning script.
2. Using Homebrew, Qemu and Vagrant.

If you're in a hurry, I recommend the second option. 


### Apple Silicon - UTM

1. [Download and install UTM.](https://mac.getutm.app)
2. [Download the Live ISO for Ubuntu Server 22.04 for aarch64](https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04.2-live-server-arm64.iso)
3. In UTM, define a Linux VM with 4/6/8 cores and 4096/6144/8192 MB of RAM (depending on the amount of RAM in your system). Give the VM a 50GB virtual hard drive.
4. Install Ubuntu Server onto the newly defined Linux VM. I can't help you with that! 🥸
5. Once the installation is done, login to the VM.
6. In your home directory on the VM, run: `git clone https://github.com/unixerius/dso`
7. On the VM, run `sudo -i`, then `cd` into the cloned repo, into the "Lab setup" directory.
8. As root, run the `provision-vm-aarch64.sh` script. This will install and configure all needed tools.

The installation/provisioning will require 10-20 minutes, depending on your Internet connection speed.

You can choose to work on the VM via the UTM graphical interface, or you can SSH into the server from your laptop's host OS. UTM VMs are directly accessible from the host OS, all you need to know is the IP.


### Apple Silicon - Qemu and Vagrant

1. [Install Homebrew.](https://brew.sh)
2. Install Vagrant and Qemu, by running `brew install qemu vagrant`.
3. Install the Qemu plugin for Vagrant: `vagrant plugin install vagrant-qemu`
4. Download the *Vagrantfile-Qemu-aarch64*, put it in a separate folder, rename it to *Vagrantfile*, then run `vagrant up`.

The building and installing of the VM will take 20-30 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.


# License

We've decided to offer these files under the Creative Commons, BY-NC-SA license: Non-Commercial, Attribution and Share Alike. You can read all about it in the LICENSE.txt file. In short, you can re-use these files as you see fit but not for commercial purposes, as long as you attribute us as the original source and you re-share your own modifications. 
