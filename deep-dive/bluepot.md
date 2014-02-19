
# Bluepot

Bluepot was an attempt to implement a fully functional Bluetooth Honeypot. A
piece of software designed to accept and store any malware sent to it and
interact with common Bluetooth attacks such as BlueBugging and BlueSnarfing.

## Installation

On Kali to run bluepot on a headless devices such as a PwnAppliance you will
need to install two packages:

* bluepot
* xvfb

Because of the restrictions configured in the SSH server you'll need to add the
following line to `/etc/ssh/sshd_config`:

```
X11Forwarding yes
```

Remember to restart the ssh server afterwards.

## Running

This tool doesn't behave well through X forwarded connections.

