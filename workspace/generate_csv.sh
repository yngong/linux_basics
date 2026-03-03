#!/bin/bash
# This script takes fasta data to generate CSV file.

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
	echo "Usage: sh generateCSV.sh -i input.fas -o output.fas"
	exit
fi

echo "input file name: "$i
echo "output file name: "$o

# step 1. retrieve meta data
grep ">" $i > temp.out
# step 2. create CSV file
echo "virus,location,strain,year,accession_number,collection_date,area" > $o
# step 3. stream editor
sed 's/>//g' temp.out | sed 's/\// | /g' | sed 's/ | /,/g' >> $o
rm temp.out
