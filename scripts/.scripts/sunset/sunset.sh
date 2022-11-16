#!/bin/bash
# Return sunrise and sunset time of given location (uses weather.com)

# Locations
#location="0aec5ff90c0f22441d0df14b9ea5d18d663fdb193f2e8bb0e7f7b1c92dc9eb31"  # Strasbourg
#location="c8b1a36a60692973c81b564c0df0bafaf4e0a710070d5214ffd6f25e9981d550"  # Lyon
location="d83dc79f435437ad00ca766a81c7fbf3b46a39aa71e0fda19e144ce58c824401"  # Aachen
tmpfile=/tmp/$location-$(date +%Y%m%d).out

# Obtain sunrise and sunset raw data from weather.com
if [[ ! -s $tmpfile ]]; then
	wget -q "https://weather.com/weather/today/l/$location" -O $tmpfile
fi


if test "$1" = sunrise; then
	SUN=$(grep SunriseSunset "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | head -1)
else  # sunset by default
	SUN=$(grep SunriseSunset "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | tail -1)
fi

if test "$2" = minutes; then
	echo $(date --date="$SUN" +%M)
else  # hours by default
	echo $(date --date="$SUN" +%H)
fi
