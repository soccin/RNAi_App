#!/bin/bash
SCRIPT=$1
cat $SCRIPT | egrep -v "^(for|do|done|^$|^#re)" | perl -p reformat.pl
