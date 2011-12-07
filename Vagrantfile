Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :katello do |katello_config|
       katello_config.vm.box = "Centos6"
       katello_config.ssh.max_tries = 100
       katello_config.vm.host_name = "katello"
       katello_config.vm.forward_port "http", 80, 8080
       katello_config.vm.provision :puppet do |katello_puppet|
       		katello_puppet.pp_path = "/tmp/vagrant-puppet"
       		katello_puppet.manifests_path = "manifests"
       		katello_puppet.module_path = "modules"
       		katello_puppet.manifest_file = "site.pp"
       end
  end
 #config.vm.define :katello_fed do |katello_fed_config|
 #      katello_fed_config.vm.box = "Fedora15"
 #      katello_fed_config.ssh.max_tries = 100
 #      katello_fed_config.vm.host_name = "katello_fed"
 #      katello_fed_config.vm.forward_port "http", 8080, 8080
 #      katello_fed_config.vm.forward_port "slave", 8081, 8081
 #      katello_fed_config.vm.provision :puppet do |katello_fed_puppet|
 #      		katello_fed_puppet.pp_path = "/tmp/vagrant-puppet"
 #      		katello_fed_puppet.manifests_path = "manifests"
 #      		katello_fed_puppet.module_path = "modules"
 #      		katello_fed_puppet.manifest_file = "site.pp"
 #      end
 #
 # end

end
