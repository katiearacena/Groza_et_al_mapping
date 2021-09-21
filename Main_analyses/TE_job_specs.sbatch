#!/bin/bash

############################################
#SBATCH --job-name=CG.MATRIXeQTL-TE
#SBATCH --output=logs/CG.ME.TE-%j.out
#SBATCH --error=logs/CG.ME.TE-%j.err
#SBATCH --time=01:00:00
#SBATCH --partition=lbarreiro
#SBATCH --mem=24G
#SBATCH --nodes=1
#SBATCH --mail-user=karacena@uchicago.edu
#SBATCH --mail-type=ALL
############################################

CONDITION=${1}
DATA=${2}
PC=${3}
TEMP_DIR=${4}
OUT_DIR=${5}
DATA_FILE=${6}

module load R
Rscript TE_mapping.R $CONDITION $DATA $PC $TEMP_DIR $OUT_DIR $DATA_FILE

wait

echo " COMPLETED AT `date`"

## EOF ##
