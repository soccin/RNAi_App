# RNAi Application: RNAiApp.sh

Application to process FASTQ using one of the various RNAi/shRNA/siRNA processing scripts from Qi Chao. See the install doc for installation instructions. If the program has been properly installed then you should be able to run the script from any folder/directory by typing 

```
RNAiApp.sh
```

and if all is working you should see the following _usage_ message:


```bash
$ RNAiApp.sh 

usage: RNAiApp.sh SCRIPT_NAME [FASTQ_DIR]
   SCRIPT_NAME - which processing script to use
      2645
      cccpipe2

```

The program takes one __required__ option/argument which is the name of the script you want to use. If you run the script without any options then it will list all of the available scripts. Currently the following scripts are ready:

* 2645
* cccpipe2

Once you can specify the script name you can either process _all_ FASTQ files in the current directory or you can specify the directory which has the FASTQ files you want to process. For testing there are some sample FASTQ files in the following folder on your desktop:

```
~/Desktop/RNAiAppTest
```

To test that the program has been properly installed type the following commands:

```bash
cd ~/Desktop/RNAiAppTest

RNAiApp.sh cccpipe2 TestData
```

The program should print that it is processing 2 FASTQ files and then there will be a directory called `Results` with the followings files:


```bash
$ ls
Results  TestData
$ ls Results
result-cccpipe2-Sample_DGG6_24_TINY_R1.txt
result-cccpipe2-Transomics_CancerMet_Pool2.txt
```

Again the usage is:

```bash
RNAiApp.sh SCRIPT_NAME FASTQ_DIRECTORY
```

to process all FASTQ files in the folder `FASTQ_DIRECTORY`

or

```bash
RNAiApp.sh SCRIPT_NAME
```

to process all FASTQ files in the _current_ directory.

