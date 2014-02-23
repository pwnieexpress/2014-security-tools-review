<!SLIDE bullets incremental>

# gpp-decrypt

* Decrypts Server 2008 Group Policy Preferences files
* Only exists as a blog post (that we found anyway)
* Installable package on Kali
* THE tool for this task

<!SLIDE bullets>

# gpp-decrypt

* No visible license
* No (easy) way to submit improvements

<!SLIDE bullets>

# Ever heard of bit rot?

* When dependencies get updated and break their APIs
* Not just remote dependencies
* Operating systems, compilers, and core tools can all change
* There were quite a few in the tool list...

<!SLIDE bullets incremental>

# Creepy

* Attempts to geolocate a user based on social network content
* Twitter has changed it's API
* Flikr has changed it's API
* There is an active repo that has been updated...
* ... but Kali isn't using it for it's packages

<!SLIDE bullets>

# Creepy

* Disconnect between packager and developers
* Packaged version has rotted

<!SLIDE bullets incremental>

# Automater

* OSINT lookup tool for URLs, IPs or virus/malware signatures
* Kali package not up-to-date with current release
* Unresolved dependencies when installed from `apt-get` onto a kali system

<!SLIDE bullets>

# Automater

* Not quite packaged correctly (missing dependencies)
* Packaged version doesn't match released code

<!SLIDE bullets incremental>

# p0f

* Passive OS version identifier
* Version 3 was a complete re-write
* Flags change, output changed
* Output could be easier to consume

<!SLIDE>

# p0f

    .-[ 10.73.73.20/41245 -> 192.168.1.14/443 (syn) ]-
    |
    | client   = 10.73.73.20/41245
    | os       = Linux 2.6.x
    | dist     = 0
    | params   = none
    | raw_sig  = 4:64+0:0:1460:mss*4,6:mss,sok,ts,nop,ws:df,id+:0
    |
    `----

<!SLIDE bullets>

# p0f

* Contributed to bit rot (sometimes it's necessary)
* Output could be easier to consume for other tools

