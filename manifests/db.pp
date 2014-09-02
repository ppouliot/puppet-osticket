class zoneminder::db {

include zoneminder::params

class{'mysql::server': root_password => $zoneminder::params::zm_db_pass }

mysql::db { $zoneminder::params::zm_db_name:
user => $zoneminder::params::zm_db_user,
password => $zoneminder::params::zm_db_pass,
host => $zoneminder::params::zm_db_host,
grant => ['CREATE','INSERT','SELECT','DELETE','UPDATE'],
require => Class['mysql::server'],
}

class{'mysql::bindings':
python_enable => 'true',
php_enable => 'true',
perl_enable => 'true',
}
}