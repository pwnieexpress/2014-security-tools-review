
# xprobe2

The purpose of the tool is to perform fingerprinting of remote TCP/IP stacks
based on Ofir Arkin's ICMP fingerprinting research. This tool is a practical
implementation of the results.

Status: Working

## Installation

On Kali you will need to have the following package installed:

* xprobe

## Running

xprobe will need a target to perform it's OS fingerprinting on. In this example
we'll be making use of '192.168.59.217' as our target in the example below:

```
xprobe2 192.168.59.217
```

## Summary

xprobe2 does exactly what it was designed too do. This same functionality is
also available in nmap and given that both this and nmap are written by Fyodor
and nmap is more of the 'core tool' that nmap is using the same if not more up
to date fingerprinting databases.

If you don't want the weight of nmap and just need a solid OS guess against a
remote host, xprobe may be the tool you're looking for.

