# Automater

**Language:** Python
**Last Active:**
**Website:** http://www.tekdefense.com/automater/

**From the website:**

> Automater is a URL/Domain, IP Address, and Md5 Hash OSINT tool aimed at making
> the analysis process easier for intrusion Analysts. Given a target (URL, IP, or
> HASH) or a file full of targets Automater will return relevant results from
> sources like the following: IPvoid.com, Robtex.com, Fortiguard.com,
> unshorten.me, Urlvoid.com, Labs.alienvault.com, ThreatExpert, VxVault, and
> VirusTotal. 

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

## Updated Version

After installing the kali package I noticed that the documentation on the
website indicated that Kali was shipping an out of date version of this tool. 

The primary advantages of the new version were data sources as well as the
ability to look up hashes from viruses or malware. This functionality is pretty
damn cool and the Kali package would benefit from being updatd.

```
wget https://github.com/1aN0rmus/TekDefense-Automater/archive/master.zip^C
unzip master.zip ^C
cd TekDefense-Automater-master/
python Automater.py e1112134b6dcc8bed54e0e34d8ac272795e73d74
[*] Checking http://malc0de.com/database/index.php?search=e1112134b6dcc8bed54e0e34d8ac272795e73d74
[*] Checking https://www.virustotal.com/vtapi/v2/file/report
[*] Checking http://www.threatexpert.com/report.aspx?md5=e1112134b6dcc8bed54e0e34d8ac272795e73d74
[*] Checking http://vxvault.siri-urz.net/ViriList.php?MD5=e1112134b6dcc8bed54e0e34d8ac272795e73d74

____________________     Results found for: e1112134b6dcc8bed54e0e34d8ac272795e73d74     ____________________
No results found for: [+] Malc0de Date:
No results found for: [+] Malc0de IP:
No results found for: [+] Malc0de Country:
No results found for: [+] Malc0de ASN:
No results found for: [+] Malc0de ASN Name:
No results found for: [+] Malc0de MD5:
[+] MD5 found on VT: 1
[+] Scan date submitted: 2013-12-12 14:31:17
[+] # of virus engines detected on: 46
[+] # of total scan engines: 48
[+] Malware detected on: ('MicroWorld-eScan', 'Trojan.Generic.1717178')
[+] Malware detected on: ('nProtect', 'Backdoor/W32.Hijack.14336.B')
[+] Malware detected on: ('CAT-QuickHeal', 'Backdoor.Hijack.e.n4')
[+] Malware detected on: ('McAfee', 'FakeAlert-AX')
[+] Malware detected on: ('Malwarebytes', 'Trojan.Downloader')
[+] Malware detected on: ('TheHacker', 'Backdoor/Hijack.e')
[+] Malware detected on: ('K7GW', 'Backdoor ( 000714791 )')
[+] Malware detected on: ('K7AntiVirus', 'Virus ( d0b4da330 )')
[+] Malware detected on: ('NANO-Antivirus', 'Trojan.Win32.Hijack.ibag')
[+] Malware detected on: ('F-Prot', 'W32/Downldr2.DIKH')
[+] Malware detected on: ('Symantec', 'Infostealer')
[+] Malware detected on: ('TotalDefense', 'Win32/Cutwail!generic')
[+] Malware detected on: ('TrendMicro-HouseCall', 'TROJ_AGENT.AGTM')
[+] Malware detected on: ('Avast', 'Win32:Trojan-gen')
[+] Malware detected on: ('ClamAV', 'Trojan.Fakealert-532')
[+] Malware detected on: ('Kaspersky', 'Backdoor.Win32.Hijack.e')
[+] Malware detected on: ('BitDefender', 'Trojan.Generic.1717178')
[+] Malware detected on: ('Agnitum', 'Trojan.FakeAlert.Gen!Pac')
[+] Malware detected on: ('ViRobot', 'Backdoor.Win32.Hijack.14336.B')
[+] Malware detected on: ('Ad-Aware', 'Trojan.Generic.1717178')
[+] Malware detected on: ('Sophos', 'Troj/Agent-HNY')
[+] Malware detected on: ('Comodo', 'Backdoor.Win32.Hijack.e0')
[+] Malware detected on: ('F-Secure', 'Trojan.Generic.1717178')
[+] Malware detected on: ('DrWeb', 'Trojan.Inject.3763')
[+] Malware detected on: ('VIPRE', 'Trojan.Win32.Generic!BT')
[+] Malware detected on: ('AntiVir', 'TR/Hijacker.Gen')
[+] Malware detected on: ('TrendMicro', 'TROJ_AGENT.AGTM')
[+] Malware detected on: ('McAfee-GW-Edition', 'FakeAlert-AX')
[+] Malware detected on: ('Jiangmin', 'TrojanDownloader.Agent.abwc')
[+] Malware detected on: ('Antiy-AVL', 'Backdoor/Win32.Hijack.gen')
[+] Malware detected on: ('GData', 'Trojan.Generic.1717178')
[+] Malware detected on: ('Commtouch', 'W32/Downldr2.DIKH')
[+] Malware detected on: ('AhnLab-V3', 'Win-Trojan/Fakeav.14336.I')
[+] Malware detected on: ('VBA32', 'Malware-Cryptor.Win32.Specom')
[+] Malware detected on: ('Panda', 'Bck/Hijack.C')
[+] Malware detected on: ('Ikarus', 'Backdoor.Win32.Hijack')
[+] Malware detected on: ('Fortinet', 'W32/Hijack.E!tr')
[+] Malware detected on: ('AVG', 'I-Worm/Nuwar.X')
[+] Malware detected on: ('Baidu-International', 'Backdoor.Win32.Hijack.aE')
No results found for: [+] Hash found at ThreatExpert:
No results found for: [+] Malicious Indicators from ThreatExpert:
No results found for: [+] Date found at VXVault:
No results found for: [+] URL found at VXVault:

python Automater.py f901feefe2dd5ab8145211305d94a7e3e5389774
[*] Checking http://malc0de.com/database/index.php?search=f901feefe2dd5ab8145211305d94a7e3e5389774
[*] Checking https://www.virustotal.com/vtapi/v2/file/report
[*] Checking http://www.threatexpert.com/report.aspx?md5=f901feefe2dd5ab8145211305d94a7e3e5389774
[*] Checking http://vxvault.siri-urz.net/ViriList.php?MD5=f901feefe2dd5ab8145211305d94a7e3e5389774

____________________     Results found for: f901feefe2dd5ab8145211305d94a7e3e5389774     ____________________
No results found for: [+] Malc0de Date:
No results found for: [+] Malc0de IP:
No results found for: [+] Malc0de Country:
No results found for: [+] Malc0de ASN:
No results found for: [+] Malc0de ASN Name:
No results found for: [+] Malc0de MD5:
[+] MD5 found on VT: 1
[+] Scan date submitted: 2014-02-17 17:39:49
[+] # of virus engines detected on: 19
[+] # of total scan engines: 50
[+] Malware detected on: ('CAT-QuickHeal', 'HackTool.Gendows (Not a Virus)')
[+] Malware detected on: ('McAfee', 'Artemis!3976BD5FCBB7')
[+] Malware detected on: ('Malwarebytes', 'Hacktool.Agent')
[+] Malware detected on: ('K7GW', 'Hacktool ( 00431b0a1 )')
[+] Malware detected on: ('K7AntiVirus', 'Hacktool ( 00431b0a1 )')
[+] Malware detected on: ('TrendMicro-HouseCall', 'CRCK_ACTIVATOR')
[+] Malware detected on: ('Avast', 'Win32:PUP-gen [PUP]')
[+] Malware detected on: ('Agnitum', 'HackTool.WinActivator!')
[+] Malware detected on: ('Sophos', 'W32/AutoRun-BSY')
[+] Malware detected on: ('VIPRE', 'Trojan.Win32.Generic!BT')
[+] Malware detected on: ('TrendMicro', 'CRCK_ACTIVATOR')
[+] Malware detected on: ('McAfee-GW-Edition', 'Artemis!3976BD5FCBB7')
[+] Malware detected on: ('Antiy-AVL', 'Worm/Win32.AutoRun')
[+] Malware detected on: ('Microsoft', 'HackTool:Win32/Gendows')
[+] Malware detected on: ('ESET-NOD32', 'Win32/HackTool.WinActivator.I')
[+] Malware detected on: ('Ikarus', 'HackTool.Win32.Gendows')
[+] Malware detected on: ('Fortinet', 'W32/AutoRun.BSY')
[+] Malware detected on: ('AVG', 'Generic9_c.AWIH')
No results found for: [+] Hash found at ThreatExpert:
No results found for: [+] Malicious Indicators from ThreatExpert:
No results found for: [+] Date found at VXVault:
No results found for: [+] URL found at VXVault:
```



