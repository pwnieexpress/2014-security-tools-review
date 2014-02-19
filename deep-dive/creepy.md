
# Creepy

Creepy is a GTK Python application for attempting to geolocate a person based
on information available through Twitter and Flikr.

Status: Broken

## Installation

On Kali to run creepy on a headless devices such as a PwnAppliance you will
need to install two packages:

* creepy
* xvfb

Because of the restrictions configured in the SSH server you'll need to add the
following line to `/etc/ssh/sshd_config`:

```
X11Forwarding yes
```

Remember to restart the ssh server afterwards.

## Running

From a remote host you can run creepy by SSH'ing in with the `-X` flag (too
allow for X11 forwarding). And then executing the `creepy` command. A local
display will show up and be available for usage.

## Usage

Immediately I attempted to query a friend's twitter account. The application
reported 403 errors against the Twitter API. After closing and re-opening the
application to get the specific error for the write-up it would immediately
crash everytime I attempted to geolocate anything without any log messages.

## Summary

As interesting as the prospect of this tool is, since it's broken it doesn't
have any place in a tool set.

