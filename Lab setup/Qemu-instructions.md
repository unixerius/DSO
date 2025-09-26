# Qemu on MacOS on Apple Silicon (ARM M1/M2)

For students with a modern Macintosh computer with Apple Silicon processor the easiest option is to use Homebrew, Qemu and Vagrant.

## Preparations for Qemu

1. [Download and Install Homebrew.](https://brew.sh)
2. Install Vagrant and Qemu, by running `brew install qemu vagrant`.
3. Install the Qemu plugin for Vagrant: `vagrant plugin install vagrant-qemu`

## Creating the lab VM

Download the [Vagrantfile-Qemu-aarch64](https://github.com/unixerius/DSO/blob/main/Lab%20setup/Vagrantfile-Qemu-aarch64) file, put it in a separate folder, rename it to *Vagrantfile*. **The filename must literally be** `Vagrantfile`. No extensions.

In a terminal `cd` into that filder and then run `vagrant up`. The building and installing of the VM will take 20-30 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

## Logging in to the VM

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.

The credentials for the VM are set by default:

* Username: `vagrant`
* Password: `vagrant`
* Sudo password: `vagrant`

