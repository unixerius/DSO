# Libvirt / KVM on Linux, with x86_64 / amd64

For students who run Linux on their laptop, and who don't use Virtualbox but prefer KVM / Libvirt.

## Preparations

1. Install Vagrant using your Linux flavor's package manager, e.g. *sudo apt install -y vagrant*.

## Creating the lab VM

Download the [Vagrantfile-kvm-libvirt-x86_64](https://github.com/unixerius/DSO/blob/main/Lab%20setup/Vagrantfile-kvm-libvirt-x86_64) file, put it in a separate folder, rename it to *Vagrantfile*. **The filename must literally be** `Vagrantfile`. No extensions.

In a terminal `cd` into that filder and then run `vagrant up --provider=libvirt`. The building and installing of the VM will take 20-30 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

## Logging in to the VM

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up --provider=libvirt` again.

The credentials for the VM are set by default:

* Username: `vagrant`
* Password: `vagrant`
* Sudo password: `vagrant`

