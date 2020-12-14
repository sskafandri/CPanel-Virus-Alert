#!/bin/bash
dt=$(date '+%m/%d/%Y %H:%M:%S');
/usr/local/cpanel/3rdparty/bin/clamdscan /home/USERNAME/* > ~/viruslog.txt
echo "$dt" >> viruslog.txt #Adds the current date and time stamp to the viruslog.txt file
curl --silent -u """YOURAPIKEY"":" -d type="link" \
-d body="A Virus has been found" \
-d url="home/USERNAME/viruslog.txt"  #
-d title="[SERVER_NAME] Virus Found!" \
'https://api.pushbullet.com/v2/pushes'
#you must have CPanel with Clamav and Imunify installed. 
#this is just something I made for fun when I was bored. 
