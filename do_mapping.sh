#!/bin/bash
#$ -cwd

samplelist=$1
setting=$2

nthread=4

. $setting

echo $setting

for f in `cat $samplelist`
do 
echo $f
sampleName=$f  
readGroup=$f

r1=$f".R1.fastq.gz"
r2=$f".R2.fastq.gz"


cmd="qsub -N map.$f   -pe smp $nthread  -l mem=3G,time=48:: -o logs/map.$f.o -e logs/map.$f.e mapping-bwa_mem.sh -i $r1 -p $r2 -s $setting  -y $readGroup -z $readGroup -n $sampleName  -t $nthread  -f Illumina"

echo $cmd

$cmd



done

