#!/bin/bash
# Retrieve file names and print out

### get args
while getopts i:o: option
do
case "${option}"
in
i) i=${OPTARG};;
o) o=${OPTARG};;
esac
done

### check args
if [ "$i" == "" -o "$o" == "" ]
then
	echo "Input Error, please make sure"
	echo "-i as input file name"
	echo "-o as output file name"
	echo "Usage: sh printInputOutput.sh -i input.fas -o output.fas"
	exit
fi

echo "input file name: "$i
echo "output file name: "$o
