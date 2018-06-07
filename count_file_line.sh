#!/usr/bin/env bash
file_name=$1
line_count=`cat ${file_name} | wc -l`
echo "${file_name} count: ${line_count}"
cmd="sed -i 1i\${line_count} ${file_name}"
eval ${cmd}