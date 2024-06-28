# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
#  config.vm.box = "mwrock/Windows2012R2"
  config.vm.box = "chocolatey/test-environment"

  # Uncomment the following line to restrict the version of the box to use,
  # otherwise the latest version available will be used.
  # config.vm.box_version = "2.0.0"

  # http://docs.vagrantup.com/v2/providers/configuration.html
  # http://docs.vagrantup.com/v2/virtualbox/configuration.html
  config.vm.provider :virtualbox do |v, override|
    # Show the GUI
    v.gui = ENV['VM_GUI'] ? ENV['VM_GUI'].to_s.downcase == 'true' : true
    # 4GB RAM
    v.memory = ENV['VM_MEMORY'] ? ENV['VM_MEMORY'].to_i : 4096
    # 2 CPUs
    v.cpus = ENV['VM_CPU'] ? ENV['VM_CPU'].to_i : 2
    # Video RAM is 32 MB
    v.customize ["modifyvm", :id, "--vram", 32]
    # For better DNS resolution
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # No audo
    v.customize ["modifyvm", :id, "--audio", "none"]
    # Clipboard enabled
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    v.customize ["modifyvm", :id, "--draganddrop", "hosttoguest"]
    # For performance
    v.customize ["modifyvm", :id, "--usb", "off"]
    # Huge performance gain here
    v.linked_clone = true if Vagrant::VERSION >= '1.8.0'
  end

  # https://www.vagrantup.com/docs/hyperv/configuration.html
  # https://technet.microsoft.com/en-us/library/dn798297(v=ws.11).aspx
  config.vm.provider :hyperv do |v, override|
    # 4GB RAM
    v.memory = ENV['VM_MEMORY'] ? ENV['VM_MEMORY'].to_i : 4096
    # 2 CPUs
    v.cpus = ENV['VM_CPU'] ? ENV['VM_CPU'].to_i : 2
    # The time in seconds to wait for the virtual machine to report an IP address
    v.ip_address_timeout = 130
    # Use differencing disk instead of cloning whole VHD
    if Vagrant::VERSION >= '2.1.2'
      v.linked_clone = true
    else
      v.differencing_disk = true
    end
    v.vm_integration_services = {
      guest_service_interface: true,
      heartbeat: true,
      key_value_pair_exchange: true,
      shutdown: true,
      time_synchronization: true,
      vss: true
  }
  end

  # timeout of waiting for image to stop running - may be a deprecated setting
  config.windows.halt_timeout = 20
  # username/password for accessing the image
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"
  config.winrm.port = 55985
  # explicitly tell Vagrant the guest is Windows
  config.vm.guest = :windows

  config.winrm.transport = :plaintext
  config.winrm.basic_auth_only = true


  if Vagrant::VERSION >= '1.6.0'
    # If we are on greater than v1.6.x, we are using the built-in version
    # of communicating with Windows. For versions less than 1.6 the
    # `vagrant-windows` plugin would need to be installed and uses monkey
    # patching to override the communicator.
    config.vm.communicator = "winrm"
  end


end
