#!/usr/bin/env bash

echo "-------------------------------"
echo "system update"
echo "-------------------------------"
yum -y update

echo "-------------------------------"
echo "install git vim zsh"
echo "-------------------------------"
yum -y install git vim zsh

echo "-------------------------------"
echo "chenge login shel"
echo "-------------------------------"
chsh -s /bin/zsh vagrant
cp /vagrant/zsh/.zshrc /home/vagrant/.zshrc

echo "-------------------------------"
echo "install repository"
echo "-------------------------------"
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh http://rpms.famillecollet.com/enterprise/6/remi/i386/remi-release-6.5-1.el6.remi.noarch.rpm

echo "-------------------------------"
echo "install php"
echo "-------------------------------"
yum -y install --enablerepo=remi --enablerepo=remi-php55 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug

cp /etc/php.ini /etc/php.ini.org
cp /vagrant/php/php.ini /etc/php.ini

chmod 777 /var/lib/php/session

echo "-------------------------------"
echo "install mysql"
echo "-------------------------------"
yum -y --enablerepo=remi install mysql-server

service mysqld start
chkconfig mysqld on

mysqladmin -u root password root

cp /etc/my.cnf /etc/my.cnf.org
cp /vagrant/mysql/my.cnf /etc/my.cnf



echo "-------------------------------"
echo "install php-fpm"
echo "-------------------------------"
yum -y --enablerepo=remi-php55,remi install php-fpm
cp /php-fpm.d/www.conf /php-fpm.d/www.conf.org
cp /etc/vagrant/php/www.conf /php-fpm.d/www.conf

service php-fpm start
chkconfig php-fpm on

echo "-------------------------------"
echo "install phpMyAdmin"
echo "-------------------------------"
sudo yum --enablerepo=remi,remi-php55 install -y phpMyAdmin php-mysql php-mcrypt
mv /usr/share/phpMyAdmin /usr/share/phpmyadmin

echo "-------------------------------"
echo "install composer"
echo "-------------------------------"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "-------------------------------"
echo "install cakephp"
echo "-------------------------------"
git clone git://github.com/cakephp/cakephp.git /vagrant/www/cake-app
mysql -u root -proot -e "CREATE DATABASE cake_app;"
cp -rf /vagrant/cake/*.php /vagrant/www/cake-app/app/Config/

echo "-------------------------------"
echo "install nginx"
echo "-------------------------------"
sudo yum -y install nginx

cp -rf /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.org
cp -rf /vagrant/nginx/*.conf /etc/nginx/conf.d/

service nginx start
chkconfig nginx on

echo "-------------------------------"
echo "service restart"
echo "-------------------------------"
service php-fpm restart
service mysql restart
service nginx reload
