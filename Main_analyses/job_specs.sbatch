#!/bin/bash

############################################
#SBATCH --job-name=CG.MATRIXeQTL
#SBATCH --output=logs/CG.ME-%j.out
#SBATCH --error=logs/CG.ME-%j.err
#SBATCH --time=36:00:00
#SBATCH --mem=80G
#SBATCH --nodes=1
############################################

CONDITION=${1}
DATA=${2}
PC=${3}
TEMP_DIR=${4}
OUT_DIR=${5}
DATA_FILE=${6}

module load R
Rscript eQTL_mapping.R $CONDITION $DATA $PC $TEMP_DIR $OUT_DIR $DATA_FILE

wait

echo " COMPLETED AT `date`"

## EOF ##
