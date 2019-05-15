#!/bin/bash

LOGFILE="/home/kotov/access.log"
ERROR_CODE=$1

code_error(){
grep $ERROR_CODE
}

ip(){
awk '{print $1}'
}

count(){
sort \
| uniq
}

sort(){
sort -rn
}

top(){
head -1
}

print_ip(){
echo -n "Most common IP:"

cat $LOGFILE \
| code_error \
| ip \
| count \
| sort \
| top
}

print_ip

