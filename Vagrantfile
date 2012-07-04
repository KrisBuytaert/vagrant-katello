Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :katello do |katello_config|
       katello_config.vm.box = "Centos6"
       katello_config.vm.network  :hostonly, "10.42.44.2"
       katello_config.ssh.max_tries = 100
       katello_config.vm.host_name = "katello"
       katello_config.vm.forward_port  80, 8080
       katello_config.vm.provision :puppet do |katello_puppet|
       		katello_puppet.pp_path = "/tmp/vagrant-puppet"
       		katello_puppet.manifests_path = "manifests"
       		katello_puppet.module_path = "modules"
       		katello_puppet.manifest_file = "site.pp"
       end
  end
  config.vm.define :sponge do |sponge_config|
       sponge_config.vm.box = "Centos6"
       sponge_config.ssh.max_tries = 100
       sponge_config.vm.host_name = "sponge"
       sponge_config.vm.network  :hostonly, "10.42.44.3"
       sponge_config.vm.provision :puppet do |sponge_puppet|
       		sponge_puppet.pp_path = "/tmp/vagrant-puppet"
       		sponge_puppet.manifests_path = "manifests"
       		sponge_puppet.module_path = "modules"
       		sponge_puppet.manifest_file = "site.pp"
       end
  end

end
