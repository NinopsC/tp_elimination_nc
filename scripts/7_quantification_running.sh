#Quantification/mapping using Kallisto

mkdir -p results/quantification/

INDEX=results/intermediary_results/quantification/index_belari/mesorhabditis_belari.index
LEN=522
SD=200

for TRIM_FASTQ_GZ_FILE in results/intermediary_results/trim_data/*gz
do
  TRIM_FASTQ_GZ_NAME=$(basename $TRIM_FASTQ_GZ_FILE)
  TRIM_FASTQ_GZ_PREFIX=${TRIM_FASTQ_GZ_NAME/_trim.fastq.gz}
  echo $TRIM_FASTQ_GZ_FILE
  echo $TRIM_FASTQ_GZ_NAME
  echo $TRIM_FASTQ_GZ_PREFIX
  
  OUT_QUANT_PREFIX="results/quantification/${TRIM_FASTQ_GZ_PREFIX}"
  echo $OUT_QUANT_PREFIX
  echo $OUT_REPORTS_PREFIX
  
  mkdir -p "results/quantification/${TRIM_FASTQ_GZ_PREFIX}/"
  kallisto quant -i ${INDEX} -t 7 \
                 --single -l ${LEN} -s ${SD} \
                 --bias \
                 -o ${OUT_QUANT_PREFIX} \
                 ${TRIM_FASTQ_GZ_FILE}
done
#single = specify that the data are single end
#SD = standard deviation
#bias = correct the GC rates