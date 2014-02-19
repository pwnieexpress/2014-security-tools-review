
# DHCPig

DHCPig initiates an advanced DHCP exhaustion attack. It will consume all IPs on
the LAN, stop new users from obtaining IPs, release any IPs in use, then for
good measure send gratuitous ARP and knock all windows hosts offline.

Status: Working

## Installation

On Kali you will need to have the following package installed:

* dhcpig

## Running

You'll need to have selected an interface to perform the DHCP exhaustion attack
against. For the sake of my demo this will be 'eth0'. Run DHCPig as root with
the following command:

```
pig.py eth0
```

During my first attempt at running it I had the pleasure of receiving the
following error message:

```
lstat(./dvips) failed ...
./dvips: No such file or directory
python: ../../../texk/kpathsea/progname.c:316: remove_dots: Assertion `ret' failed.
Aborted
```

After a bit of Googling I found that removing the 'python-pyx' package (which
in turn removed wifitap) allowed the program to run. Ultimately it seems like
this is an issue with python-scapy, any other packages that make use of this
may experience the same issue.

## Summary

This tool did exactly what it set out to do. After about a five minute wait all
DHCPv4 addresses were exhausted. The only issue found with it wasn't an issue
with the package but rather a bug in one of it's dependencies.

It's hard to place the role of this tool in an active penetration test as it's
quite noisy and effectively doesn't do much more than preventing dynamic access
to a network.

A resource exhaustion attack of this kind isn't a particularily large security
risk on it's own. Where it could be valuable is buying yourself some time by
diverting network and security team's attention to this mundane issue effecting
normal users from a real security threat that you may be performing alongside
this.

This diversion is probably only useful if you've already been detected in some
form or another or if you're about to do something particuarily aggressive.

