#!/bin/bash
set -e
set -u

while true
	do
	filename="list.txt"
	while IFS= read -r line
	do
		if [ -n "$line" ]
		then
			/bin/bash -c "./webFileUpdate2Webhook.sh $line"
		fi
	done < "$filename"
	sleep "$INTERVAL"s
done
