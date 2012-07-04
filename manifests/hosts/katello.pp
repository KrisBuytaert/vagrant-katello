node 'katello' {

  yumrepo {
    'epel':
      baseurl => $operatingsystemrelease ? {
        '6.0' => "http://mirror.eurid.eu/epel/6/${hardwaremodel}/",
        '*'   => "http://mirror.eurid.eu/epel/5/${hardwaremodel}/",
      },
      descr   => $operatingsystemrelease ? {
        '6.0' => 'Extra Packages for Enterprise Linux 6.x ',
        '*'   => 'Extra Packages for Enterprise Linux 5.x',
      },
      gpgcheck => 0,
      enabled  => 1;

  }



  yumrepo { 'pulp-v1-stable':
    baseurl   => 'http://repos.fedorapeople.org/repos/pulp/pulp/v1/stable/$releasever/$basearch/',
    descr     => 'Pulp v1',
    enabled   => '1',
    gpgcheck  => '0',
  }
  yumrepo { 'pulp-v1-testing':
    baseurl   => 'http://repos.fedorapeople.org/repos/pulp/pulp/v1/testing/$releasever/$basearch/',
    descr     => 'Pulp v1 Testing',
    enabled   => '0',
    gpgcheck  => '0',
  }
  yumrepo { 'pulp-dev-cr':
    baseurl   => 'http://repos.fedorapeople.org/repos/pulp/pulp/dev/stable/$releasever/$basearch/',
    descr     => 'Pulp Community Releases',
    enabled   => '0',
    gpgcheck  => '0',
  }
  yumrepo { 'pulp-dev-testing':
    baseurl   => 'http://repos.fedorapeople.org/repos/pulp/pulp/dev/testing/$releasever/$basearch/',
    descr     => 'Pulp Testing Builds',
    enabled   => '0',
    gpgcheck  => '0',
  }



  service { 'iptables':
    ensure => 'stopped',
    enable => 'false';


  }

  package {
    'centos-release-cr':
      ensure => 'present';
    }


    include pulp
}


