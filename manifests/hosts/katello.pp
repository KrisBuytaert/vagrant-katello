node 'katello' {


	yumrepo {


		'candlepin':	
			enabled => 0,
			baseurl => 'http://repos.fedorapeople.org/repos/candlepin/candlepin/epel-6Server/$basearch/',	
			gpgcheck => 0;


		'pulp':

			enabled => 1 ,
			baseurl => 'http://repos.fedorapeople.org/repos/pulp/pulp/6Server/$basearch/',
			gpgcheck => 0;




		'katello':
			enabled => 1 ,
				baseurl => "http://repos.fedorapeople.org/repos/katello/katello/6Server/x86_64/",
				gpgcheck => 0;

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



	}






	service { "iptables":
		      ensure => "stopped",
		      enable => "false";
		  "httpd":
		      ensure => "running",

	}

	package {
		"centos-release-cr":
			ensure => "present";
#		"katello":
#			ensure => "present";
		"pulp":
			ensure => "present";
	}



}


