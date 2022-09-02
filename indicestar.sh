#!/bin/bash
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno21/tfm/samples/trimmed
#SBATCH -J indice_Star
#SBATCH --cpus-per-task 6
#SBATCH --mail-type=none
#SBATCH --mail-user=belen.r.g@um.es


STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /home/alumno21/tfm/samples/trimmed/ \
--genomeFastaFiles /home/alumno21/tfm/samples/trimmed/genome.fna \
--sjdbGTFfile /home/alumno21/tfm/samples/trimmed/genome.gtf \
--sjdbOverhang 99