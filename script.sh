#!/bin/bash

cd macro-commit-repository
git init -q

RANDOM=`date "+%N"`
min_val=1
max_val=8
mod_val=`echo "$max_val - $min_val + 1" | bc`
random_val=`echo "($RANDOM % $mod_val) + $min_val" | bc`
echo $random_val

git config user.name $USERNAME
git config user.email $USERMAIL

for ((i=0;i<$random_val;i++))
do
  echo $(TZ=":Asia/Seoul" date '+%Y--%m--%d_%H:%M:%S') >> commit.txt
  git add .
  git commit -m $(TZ=":Asia/Seoul" date '+%Y--%m--%d_%H:%M:%S')
  git push -u origin master
done
