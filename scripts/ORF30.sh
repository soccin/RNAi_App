#!/bin/bash

SDIR="$( cd "$( dirname "$0" )" && pwd )"
BDIR=$SDIR/../bin
FILE=$1

cat $FILE \
    | $BDIR/fastx_trimmer -f 1 -l 30 -Q 33 \
    | $BDIR/fastq_quality_converter -Q 33 -n \
    | $BDIR/fastx_collapser \
    | $BDIR/fastx_reverse_complement \
    | $BDIR/fasta_formatter -t \
    | tr '-' '\t'  \
    | cut -f 3,2