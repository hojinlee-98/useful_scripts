#! /bin/bash


fptable_old=/Volumes/hjdrive/thyroiditis/thyroiditis_noncoding/enhancer_promoter/v8/results/20230106/geneunit/20221221_fptable.txt
fptable_new=/Volumes/hjdrive/thyroiditis/thyroiditis_noncoding/enhancer_promoter/v8/results/20230106/geneunit/20230106_fptable.txt

fptable_dir=/Volumes/hjdrive/thyroiditis/thyroiditis_noncoding/enhancer_promoter/v8/results/20230106/geneunit
plotread_list=/Volumes/hjdrive/thyroiditis/thyroiditis_noncoding/enhancer_promoter/v8/results/20230106/geneunit/20230106_plotread/20230106_plotread_list.txt

rm ${fptable_new}.temp

cat ${fptable_dir}/*plotreads_fptable.txt | sort | uniq > ${fptable_new}.temp

while read col1 col2 col3 col4; do cat ${fptable_new}.temp | awk -F '\t' '{if (($1 == "'${col1}'") && ($2 == "'${col2}'") && ($3 == "'${col3}'")) print $0}' >> ${fptable_new}_temp2  ; done < ${plotread_list}

# remove temp file
rm ${fptable_new}.temp

cat ${fptable_old} ${fptable_new}_temp2 > ${fptable_new}

# remove temp file
rm ${fptable_new}_temp2
