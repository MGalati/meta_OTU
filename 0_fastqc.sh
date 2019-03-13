#!/bin/bash

#$ -q normal.q
#$ -N fastqc
#$ -M florentin.constancias@cirad.fr
#$ -pe parallel_smp 6
#$ -l mem_free=6G
#$ -V
#$ -cwd
#$ -V


module purge
module load system/conda/5.1.0
source activate fastqc_multiqc

# JOB BEGIN

for IN in BP CP DD IB II LU MC
do
mkdir ${IN}/qc/
fastqc -t $NSLOTS $IN*fastq* -o ${IN}/qc/
multiqc ${IN}/qc/ -o ${IN}/qc/
done


# JOB END
date

exit 0
