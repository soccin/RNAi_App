#!/bin/bash
for FILE in `ls ../fastq/ | sed 's/\.[^\.]*$//'`
do
cat ../fastq/$FILE.fastq | ./fastx_trimmer -f 1 -l 22 -Q 33 \
|./fastq_quality_converter -Q 33 -n \
|./fastx_collapser \
|./fastx_reverse_complement \
|./fasta_formatter -t \
|tr '-' '\t'  \
|cut -f 3,2 > ../Results/result-$FILE.txt
done

#re type "enter"



