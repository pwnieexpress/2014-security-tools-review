<!SLIDE>

# Use Version Control

<span class='friendly'>
![version control](../../images/aliens.gif)
</span>


<!SLIDE>
# Use *Public* Version Control

* Github is awesome
* Acts as public changelog
* Public repos can build excitement
* Requires zero maintenance to keep the project around

<!SLIDE>

# Readable Code == Maintainable Code

![readable code](./web_dev_with_assembly.png)

<!SLIDE>

# Code Quality

<span class="friendly">
![ios ssl](../../images/ios_ssl_code.png)
</span>

<small> *source: http://arstechnica.com/security/2014/02/extremely-critical-crypto-flaw-in-ios-may-also-affect-fully-patched-macs/* </small>

<!SLIDE cmdline>

# Comment Your Code

## Redundant comments

<div style='text-align: center;width:100%;'>
<pre style='color: black; background-color: white; text-align: left; display: inline-block; font-size: 1.87em;'>
# my function
def my_function(args)
  # do some stuff with the args
  do_some_stuff_with(args)
end
</pre>
</div>

## Useful comments

<div style='text-align: center;width:100%;'>
<pre style='color: black; background-color: white; text-align: left; display: inline-block; font-size: 1.87em;'>

def my_function(args)
  # Test that the magic argument is being
  # set properly before proceeding
  if args[:magic] == MAGIC_NUMBER 
    do_some_stuff_with(args) 
  else
    raise "Not enough Magic!"
  end
end
</pre>
</div>

<!SLIDE bullets incremental>

# Generate Documentation from Comments

* Use Java Doc or language specific equivalent
* Enforces good commenting discipline

<!SLIDE bullets incremental>

# Documentation

* Environment / Platform Reqs
* Dependencies
* Setup & Usage

<!SLIDE>

# Consumable Outputs

<span class='friendly'>
![output](../../images/ketchup.gif)
</span>

<!SLIDE>

# Package for the Community

<!SLIDE>

# Don't reinvent the wheel

* Open PRs to existing projects or fork the project 
* **Note: this only works if people make their code accessible to the community**

<!SLIDE>

# Hackers != Software Engineers 

<span class="friendly">
![hacker v engineer](../../images/coder_vs_hacker.png)
</span>

<small>image source: http://www.hanselman.com/</small>

<!SLIDE bullets>

# Hacker Coder Characteristics

* Fast and loose
* Minimum Viable Functionality
* Undocumented
* 'One-off'-y

<!SLIDE bullets>

# Software Engineer Characteristics

* Architectural Plan
* Standardized I/O
* Abstracted Functionality
* Slower Development Cycle

