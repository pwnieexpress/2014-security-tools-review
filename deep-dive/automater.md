# Automater

**Language:** Python
**Last Actiive:**
**Website:** http://www.tekdefense.com/automater/

## Install on Kali

```bash
sudo apt-get install automater
```

On first installation from kali it worked fine but errored I tried to start it. 

```bash
root@kali-host:~# automater 
Traceback (most recent call last):
  File "/usr/bin/automater", line 3, in <module>
      import httplib2, re, sys, argparse, urllib, urllib2
      ImportError: No module named httplib2
```

I was able to bypass this issue with: 

```bash
wget http://httplib2.googlecode.com/files/httplib2-0.8.zip
apt-get install unzip
unzip httplib2-0.8.zip
cd httplib2-0.8
python setup.py install
```

Now when I ran the `automater` command I got a nice banner message:

```bash

   ___        _                        _
   / _ \      | |                      | |
  / /_\ \_   _| |_ ___  _ __ ___   __ _| |_ ___ _ __
  |  _  | | | | __/ _ \| '_ ` _ \ / _` | __/ _ \ '__|
  | | | | |_| | || (_) | | | | | | (_| | ||  __/ |
  \_| |_/\__,_|\__\___/|_| |_| |_|\__,_|\__\___|_|

  Welcome to Automater! I have created this tool to help analyst investigate IP Addresses and URLs with the common web based tools.  All activity is passive so it will not alert attackers.
  Web Tools used are: IPvoid.com, Robtex.com, Fortiguard.com, unshorten.me, Urlvoid.com, Labs.alienvault.com
  www.TekDefense.com
  @author: 1aN0rmus@TekDefense.com, Ian Ahl
  Version 1.2
```

Next I tried running it against a metasploitable VM and the pwnieexpress.com domain:

```
root@PwnPlugR2:~/httplib2-0.8# automater -t 10.73.73.16

# ignore banner...

--------------------------------
[*] 10.73.73.16 is an IP.
[*] Running IP toolset
[-] This IP does not resolve to a domain
[-] IP is not listed in a blacklist
[-] No ISP listed
[-] No GEO location listed
[-] FortiGuard URL Categorization: Uncategorized
[+] IP is listed in AlienVault IP reputation database at http://labs.alienvault.com/labs/index.php/projects/open-source-ip-reputation-portal/information-about-ip/?ip=10.73.73.16
root@PwnPlugR2:~/httplib2-0.8# automater -t pwnieexpress.com

# ignore banner...

--------------------------------
[*] pwnieexpress.com is a URL.
[*] Running URL toolset
[-] IP is not listed
[-] IP is not listed in a blacklist
[+] Latitude / Longitude: 41.8776 / -87.6272
[+] Country:  (US) United States
[+] Country:  (US) United States
[+] Domain creation date: 2010-10-17 (3 years ago)
[-] FortiGuard URL Categorization: Uncategorized
```
