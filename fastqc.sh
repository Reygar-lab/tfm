#!/bin/bash
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno21/tfm/samples/trimmed
#SBATCH -J Trim_Galore
#SBATCH --cpus-per-task 5
#SBATCH --mail-type=none
#SBATCH --mail-user=belen.r.g@um.es

RUN_PATH="/home/alumno21/tfm/samples/trimmed"
cd $RUN_PATH

for file in $(ls *trimmed.fq.gz)
do
    SAMPLE=`basename $file`
    fastqc -t 5 ${SAMPLE} -o /home/alumno21/tfm/quality-control/trimmed
done
