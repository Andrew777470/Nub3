
#! /usr/bin/bash
wget http://wordpress.org/latest.tar.gz  ;
sudo tar xzvf latest.tar.gz;
sudo yum install rsync -y;
sudo rsync -avP /home/adminroot/wordpress/ /var/www/wordpress;
sudo touch /var/www/wordpress/wp-config.php
sudo cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php;
sudo chmod 755 /var/www;
sudo sed -i s%"username_here"%"wordpressuser"% /var/www/wordpress/wp-config.php;
sudo sed -i s%"database_name_here"%"wordpress"% /var/www/wordpress/wp-config.php;
sudo sed -i s%"password_here"%"Fq1u8erK#"% /var/www/wordpress/wp-config.php;

