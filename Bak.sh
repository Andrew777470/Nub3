#!/bin/sh
# peremennaiy wwod
# day now
 date_time=`date +"%Y-%m-%d_%H-%M"`
#destination
 bk_dir='/etc/backuping/back1'
 user='root'
 password='Fq1u8erK#'
#bd_name='wordpress'

#  usr/bin
mysqldump --opt -u$user -p$password -A | /usr/bin/gzip -c > $bk_dir/mysql_$date_time.sql.gz
