node 'katello' {


	yumrepo {

                'epel':
                        baseurl => $operatingsystemrelease ? {
                                '6.0' => "http://mirror.eurid.eu/epel/6/$hardwaremodel/",
                                '*' => "http://mirror.eurid.eu/epel/5/$hardwaremodel/",
                        },
                        descr => $operatingsystemrelease ? {
                                '6.0' => 'Extra Packages for Enterprise Linux 6.x
',
                                '*' => 'Extra Packages for Enterprise Linux 5.x',
                        },
                        gpgcheck => 0,
                        enabled => 1;

		'epel-katello':
			enabled => 1 ,
		 	baseurl => "http://repos.fedorapeople.org/repos/katello/katello/6Server/x86_64/",
			gpgcheck => 0,



        }



	


  	service { "iptables":
                ensure => "stopped",
                enable => "false";
                }
	
	package {
		
		"kathello":
			ensure => "present";
	}

	

}


