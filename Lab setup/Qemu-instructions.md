# Qemu on MacOS on Apple Silicon (ARM M1/M2)

For students with a modern Macintosh computer with Apple Silicon processor the easiest option is to use Homebrew, Qemu and Vagrant.

## Apple Silicon - Qemu and Vagrant

1. [Download and Install Homebrew.](https://brew.sh)
2. Install Vagrant and Qemu, by running `brew install -y qemu vagrant`.
3. Install the Qemu plugin for Vagrant: `vagrant plugin install vagrant-qemu`
4. Download the *Vagrantfile-Qemu-aarch64*, put it in a separate folder, rename it to *Vagrantfile*, then run `vagrant up`.

The building and installing of the VM will take 20-30 minutes, depending on your Internet connection speed.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.


