#!/usr/bin/bash

# Stimulate repo

BRANCH=dwq-$(uuidgen -r | cut -d '-' -f 1)
echo $BRANCH

REPO=/home/nmarsell/workspace/cvp-community-operators
cd $REPO

operators=(`ls | xargs`)

OPERATOR=${operators[$RANDOM % ${#operators[@]} ]}

git checkout master
git pull origin master
git checkout -b $BRANCH

echo $(date -uIs) > ${OPERATOR}/TEST.txt

git add .
git commit -m "Update test file"
git push origin $BRANCH
