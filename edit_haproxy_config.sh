#!/bin/bash

filename=/opt/serverlist.txt
declare -a myArray
myArray=(`cat "$filename"`)

x=`cat /opt/reverlist.txt | wc -l`
echo $x


for (( i = 0 ; i < $x ; i++))
do
  echo "Element [$i]: ${myArray[$i]}"
  echo server redis_$i ${myArray[$i]}:80 check inter 1s >> /etc/haproxy/haproxy.cfg

done
