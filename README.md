# Introduction

This repository holds files that are used by students in the Unixerius / ITVitae training "Introduction to DevSecOps". 

* The "Lab setup" folder has the files needed to build the workstation used in class.
* The "Lab slides and exercises" folder has PDFs with the exercises we do in class.
* The "Pipelines" folder has the example YAML files for the Azure DevOps pipelines that we build in class.


# Workstation setup.

## Requirements

Students are required to bring their own laptop.

The laptop should be somewhat recent, built in or after 2020. 

* It must have 8GB of RAM, or more.
* It needs at least 50GB of free storage space.
* It should have either an Intel i5/i7/i9, AMD Ryzen, or Apple Silicon (ARM) CPU.


## Overview

In order to prepare your laptop for the "Introduction to DevSecOps" class, you will need to install a virtual machine with tools. I have prepared everything for you, all the hard work's been done. You just need to follow a few steps, after installing one or two pieces of software. 

Which instructions you follow, depends on your host OS (the operating system on your laptop) and the architecture (which CPU is in there). The table provides an overview of my recommended approach. Only choose the fallback options if my recommended option does not work for you.

| Laptop OS     | Architecture      | Recommended install                   | Fallback option                |
| ------------- | ----------------- | ------------------------------------- | ------------------------------ |
| Windows 10/11 | x86_64 / amd64    | HyperV<br />Vagrant<br />**Requires Win Pro or Edu | VirtualBox<br />Vagrant        |
| Linux         | x86_64 / amd64    | VirtualBox<br />Vagrant               | KVM + LibVirt<br />Vagrant       |
| MacOS         | x86_64            | Homebrew<br />VirtualBox<br />Vagrant | n.a.                           |
| MacOS         | Silicon / aarch64 | Homebrew<br />Qemu<br />Vagrant       | Homebrew<br />UTM                |

*After installing the required software*, you must download a Vagrant configuration file as per the instructions. You will then use Vagrant to create the VM in your chosen virtualization tool. Vagrant will make the VM, download the OS and do all the software installations.


## Instructions

Follow ONE of the following sets of instructions, based on your choice from the table above.

I advise you to NOT use VMWare on MacOS ARM; it does not play well with Vagrant at all.

* [HyperV on Windows, with x86_64](https://github.com/unixerius/DSO/blob/main/Lab%20setup/HyperV-instructions.md)
* [VirtualBox on Windows, MacOS or Linux, with x86_64](https://github.com/unixerius/DSO/blob/main/Lab%20setup/VirtualBox-instructions.md)
* [KVM + LibVirt on Linux, with x86_64](https://github.com/unixerius/DSO/blob/main/Lab%20setup/KVM-Libvirt-instructions.md)
* [Qemu on MacOS, with aarch64](https://github.com/unixerius/DSO/blob/main/Lab%20setup/Qemu-instructions.md)
* [UTM on MacOS, with aarch64](https://github.com/unixerius/DSO/blob/main/Lab%20setup/UTM-instructions.md)

Using these instructions you will do the following:

1. Download and install the required software.
2. Download a Vagrant configuration file and use it to setup a new Vagrant project.
3. Use Vagrant to create and install the VM.

