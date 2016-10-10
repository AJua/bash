#!/bin/bash

# slightly malformed input data
input_start=2007-7-14
input_end=2016-9-1

startdate=$(date -I -d "$input_start") || exit -1
enddate=$(date -I -d "$input_end")     || exit -1

d="$startdate"
while [ "$d" != "$enddate" ]; do 
    month=$(date -d "$d" +%Y/%m)
    sudo mkdir -vp /debian/"$month"
    day=$(date -d "$d" +%Y/%m/%d)
    curl http://irclogs.thegrebs.com/debian/"$day" > ~/tmp && sudo mv ~/tmp /debian/"$day"
    d=$(date -I -d "$d + 1 day")
    sleep 15
done
