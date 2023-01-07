#! /bin/bash


PLINPUT=/home/jc2545/scratch60/hj/thyroiditis/thyroiditis_noncoding/enhancer_promoter/v8/20230106_plotread/20230106_plotread_list.txt
DIRECT=/home/jc2545/scratch60/hj/thyroiditis
PLVER=`dirname ${PLINPUT}`

mkdir ${PLVER}/pngfile
mkdir ${PLVER}/txtfile

awk '{print "source ~/.bashrc; unset PYTHONPATH; cd '"${PLVER}"'/pngfile; module load Python/2.7.18-GCCcore-10.2.0; python2 /ycga-gpfs/scratch60/lifton/jc2545/scripts/plotReads.py -i "$4"_"$2"_"$3"_"$1" "$2":"$3" '"${DIRECT}"'/"$1"/"$1".cram"}' ${PLINPUT} > ${PLVER}/plotread_dom_png.sh

awk '{print "source ~/.bashrc; unset PYTHONPATH; cd '"${PLVER}"'/txtfile; module load Python/2.7.18-GCCcore-10.2.0; python2 /ycga-gpfs/scratch60/lifton/jc2545/scripts/plotReads.py -t "$2":"$3" '"${DIRECT}"'/"$1"/"$1".cram > "$4"_"$2"_"$3"_"$1".txt"}' < ${PLINPUT} > ${PLVER}/plotread_dom_txt.sh


