#!/bin/bash
for FILE in `ls ../fastq/ | sed 's/\.[^\.]*$//'`
do
cat ../fastq/$FILE.fastq | ./fastx_trimmer -f 47 -l 66 -Q 33 \
|./fastq_quality_converter -Q 33 -n \
|./fastq_quality_filter -Q 33 -p 1 -q 20 \
|./fastx_collapser \
|./fasta_formatter -t \
|tr '-' '\t'  \
|cut -f 3,2 > ../Results/result-$FILE.txt
done

#re type "enter"



