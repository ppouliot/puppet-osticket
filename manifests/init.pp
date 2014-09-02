# == Class: osticket
#
# Full description of class osticket here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { osticket:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class osticket {

#Lamp Stack Install Steps, 
#2.	sudo apt-get install apache2
#3.	sudo /etc/init.d/apache2 start
#4.	sudo apt-get install php5 libapache2-mod-php5
#5.	sudo /etc/init.d/apache2 restart
#6.	touch /var/www/test.php
#7.	http://10.21.7.100/test.php
#8.	sudo apt-get install mysql-server
#9.	mysql -u root –p
#10.SET PASSWORD FOR root@localhost = Ubuntu
#11.Sudo /etc/init.d/mysql start

  class{'apache':
    default_vhost => true,
    mpm_module => prefork,
    service_enable => true,
    service_ensure => running,
  }
  class {'apache::mod::php':}

  apache::vhost {'osticket':
    priority => '10',
    vhost_name => $::ipaddress,
    port => 80,
    docroot => '/var/www/html/osticket',
    logroot => '/var/log/osticket',
	require => Vcsrepo['/var/www/html/osticket'],
  }
  
  class{'mysql::server':
    root_password => 'ubuntu',
  }

  mysql::db { 'osticket':
    user => 'root',
    password => 'ubuntu',
    host => 'localhost',
    grant => ['CREATE','INSERT','SELECT','DELETE','UPDATE'],
    require => Class['mysql::Server'],
  }
  
  
#Osticket Install steps,
#12.	sudo mkdir /var/www/support.
#13.	git clone https://github.com/osTicket/osTicket-1.8/archive/v1.8.5.tar.gz
#14.	sudo tar xvzf osticket_v1.8.5.tar.gz     
#15.	Moved all of the files from the /var/www/support/osticket_v1.8.5.tar.gz 
#16.	sudo mv /var/www/osticket_v1.8.5.tar.gz /var/www/support/osticket_v1.8.5.tar.gz

  vcsrepo { '/var/www/html/osticket/':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/osTicket/osTicket-1.8'
  }
  
  file {'/var/www/html/osticket/include/ost-config':
    ensure  => file,
	source  => '/var/www/html/osticket/include/ost-config.sample.php',
	mode    => '0644',
	require => Vcsrepo['/var/www/html/osticket'],
  }
  
  
#17.	Renamed the file ost-config.sample.php 
#18.	sudo mv /var/www/support/include/ost-config.sample.php /var/www/support/include/ost-config.php.
#19.	sudo chmod 777 /var/www/support/include/ost-config.php.
#20.	Pointed browser to https://10.21.7.100/support
#21.	Answered installation questions
#22.	Chmod 644 /var/www/support/incude/ost-conf.php
#23.	Rm –rf /var/www/support/setup

}