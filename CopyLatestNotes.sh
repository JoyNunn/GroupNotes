#!/bin/bash
#Remove the previous day's HTML files.
rm **AWSR*
#Download the latest version of the Group Notes from Google Docs in HTML format. The long string is the document id. 
#The "format" flag is how we're downloading it in html instead of docx. 
#The images in the document are linked to Google's CDN, so we don't have to worry about snagging them. It happens automatically.
gdown --format html 1AFKa6DA1g61Izm_Z9G2jOSPjlxMydTSr05jzgPFUax4
#Rename the downloaded file to something without spaces in it, just to make our lives easier.
mv **AWS* AWSReStartLectureNotes.html
#Add all of the files in the repository directory to the staging area to commit.
git add **
#Commit the changes to the local repository.
git commit -m "Daily notes update via script"
#Push the changes to the project page on GitHub.
git push -u origin master
#From here, this script gets added to my cron jobs with the "crontab -e" command. 
#It automatically updates the document at 5 PM everyday without any input from me. 
