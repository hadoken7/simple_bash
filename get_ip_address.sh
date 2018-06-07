#!/usr/bin/env bash
directory="/deploy"
target_directory="/target"
svn update $directory
var=`ifconfig|sed -n '/inet addr/s/^[^:]*:\([0-9.]\{7,15\}\) .*/\1/p'`
for ip in $var
do
	for file in `ls $directory`
	do
		host_pre="hosts-"
		curfile=$host_pre$ip
		if [ $file = $curfile ]
		then
		echo $file
		sudo scp $directory/$file $target_directory
		fi
	done
done
echo "copy hosts file done"
