for what: simple create iptables rule for opening port(working only on linux)

it analog of port knocking https://en.wikipedia.org/wiki/Port_knocking but more "smart"


how it works:

1) client from browser go to serversomewhere.ru and input login alin and password alin
2) after waiting 2 minutes iptables open port and client may come in 



how it works inside:
1) client(222.222.222.222) from browser go to serversomewhere.ru(1.1.1.1) and input login alin and password alin
2) apache server on serversomewhere.ru(1.1.1.1) write to own access.log something like
222.222.222.222 - alin [05/Jun/2019:02:03:00 +1000] "GET /favicon.ico HTTP/1.1" 500 639 "http://serversomewhere.ru/" "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 YaBrowser/19.4.3.370 Yowser/2.5 Safari/537.36"
3) script /usr/local/bin/iptablesaddrule.sh(started every 2 minutes) add iptables rule  for opening service port 3389 for client's ip address 
222.222.222.222
4) profit!


easy start
1) correct iptablesaddrule.sh and move it to /usr/local/bin
2) add content this file crontab to your crontab
3) install apache2 if you not have it and create .htaccess and .htpasswd with user alin or your own




