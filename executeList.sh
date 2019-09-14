#!/bin/bash
set -e
set -u

while true
	do
	filename="list.txt"
	while IFS= read -r line
	do
	 	/bin/bash -c "./webFileUpdate2Webhook.sh $line"
	done < "$filename"
	sleep "$INTERVAL"s
done
