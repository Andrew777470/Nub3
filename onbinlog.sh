#!/bin/bash
sudo cat >> /etc/my.cnf <<EOF
  #on boooking
 log-bin=mysql-bin
#save 7 days
expire_logs_days=7
#cache binlog
binlog-cache-size=128K
#syncronization book
#sync-binlog=1
#limit log
max-binlog-size=350M
#max cache
max-binlog-cache-size=90M
EOF

