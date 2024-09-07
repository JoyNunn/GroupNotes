#!/bin/bash
mv /mnt/c/AWSReStartLectureNotes.html ~/GroupNotes
mv /mnt/c/images/** ~/GroupNotes
git add **
git commit -m "Daily notes update via script"
