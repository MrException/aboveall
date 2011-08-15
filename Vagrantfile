Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "natty32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"
  config.vm.box_url = "http://dl.dropbox.com/u/7490647/talifun-ubuntu-11.04-server-i386.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  config.vm.network "33.33.33.10"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port "http", 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # Setup chef using Opscode Hosted Chef
  config.vm.provision :chef_client do |chef|
 
    # Set up some organization specific values based on environment variable above.
    chef.chef_server_url = "https://api.opscode.com/organizations/mrexception"
    chef.validation_key_path = "#{ENV['HOME']}/.chef/mrexception-validator.pem"
    chef.validation_client_name = "mrexception-validator"
 
    # Change the node/client name for the Chef Server
    chef.node_name = "aboveall-vagrant"
 
    # Put the client.rb in /etc/chef so chef-client can be run w/o specifying
    chef.provisioning_path = "/etc/chef"
 
    # logging
    chef.log_level = :info
 
    # adjust the run list to suit your testing needs
    chef.run_list = [
      "recipe[ruby1.9]"
    ]
  end
end
