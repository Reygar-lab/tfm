#!/bin/bash
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno21/tfm/samples/trimmed
#SBATCH -J hisat2
#SBATCH --cpus-per-task 6
#SBATCH --mail-type=none
#SBATCH --mail-user=belen.r.g@um.es


for file in $(ls *.gz)
do

    STAR --genomeDir /home/alumno21/tfm/samples/trimmed/ \
    --runThreadN 6 \
    --readFilesIn /home/alumno21/tfm/samples/trimmed/$file \
    --readFilesCommand zcat \
    --outFileNamePrefix /home/alumno21/tfm/star-alignment/$file.star.bam.sorted \
    --outSAMtype BAM SortedByCoordinate \
    --outSAMunmapped Within \
    --outSAMattributes Standard
    
done