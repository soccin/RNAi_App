#!/bin/bash

#
# START:PREAMBLE
#

SDIR="$( cd "$( dirname "$0" )" && pwd )"
BDIR=$SDIR/bin

function usage {
    echo
    echo "usage: $(basename $0) METHOD [FASTQ_DIR]"
    echo "   METHOD - which processing script to use"
    for script in $SDIR/scripts/*; do
        echo "      "$(basename $script | sed 's/.sh//')
    done
    echo
}

if [ "$#" -lt 1 ]; then
    usage
    exit
fi

SCRIPT=$1
shift 1

if [ ! -e $SDIR/scripts/$SCRIPT.sh ]; then
    usage
    echo "[$SCRIPT] is not a valid choice"
    echo
    exit
fi

if [ "$#" == "1" ]; then
    FASTQ_DIR=$1
else
    FASTQ_DIR=$PWD
fi

NUMFILES=$(ls $FASTQ_DIR/*fastq | wc -l | awk '{print $1}')
if [ "$NUMFILES" == "0" ]; then
    usage
    echo "   Must specify directory with some FASTQ files"
    echo "   e.g. XXXX.fastq"
    echo
    exit
fi

#
# END:PREAMBLE
#

STAG=$(basename $0 | sed 's/.sh//')
mkdir -p Results

for FILE in $FASTQ_DIR/*fastq; do

    BASE=$(basename $FILE | sed 's/.fastq//')
    echo "Processing $FILE"
    $SDIR/scripts/$SCRIPT.sh $FILE >Results/result-${SCRIPT}-${BASE}.txt

done
