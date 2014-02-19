
# WifiHoney

## Installation

On Kali you will need to have the following package installed:

* wifi-honey

Status: Working

## Running

You're going to need an inactive wireless interface (not currently behaving as
a client, access point, or using any tool that puts a lock on the interface) to
run this tool.

In the following example we'll spoof the SSID 'linksys' on channel 1 and using
wlan0 as our wireless device.

```
wifi-honey 'linksys' 1 wlan0
```

It's worth nothing that due too a bug in the script you can't spoof SSIDs with
a space in the name. This was fairly easy to fix by editing
`/usr/share/wifi-honey/wifi_honey_template.rc` and wrapping the "<ESSID>"
parameter with quotation marks.

## Summary

This is a very simple tool; It's nothing more than a bash script wrapping a
screen session that will trigger a few different tools simultaneously. It
doesn't clean up after itself at all, leaving five monitor interfaces behind
and the temporary configuration file it generates, all of which the user needs
to remove on their own.

It's also worth noting that you will end up with a series of airodump capture
in whatever directory you start the tool in.

I do consider this project a bit mis-named as honeypots tend to be defensive
detectors against malicious traffic while this script is itself a form of
malicious enumeration.

In practice I've found this tends to only be effective when the real access
point isn't around. Spoofing a probe request that you see, that doesn't line up
with an existing access point will allow you to enumerate a bit about that
access point's encryption and under certain circumstances give you a key
exchange that you might be get lucky in breaking.

I've found the security used by an access point is usually enumerable through
Wifi databases like wigle.net a lot faster than attempting to get a client to
connect to you, which can also give you the real BSSID of the target access
point and allow you to more effectively attempt to grab the client on your own
with airbase-ng directly.

If a client connects to the open version of whatever access point you're
broadcasting it will not be able to get an internet connection. This is both a
good and bad thing as you probably don't want to unknowingly route traffic, but
could also frustrate users by killing their network connections (Android and
iDevices will stop using their cellular data as soon as they connect to a
wireless network even if there isn't a usable route to the internet) and
prevent you from getting access to data that could be intercepted.

While kind of a fun tool to play with I'd stick with setting up my own
malicious access points directly with airbase-ng.

