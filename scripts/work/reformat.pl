s|cat ../fastq/.FILE.fastq |\nSDIR=\"\$( cd \"\$( dirname \"\$0\" )" && pwd )"\nBDIR=\$SDIR/../bin\nFILE=\$1\n\ncat \$FILE \\\n|;
s/\| \./|./;
s/\|/    |/;
s|./fas|\$BDIR/fas|;
s| >.*|\n|;
