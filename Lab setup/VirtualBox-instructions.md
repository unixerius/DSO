# VirtualBox (Windows/MacOS/Linux) on x86_64 (Intel core i5/i7/i9 or AMD Ryzen)

Students with an older MacOS system with an x86_64 processor (Intel or AMD), or using Linux, or using Windows 10/11 can use the *Vagrantfile-VirtualBox-x86_64* under "Lab setup".

## Preparations for VirtualBox

* [Download and install Virtualbox](https://virtualbox.org)
* [Download and install Vagrant](https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant)
* Students on MacOS need to get [Homebrew](https://brew.sh) and install Vagrant using that.

## Creating the lab VM

Then download the [Vagrantfile-VirtualBox-x86_64](https://github.com/unixerius/DSO/blob/readme-july/Lab%20setup/Vagrantfile-VirtualBox-x86_64) and put it in a separate folder. Rename the file to `Vagrantfile`. **The filename must literally be** `Vagrantfile`. No extensions.

In a terminal `cd` into that folder and run `vagrant up`.

This process will take about 10-15 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

## Logging into the VM

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.

The credentials for the VM are set by default:

* Username: `vagrant`
* Password: `vagrant`
* Sudo password: `vagrant`

