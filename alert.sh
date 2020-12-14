#!/bin/bash
dt=$(date '+%m/%d/%Y %H:%M:%S');
/usr/local/cpanel/3rdparty/bin/clamdscan /home/USERNAME/* > ~/viruslog.txt
echo "$dt" >> out.txt
curl --silent -u """YOURAPIKEY"":" -d type="link" \
-d body="Virus Found" \
-d url="home/USERNAME/viruslog.txt"  #
-d title="Virus Found!" \
'https://api.pushbullet.com/v2/pushes'
#you must have CPanel with Clamav and Imunify installed. 
#this is just something I made for fun when I was bored. 
