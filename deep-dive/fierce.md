# Fierce

Fierce is a DNS enumerator written in Perl. After specifying a target
nameserver, fierce will attempt to resolve DNS records for common server names
(e.g. 'accounting', 'dev', 'backup', 'ftp') to enumerate non-contiguous IP
blocks within a network. After finding an IP address, it will then scan
addresses within a certain distance of that address using reverse lookups.

Status: Rad.

## Installation

    apt-get install fierce

## Running

    fierce -dns example.net

## Output 
(Real scan with IP/hostname changed)

    DNS Servers for example.net:
      ns1.example.net
      ns2.example.net

    Trying zone transfer first...
      Testing ns1.example.net
        Request timed out or transfer not allowed.
      Testing ns2.example.net
        Request timed out or transfer not allowed.

    Unsuccessful in zone transfer (it was worth a shot)
    Okay, trying the good old fashioned way... brute force

    Checking for wildcard DNS...
    Nope. Good.
    Now performing 2280 test(s)...
    xxx.198.119.75  accounting.example.net
    xxx.198.119.78  backup.example.net
    yyy.47.224.142  dev.example.net
    yyy.47.224.142  extranet.example.net
    xxx.198.119.83  fm.example.net
    yyy.47.224.142  ftp.example.net
    xxx.198.119.82  ftp2.example.net
    yyy.47.224.142  gallery.example.net
    xxx.198.119.66  gw.example.net
    xxx.198.119.66  gw1.example.net
    qqq.196.25.67   hermes.example.net
    xxx.198.119.75  hr.example.net
    zzz.32.121.91   jobs.example.net
    yyy.47.224.142  ks.example.net
    yyy.47.224.142  live.example.net
    xxx.198.119.67  mail.example.net
    xxx.198.119.75  portfolio.example.net
    xxx.198.119.83  sm.example.net
    xxx.198.119.67  smtp.example.net
    yyy.47.224.142  staging.example.net
    yyy.47.224.142  video.example.net
    yyy.47.224.142  web.example.net
    yyy.47.224.142  www.example.net
    yyy.47.224.142  www3.example.net

    Subnets found (may want to probe here using nmap or unicornscan):
      xxx.198.119.0-255 : 11 hostnames found.
      qqq.196.25.0-255 : 1 hostnames found.
      zzz.32.121.0-255 : 1 hostnames found.
      yyy.47.224.0-255 : 11 hostnames found.

    Done with Fierce scan: http://ha.ckers.org/fierce/
    Found 24 entries.

    Have a nice day.

## Code quality

- Last updated in 2007
- Readable, literate Perl
- Does what it says, and well
- Website exists and is maintained, even if the tool is not under active dev

## Summary

Awesome.
