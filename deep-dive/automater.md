# Automater

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
