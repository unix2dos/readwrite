#!/bin/zsh


#mv -f /Users/liuwei/Dropbox/Obsidian/library/400_Map/微信读书/* /Users/liuwei/workspace/readwrite/source/booking/01进行中/

dir='/Users/liuwei/workspace/readwrite/source/booking/01进行中/'
cd $dir
subfolder="old_dir"
if [ ! -d "$subfolder" ]; then
    mkdir "$subfolder"
fi

for file in *; do
	if [ -f "$file" ]; then
		if grep -q '^date' "$file"; then
			today=$(date +%Y-%m-%d)
			input_date=$(grep '^date' "$file")
			input_date=$(echo "$input_date" | awk '{print $2}')
			input_timestamp=$(date -jf "%Y-%m-%d" "$input_date" "+%s")
			today_timestamp=$(date -jf "%Y-%m-%d" "$today" "+%s")
			time_diff=$(( (today_timestamp - input_timestamp) / 86400 ))
			if [ "$time_diff" -gt 30 ]; then
		 		echo $time_diff "$file"
				mv "$file" "$subfolder/"
			fi
		 	#echo $time_diff "$file"
		fi
	fi
done

