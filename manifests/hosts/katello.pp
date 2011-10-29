node 'katello' {


	yumrepo {

		'katello':
			enabled => 1 ,
                        baseurl => "http://repos.fedorapeople.org/repos/katello/katello/fedora-15/x86_64/",
			gpgcheck => 0,



        }



	


  	service { "iptables":
                ensure => "stopped",
                enable => "false";
                }
	
	package {
		
		"katello-all":
			ensure => "present";
	}

	

}


