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
#single: specifier qu'on a du single end
#SD : standard deviation
#l:on seq des 2 cotes du fragment, et qd on map les CDS on estime la taille entre 2. Pr pvoir faire une boucle, on fait la moyenne pour tous les fragments.