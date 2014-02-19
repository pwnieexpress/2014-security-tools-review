# p0f

P0f is a tool that utilizes an array of sophisticated, purely passive traffic
fingerprinting mechanisms to identify the players behind any incidental TCP/IP
communications (often as little as a single normal SYN) without interfering in
any way.

*Version 3 is a complete rewrite of the original codebase*, incorporating a
significant number of improvements to network-level fingerprinting, and
introducing the ability to reason about application-level payloads (e.g.,
HTTP).

Status: Working

## Installation

    apt-get install p0f

## Running

    p0f -i eth0


## Output

    --- p0f 3.06b by Michal Zalewski <lcamtuf@coredump.cx> ---

    [+] Closed 1 file descriptor.
    [+] Loaded 314 signatures from 'p0f.fp'.
    [+] Intercepting traffic on interface 'eth0'.
    [+] Default packet filtering configured [+VLAN].
    [+] Entered main event loop.

    .-[ 10.73.73.20/41245 -> 192.168.1.14/443 (syn) ]-
    |
    | client   = 10.73.73.20/41245
    | os       = Linux 2.6.x
    | dist     = 0
    | params   = none
    | raw_sig  = 4:64+0:0:1460:mss*4,6:mss,sok,ts,nop,ws:df,id+:0
    |
    `----

    .-[ 10.73.73.20/41245 -> 192.168.1.14/443 (mtu) ]-
    |
    | client   = 10.73.73.20/41245
    | link     = Ethernet or modem
    | raw_mtu  = 1500
    |
    `----

## Log file format

    [2014/02/17 16:41:27] mod=syn|cli=10.73.73.20/55321|srv=192.168.1.14/443|subj=cli|os=Linux 2.6.x|dist=0|params=none|raw_sig=4:64+0:0:1460:mss*4,6:mss,sok,ts,nop,ws:df,id+:0
    [2014/02/17 16:41:27] mod=mtu|cli=10.73.73.20/55321|srv=192.168.1.14/443|subj=cli|link=Ethernet or modem|raw_mtu=1500

## Summary

`p0f` is a useful tool that works as expected. However, we had some issues with
the tool in production due to v3 being a complete rewrite. In particular, p0fv3
broke compatibility with v2 command line flags and log output. This in and of
itself is not a huge deal. The issue is that v3 _replaces_ the Kali package
completely, making it quite difficult to obtain v2, and it does so silently---
apt-get upgrade will pull the completely rewritten version.

### Recommendation

A complete tool rewrite like p0fv3 should use, at the very least, a different
package name to preserve backwards compatibility. Ideally, the tool itself
would have a different name (`p0f3`, for example). Of course, this would be
less of an issue if p0fv3 did not also break compatibility with most of its
command line flags. As developers, we understand the need to occasionally break
from an existing codebase and deprecate features. However, as a tool maintainer
or package maintainer, you have the ability to make people's lives easier by
breaking things in a controlled and visible manner.
