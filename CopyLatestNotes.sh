#!/bin/bash
#Remove the previous day's HTML files.
rm **AWSR*
#Download the latest version of the Group Notes from Google Docs in HTML format. The long string is the document id. 
#The "format" flag is how we're downloading it in html instead of docx. 
#The images in the document are linked to Google's CDN, so we don't have to worry about snagging them. It happens automatically.
#gdown is not native to Ubuntu. See here for documentation: https://pypi.org/project/gdown/
gdown --format html 1AFKa6DA1g61Izm_Z9G2jOSPjlxMydTSr05jzgPFUax4
#Rename the downloaded file to something without spaces in it, just to make our lives easier.
mv **AWS* AWSReStartLectureNotes.html
#Add all of the files in the repository directory to the staging area to commit.
#Ubuntu already has git by default, but I had to get the GitHub CLI to set up the repo from the command line.
#GitHub CLI: https://cli.github.com/
git add **
#Commit the changes to the local repository. I could probably add more info here but GitHub already has what we need.
git commit -m "Daily notes update via script"
#Push the changes to the project page on GitHub.
#"git push" is the command to push the commit online to Github.
#"origin" is a remote repository. 
#I set up the specific repository earlier on the command line, so git knows that I want it to go to the GroupNotes repo.#"master" is the branch I want to push it to. In this case, we're pushing to master. 
git push origin master
#From here, this script gets added to my cron jobs with the "crontab -e" command. 
#It automatically updates the document at 5 PM everyday without any input from me. 
