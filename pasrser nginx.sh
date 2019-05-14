#!/bin/bash

# variables
LOGFILE="/root/access.log"
LOGFILE_GZ="/var/log/nginx/access.log.*"
RESPONSE_CODE="200"

# functions

return_top(){
head -1
}

filters_404(){
grep "404"
}

request_ips(){
awk '{print $1}'
}

wordcount(){
sort \
| uniq -c
}

sort_desc(){
sort -rn
}


## actions
get_request_ips(){
echo ""
echo " IP's:"
cat $LOGFILE \
| filters_404 \
| request_ips \
| return_top \
| sort_desc \

echo ""
}



# executing
get_request_ips

