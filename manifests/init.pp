# == Class: osticket
#
# This puppet module installs the opensource ticketing system osTicket.
# Additional information about osTicket can be found here.
# This software is provided asis so use at your own risk.
#
# === Variables
#
# Currently this Class consumes the following variables.
#
# [*ost_dir*]
#   The directory which contains the source code for osTicket
# [*ost_install_dir*]
#   The directory where osTicket will be installed into
# [*ost_db_user*]
#  The username used for the osTicket database connections
# [*ost_db_password*]
#   The password used to authenticate the ost_db_user to the osTicket database
# [*ost_db_name*]
#   The name of the database osTicket will connect to.
# [*ost_db_host*]
#   The host running the osTicket database instance
#
# === Examples
#
#  class { osticket: }
#
# === Authors
#
# Author Name <peter@pouliot.net>
#
# === Copyright
#
# Copyright 2014 Peter J. Pouliot <peter@pouliot.net>, unless otherwise noted.
#
class osticket (
  $ost_dir   = $osticket::params::ost_dir,
  $ost_install_dir = $osticket::params::ost_install_dir,
  $ost_db_name     = $osticket::params::ost_db_name,
  $ost_db_user     = $osticket::params::ost_db_user,
  $ost_db_passwd   = $osticket::params::ost_db_passwd,
  $ost_db_host     = $osticket::params::ost_db_host,
  $ost_src_url     = $osticket::params::ost_src_url,
  $osticket_admin  = $osticket::params::ost_admin_email
) inherits params {

  php::module{['imap','gd',]:
    notify => [Service['apache2'],Exec['enable-php5-imap']],
  }
  exec {'enable-php5-imap':
    command     => '/usr/sbin/php5enmod imap',
    unless      => '/usr/sbin/php5query -M |grep imap',
    refreshonly => true,
  }

  class{'apache':
    default_vhost  => true,
    mpm_module     => prefork,
    service_enable => true,
    service_ensure => running,
  }
  class {'apache::mod::php':}

  apache::vhost {'osTicket':
    priority   => '10',
    vhost_name => $::ipaddress,
    port       => 80,
    docroot    => $ost_install_dir,
    logroot    => "/var/log/${module_name}",
    require    => Vcsrepo[$ost_dir],
  }

  class { 'mysql::server':
    config_hash => { 'root_password' => $ost_db_passwd }
  }

  mysql::db { $ost_db_name:
    user     => $ost_db_user,
    password => $ost_db_passwd,
    host     => $ost_db_host,
    grant    => ['all'],
  }

  vcsrepo { $ost_dir:
    ensure   => present,
    provider => git,
    source   => $ost_src_url,
    require  => Package['php5-gd'],
    owner    => 'www-data',
    group    => 'www-data',
    notify   => Exec['Run-OsTicket-Setup'],
  }

#  file {"${ost_dir}/include/ost-config.php":
  file {"${ost_install_dir}/include/ost-config.php":
    ensure  => file,
    content => template("${module_name}/ost-config.php.erb"),
    mode    => '0655',
    require => Apache::Vhost['osTicket'],
#    notify  => Exec['Run-OsTicket-Setup'],
  }

  exec {'Run-OsTicket-Setup':
#    command     => "/usr/bin/php5 -q ./install.php",
    command     => "/usr/bin/php5 setup/cli/manage.php deploy --setup ${ost_install_dir}",
    cwd         => $ost_dir,
    refreshonly => true,
#    require     => File["${ost_dir}/include/ost-sampleconfig.php"],
    require     => [ Apache::Vhost['osTicket'], Vcsrepo[$ost_dir]],
    logoutput   => true,
  }

#  file {"${ost_install_dir}/include/ost-sampleconfig.php":
#    ensure  => absent,
#    require => File["${ost_install_dir}/include/ost-config.php"],
#  }
#  file {"${ost_install_dir}/setup":
#    ensure  => absent,
#    require => File["${ost_install_dir}/include/ost-config.php"],
#  }
}
