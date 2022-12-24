#! /bin/bash

echo
file=`echo $1`

dir=`dirname ${file}`
file=`basename ${file}`
outfile=`echo "${file}" | sed 's/.txt//g'`

# split file
grep -B1 -A1 'Ref' ${dir}/${file} > ${dir}/${outfile}_star.txt
sed '1,3d' ${dir}/${file} > ${dir}/${outfile}_line.txt

grep "*" ${dir}/${file} > ${dir}/${outfile}_astar.txt

while read line
do
	echo "${line}" >> ${dir}/${outfile}_star.txt
	cat ${dir}/${outfile}_astar.txt >> ${dir}/${outfile}_star.txt
done < ${dir}/${outfile}_line.txt

rm -rf ${dir}/${outfile}_line.txt
rm -rf ${dir}/${outfile}_astar.txt
