#!/bin/bash
mkdir logs

CONDITIONS=(NI Flu NI Flu NI Flu NI Flu NI Flu NI Flu)
DATA=(ATACseq ATACseq ATACseq ATACseq H3K27ac H3K27ac H3K27ac H3K27ac H3K4me1 H3K4me1 H3K4me1 H3K4me1)
PCS=(3 3 3 3 1 1 1 1 2 4 2 4)
TEMP_DIRS=(graph_ATACseq_NI graph_ATACseq_Flu ref_ATACseq_NI ref_ATACseq_Flu graph_H3K27ac_NI graph_H3K27ac_Flu ref_H3K27ac_NI ref_H3K27ac_Flu graph_H3K4me1_NI graph_H3K4me1_Flu ref_H3K4me1_NI ref_H3K4me1_Flu)
OUT_DIRS=(graph_ATACseq_NI graph_ATACseq_Flu ref_ATACseq_NI ref_ATACseq_Flu graph_H3K27ac_NI graph_H3K27ac_Flu ref_H3K27ac_NI ref_H3K27ac_Flu graph_H3K4me1_NI graph_H3K4me1_Flu ref_H3K4me1_NI ref_H3K4me1_Flu)
DATA_FILES=(graph_ATACseq graph_ATACseq ref_ATACseq ref_ATACseq graph_H3K27ac graph_H3K27ac ref_H3K27ac ref_H3K27ac graph_H3K4me1 graph_H3K4me1 ref_H3K4me1 ref_H3K4me1)

LEN=${#CONDITIONS[@]}

for (( NUM=0; NUM<$LEN; NUM++ ))
    do
       DAT=${DATA[$NUM]}
       CONDITION=${CONDITIONS[$NUM]}
       PC=${PCS[$NUM]}
       TEMP_DIR=${TEMP_DIRS[$NUM]}
       OUT_DIR=${OUT_DIRS[$NUM]}
       DATA_FILE=${DATA_FILES[$NUM]}


       echo " ************************************** "
       echo " BEGIN MATRIXEQTL PIPELINE FOR: $DAT "
       echo " CONDITION = $CONDITION;"
       echo " EXP PC TO REGRESS = $PC;"
       echo " TEMP DIRECTORY = $TEMP_DIR;"
       echo " OUTPUT DIRECTORY = $OUT_DIR;"
       echo " READ_COUNTS_NAME = $DATA_FILE;"
       echo " ************************************** "
       sbatch job_specs.sbatch $CONDITION $DAT $PC $TEMP_DIR $OUT_DIR $DATA_FILE &
    done
wait

echo "ALL JOBS SUMBITTED AT: `date`"

## EOF ##