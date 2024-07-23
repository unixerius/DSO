# MacOS on Apple Silicon (ARM M1/M2)

Students with a modern Macintosh computer with Apple Silicon processor can also use UTM if they don't want to install Homebrew and Qemu. 

## Apple Silicon - UTM

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


