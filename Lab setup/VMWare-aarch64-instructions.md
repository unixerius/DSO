# VMWare Fusion on MacOS on Apple Silicon (ARM M1/M2)

For students with a modern Macintosh computer with Apple Silicon processor, who want a more user-friendly option than Qemu, we will go for VMWare Fusion.

**I advise you to NOT use VMWare** on MacOS ARM; it does not play well with Vagrant at all.

**Note:** You will need to register an account with Broadcom / VMware.

## Preparations for VMWare

1. [Download and Install Homebrew.](https://brew.sh)
2. Install Vagrant, by running `brew install -y qemu vagrant`.
3. Visit [the "Install Vagrant VMWare Utility" page](https://developer.hashicorp.com/vagrant/install/vmware) and download the ARM64 binary download.
4. Install the Vagrant VMWare Utility, from the downloaded DMG file. 
5. Install the Qemu plugin for Vagrant: `vagrant plugin install vagrant-vmware-desktop`

## Installing VMware

1. Visit [the page to download VMWare Fusion](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion).
2. Register an account with Broadcom to get the download.
3. Go to: https://support.broadcom.com/group/ecx/free-downloads
4. Search for "Fusion".
5. Accept the terms and conditions, fill out your personal details and then download.
6. Using the downloaded installer, install VMWare Fusion.

The installation is complete when you get a VMWare Fusion screen to create your first VM.

## Creating the lab VM

Download the [Vagrantfile-VMWare-aarch64](https://github.com/unixerius/DSO/blob/main/Lab%20setup/Vagrantfile-VMWare-aarch64) file, put it in a separate folder, rename it to *Vagrantfile*. **The filename must literally be** `Vagrantfile`. No extensions.

In a terminal `cd` into that filder and then run `vagrant up --provider=vmware_desktop`. The building and installing of the VM will take 20-30 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

## Logging in to the VM

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up --provider=vmware_desktop` again.

The credentials for the VM are set by default:

* Username: `vagrant`
* Password: `vagrant`
* Sudo password: `vagrant`

