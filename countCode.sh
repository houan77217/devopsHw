#!/bin/bash

code=404
filename=`basename $0`
usage() {
    echo "Usage: ./${filename} your.log [return code]"
}

(( $# < 1 )) && usage && exit
[[ "$2" != "" ]] && code=$2

grepList=(`cat $1 | awk '{print $1":"$9}' | grep ":${code}" | awk -F ':' '{print $1}' | sort`)

(IFS=$'\n'; sort <<< "${grepList[*]}") | uniq -c