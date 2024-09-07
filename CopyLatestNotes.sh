#!/bin/bash
rm **AWSR*
gdown --format html 1AFKa6DA1g61Izm_Z9G2jOSPjlxMydTSr05jzgPFUax4
mv **AWS* AWSReStartLectureNotes.html
rm '**AWS Re_*'
git add **
git commit -m "Daily notes update via script"
git push -u origin master
