#!/bin/bash

text_file=$1
up_count=0
down_count=0

while read ip;
do
    echo "Pinging $ip"
    if ping -c 1 -t 2 "$ip" > /dev/null 2>&1
    then
        echo "$ip is reachable"
        up_count=$((up_count + 1))
    else
        echo "$ip is not reachable"
        down_count=$((down_count + 1))
    fi
done < "$text_file"

echo "Total reachable servers: $up_count"
echo "Total unreachable servers: $down_count"

