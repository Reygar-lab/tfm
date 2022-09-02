#!/bin/bash
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno21/tfm/samples/trimmed
#SBATCH -J hisat2
#SBATCH --cpus-per-task 6
#SBATCH --mail-type=none
#SBATCH --mail-user=belen.r.g@um.es

for file in $(ls *.gz)
do
        Samtools index $sample
done
