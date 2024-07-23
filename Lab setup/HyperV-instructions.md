# Windows on x86_64

For students using Windows 10 or 11 on Intel/AMD systems the best option is to use HyperV. It offers better performance than VirtualBox.

## Preparations to use Hyper-V:

* You must have access to local administrator rights. 
* Windows **must** have Hyper-V and virtualization services installed.
* [Download and install Vagrant](https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant)

From the "Lab Setup" folder, download the [Vagrantfile-HyperV-x86_64](https://github.com/unixerius/DSO/blob/readme-july/Lab%20setup/Vagrantfile-HyperV-x86_64), put it in a separate folder, rename it to `Vagrantfile`. 

Then search for Powershell in your Start-menu **and run it as Administrator**. Then `cd` into the directory with the Vagrantfile and run `vagrant up`.

This process will take about 10-15 minutes, depending on your Internet connection speed.

> If Hyper-V asks you which virtual switch you want to connect to, choose the Default Switch.

[Here's a video that shows the process.](https://www.youtube.com/watch?v=DsEdfCggXlQ)

After the installation is complete, you can login to the VM with `vagrant ssh` and you can shut it down with `vagrant halt`. Later you can start it up with `vagrant up` again.

> Using any of the Vagrant commands with the HyperV VM will require a Powershell window which runs with Administrator rights.

