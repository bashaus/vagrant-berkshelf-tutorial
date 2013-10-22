%w{ php5 php5-dev php5-cli php-pear php5-mysql php5-curl php5-imagick php-apc php5-gd php5-memcache php5-mcrypt php5-gmp}.each do | pkg |
  package pkg do
    action :install
    notifies :restart, "service[apache2]"
  end
end