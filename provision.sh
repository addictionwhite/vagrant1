
# install vim 
sudo yum -y install vim

# install apache
sudo yum -y install httpd
# start apache
sudo systemctl start httpd
# add apache to the not  auto start
sudo systemctl enable httpd

# stop firewall
sudo systemctl stop firewalld
# add firewall to the not  auto start
sudo systemctl disable firewalld

# set vagrant share folder
sudo rm -rf /var/www/html
sudo ln -fs /vagrant /var/www/html


# add index.htm
cd /vagrant
touch index.html
echo "<!DOCTYPE html><html><head><meta charset='utf-8'><title>test</title></head><body>Hello World</body></html>" > index.html


# install Epel
sudo yum -y install epel-release
# install Remi
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo rpm -ivh ./remi-release-7.rpm

# install php
sudo yum -y --enablerepo=remi-php70,remi install php php-mcrypt php-mbstring php-fpm php-gd php-xml php-pdo php-mysqlnd php-devel


# mariaDBとの競合を防ぐため
yum -y remove mariadb-libs
rm -rf /var/lib/mysql

# https://dev.mysql.com/downloads/repo/yum/を参照
yum -y localinstall http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum -y install mysql-community-server

# 必要最小限のMySQLの設定内容を書き込む
cat << __CONF__ >> /etc/my.cnf
character-set-server = utf8
default_password_lifetime = 0
__CONF__

# MySQLの自動起動を有効化し起動する
systemctl enable mysqld
systemctl start mysqld
# 初期パスワードを取得する
password=`cat /var/log/mysqld.log | grep "A temporary password" | tr ' ' '\n' | tail -n1`

mysql -u root -p${password} --connect-expired-password < /vagrant/provisioner.sql


#Composer install
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer


#git install
sudo yum -y install git

