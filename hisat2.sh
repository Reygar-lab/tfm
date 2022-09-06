#!/bin/bash
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno21/tfm/samples/trimmed
#SBATCH -J hisat2
#SBATCH --cpus-per-task 6
#SBATCH --mail-type=none
#SBATCH --mail-user=belen.r.g@um.es

for file in $(ls *.gz)
do
        echo "[Hisat mapping running for sample] $file"
        hisat2 -p 8 -x /home/alumno21/tfm/samples/trimmed/genome -U $file | samtools view -Sb | samtools sort -m 2G -o /home/alumno21/tfm/hisat-alignment/$file.bam.sorted
done
