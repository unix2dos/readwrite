#!/bin/sh

hexo clean --config source/_data/next.yml && hexo g --config source/_data/next.yml 
git add . && git commit -m "update public" 
git pull && git push