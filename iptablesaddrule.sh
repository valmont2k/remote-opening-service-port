#!/bin/bash

ips0=`cat /var/www/serversomewhere.ru/logs/access.log  | grep alin| cut -d " " -f 1 | sort | uniq`

echo ips0 is $ips0

old_ips=`cat /var/www/serversomewhere.ru/logs/ips|sort |uniq`

echo old_ips is $old_ips


rm /var/www/serversomewhere.ru/logs/ips

for old_ip in $old_ips
do
      echo $old_ip >>  /var/www/serversomewhere.ru/logs/ips
      done



for ip in $ips0
do
      echo $ip >>  /var/www/serversomewhere.ru/logs/ips
      done



ips=`cat /var/www/serversomewhere.ru/logs/ips |sort|uniq`

echo ips is $ips
      
MYIP=222.222.222.222
HOST=192.168.0.1

for ip in $ips
do
  echo "Processing $ip address"
    # take action on each file. $f store current file name
    
    
#delete this rule if it exist
/sbin/iptables -t nat -D PREROUTING -s $ip -d $MYIP -p tcp --dport 3389 -j DNAT --to-destination $HOST
#add net rule 
/sbin/iptables -t nat -A PREROUTING -s $ip -d $MYIP -p tcp --dport 3389 -j DNAT --to-destination $HOST


      done

