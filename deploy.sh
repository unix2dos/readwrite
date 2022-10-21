#!/bin/sh


###### 日记 ########
target_file="./source/index.md"
rm -rf $target_file
search_dir="./source/_posts/think/随笔"
for entry in "$search_dir"/*
do
	value="$(cat $entry)"
	echo "$value" >> $target_file
done




#######  博客 ######
hexo clean --config source/_data/next.yml && hexo g --config source/_data/next.yml && hexo g -d --config source/_data/next.yml 
git add . && git commit -m "update public" 
git pull && git push
