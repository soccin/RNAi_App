#!/bin/bash

SDIR="$( cd "$( dirname "$0" )" && pwd )"
BDIR=$SDIR/../bin
FILE=$1

cat $FILE \
    |$BDIR/fastx_reverse_complement -Q 33 \
    |$BDIR/fastx_clipper -a GGTGTTTCGTCCTTT -Q 33 \
    |$BDIR/fastx_reverse_complement -Q 33 \
    |$BDIR/fastx_trimmer -f 2 -l 21 -Q 33 \
    |$BDIR/fastq_quality_converter -Q 33 -n \
    |$BDIR/fastq_quality_filter -Q 33 -p 1 -q 20 \
    |$BDIR/fastx_collapser \
    |$BDIR/fasta_formatter -t \
    |tr '-' '\t'  \
    |cut -f 3,2
