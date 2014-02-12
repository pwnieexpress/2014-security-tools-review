# Interesting Stats

## Time

*Avg start year:* 2007
*Avg last updated year:* 2011

### Number of projects last updated per year

```
 1 1998
 1 2000
 1 2001
 4 2002
 4 2004
 5 2005
 7 2006
 7 2007
15 2008
 9 2009
13 2010
23 2011
34 2012
83 2013
39 2014
```

```ruby
{ 1998 => 1, 2000 => 1, 2001 => 1, 2002 => 4, 2004 => 4, 2005 => 5, 2006 => 7, 2007 => 7, 2008 => 15, 2009 => 9, 2010 => 13, 2011 => 23, 2012 => 34, 2013 => 83, 2014 => 39}
```

### Number of projects started per year

I think that I could do a better job with some of these numbers and I want to
go back and fill in some blanks.


```
 3 1996
 1 1997
 2 1998
 1 1999
 5 2000
 7 2001
 3 2002
 2 2003
 6 2004
 6 2005
 9 2006
10 2007
13 2008
17 2009
15 2010
20 2011
17 2012
 7 2013
```

```ruby
{ 1996 => 3, 1997 => 1, 1998 => 2, 1999 => 1, 2000 => 5, 2001 => 7, 2002 => 3, 2003 => 2, 2004 => 6, 2005 => 6, 2006 => 9, 2007 => 10, 2008 => 13, 2009 => 17, 2010 => 15, 2011 => 20, 2012 => 17, 2013 => 7 }
```

## Helpers

### Year / Count hash to Avg Year

This is bad and I feel bad. 

```ruby
(year.map {|yr,ct| yr * ct }.inject(&:+))/(year.map{|_,c|c}.inject(&:+))
```
