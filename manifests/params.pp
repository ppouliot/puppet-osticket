# == Class: osticket::params
# This class controls the default ost settings
#

class osticket::params {
  $ost_dir             = '/usr/local/src/osTicket'
  $ost_install_dir     = '/var/www/html/support'
  $ost_db_name         = 'osticket'
  $ost_db_user         = 'osticket'
  $ost_db_passwd       = 'osticket'
  $ost_db_host         = '127.0.0.1'
  $ost_version         = '1.8'
  $ost_src_url         = "https://github.com/osTicket/osTicket-${ost_version}"
  $ost_admin_email     = "root@${::fqdn}"
}
