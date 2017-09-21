
#VIM$B$N%$%s%9%H!<%k(B
sudo yum -y install vim

#httpd$B$N%$%s%9%H!<%k(B
sudo yum -y install httpd
#httpd$B$N%9%?!<%H!J(BApache$B%5!<%P5/F0!K(B
sudo systemctl start httpd
#Apache$B%5!<%P$N<+F05/F0(B
sudo systemctl enable httpd


#$B%U%!%$%d!<%&%)!<%k$NDd;_(B
sudo systemctl stop firewalld
#$B%U%!%$%d!<%&%)!<%k$r(BOS$B5/F0;~$K<+F0Dd;_$5$;$k(B
sudo systemctl disable firewalld

#Web$B$GI=<($9$k%U%)%k%@$r:o=|(B
sudo rm -rf /var/www/html
#Web$B$GI=<($9$k%U%)%k%@$r!%6&M-%U%)%k%@$G$"$k(B/vagrant$B$H%7%s%\%j%C%/%j%s%/(B
sudo ln -fs /vagrant /var/www/html


#index.html$B$N%U%!%$%k$N:n@.(B
cd /vagrant
touch index.html
echo "<!DOCTYPE html><html><head><meta charset='utf-8'><title>test</title></head><body>Hello World</body></html>" > index.html


#Epel$B%j%]%8%H%j$NDI2C(B
sudo yum -y install epel-release
#Remi$B%j%]%8%H%j$NDI2C(B
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo rpm -ivh ./remi-release-7.rpm


#php$B$N%$%s%9%H!<%k(B
sudo yum -y --enablerepo=remi-php70,remi install php php-mcrypt php-mbstring php-fpm php-gd php-xml php-pdo php-mysqlnd php-devel


#MariaDB$B$N:o=|(B(MySQL$B$H6%9g$r5/$3$9$?$a(B)
sudo yum -y remove mariadb-libs


#MySQL$B$N%$%s%9%H!<%k(B(http://dev.mysql.com/downloads/repo/yum/)
sudo yum -y install http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
sudo yum -y install mysql-community-server


#Composer$B$N%$%s%9%H!<%k(B
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer


#git$B$N%$%s%9%H!<%k(B
sudo yum -y install git
