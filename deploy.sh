#!/bin/sh

#######  博客 ######
git pull
hexo clean --config source/_data/next.yml && hexo g --config source/_data/next.yml && hexo g -d --config source/_data/next.yml 
git add . && git commit -m "update public" 
git pull && git push
