#!/bin/bash
#Remove the previous day's HTML files.
rm ~/GroupNotes/**AWSR*
#Download the latest version of the Group Notes from Google Docs in HTML format. The long string is the document id. 
#The "format" flag is how we're downloading it in html instead of docx. 
#The images in the document are linked to Google's CDN, so we don't have to worry about snagging them. It happens automatically.
#gdown is not native to Ubuntu. See here for documentation: https://pypi.org/project/gdown/
gdown --format html 1AFKa6DA1g61Izm_Z9G2jOSPjlxMydTSr05jzgPFUax4
#Rename the downloaded file to something without spaces in it, just to make our lives easier.
mv ~/GroupNotes/**AWS* ~/GroupNotes/AWSReStartLectureNotes.html
#Add all of the files in the repository directory to the staging area to commit.
#Ubuntu already has git by default, but I had to get the GitHub CLI to set up the repo from the command line.
#GitHub CLI: https://cli.github.com/
#The script won't work with cron unless I specify the directory with the -C flag.
git -C ~/GroupNotes add **
#Commit the changes to the local repository. 
#-m adds a message explaining the commit.
#I could probably add more info here but GitHub already has what we need.
git -C ~/GroupNotes commit -m "Daily notes update via script"
#Push the changes to the project page on GitHub.
#"git push" is the command to push the commit online to Github.
#"origin" is a remote repository. 
#I set up the specific repository earlier on the command line, so git knows that I want it to go to the GroupNotes repo.
#joy:GroupNotes/ (master) $ git remote add origin https://github.com/JoyNunn/GroupNotes.git
#"master" is the branch I want to push it to. 
#I needed to use the "-u" flag on the first push to set the upstream tracking reference. 
#I'm honestly a little unclear on this point, but I think this allows my local branch to track changes in the remote branch.
#It also allows me to use certain commands like "pull" and "push" without arguments because git knows what I'm referring to by the tracker.
#I have a lot more to learn about this bit. The one thing I'm confident about: I don't need to use the -u flag anymore since I already did it. 
git -C ~/GroupNotes push origin master
#I've added this script to my cron jobs with the "crontab -e" command, so I don't have to remember to run it.
#It automatically updates the document at 4 PM everyday without any input from me. 
