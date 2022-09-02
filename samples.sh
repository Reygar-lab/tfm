#!/bin/bash
#SBATCH -p ledley-q
#SBATCH --chdir=/home/alumno21/tfm/samples
#SBATCH -J samples
#SBATCH --cpus-per-task 6
#SBATCH --mail-type=none
#SBATCH --mail-user=belen.r.g@um.es


for i in SRR5985091 SRR5985103 SRR5985104 SRR5985090 SRR5985096 SRR5985099 SRR5985110 SRR5985116 SRR5985119 SRR5985107 SRR5985113 SRR5985114 SRR7889911 SRR7889914 SRR7889916 SRR7889917 SRR7889918 SRR7889919 
do echo $i

done | parallel fastq-dump --split-3 -I --gzip --outdir /home/alumno21/tfm/samples
