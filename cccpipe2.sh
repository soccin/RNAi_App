#!/bin/bash

#
# START:PREAMBLE
#

SDIR="$( cd "$( dirname "$0" )" && pwd )"
BDIR=$SDIR/bin

function usage {
    echo
    echo "usage: $(basename $0) [FASTQ_DIR]"
    echo "   Must specify directory with some FASTQ files"
    echo "   e.g. XXXX.fastq"
    echo
    exit
}

if [ "$#" == "1" ]; then
    FASTQ_DIR=$1
else
    FASTQ_DIR=$PWD
fi

NUMFILES=$(ls $FASTQ_DIR/*fastq | wc -l | awk '{print $1}')
if [ "$NUMFILES" == "0" ]; then
    usage
    exit
fi

#
# END:PREAMBLE
#

mkdir -p Results

for FILE in $FASTQ_DIR/*fastq; do
    BASE=$(basename $FILE | sed 's/.fastq//')

    cat $FILE \
    | $BDIR/fastx_trimmer -f 1 -l 22 -Q 33 \
    | $BDIR/fastq_quality_converter -Q 33 -n \
    | $BDIR/fastx_collapser \
    | $BDIR/fastx_reverse_complement \
    | $BDIR/fasta_formatter -t \
    | tr '-' '\t'  \
    | cut -f 3,2 >Results/result-${BASE}.txt

done

