# Use of fastp to clean the data

mkdir -p intermediary_results/trim_data/
# -p = si le dossier est deja cree, pas de bug, on utilise ce dossier
mkdir -p intermediary_results/report_trimming/

for FASTQ_GZ_FILES in data/fastq_files/*gz
do
  FASTQ_GZ_NAME=$(basename $FASTQ_GZ_FILES)
  FASTQ_GZ_PREFIX=${FASTQ_GZ_NAME/.fastq.gz}
  echo $FASTQ_GZ_FILES
  echo $FASTQ_GZ_NAME
  echo $FASTQ_GZ_PREFIX
  
  OUT_FASTQ_GZ="intermediary_results/trim_data/${FASTQ_GZ_PREFIX}_trim.fastq.gz"
  OUT_REPORTS_PREFIX="intermediary_results/report_trimming/${FASTQ_GZ_PREFIX}"
  echo $OUT_FASTQ_GZ
  echo $OUT_REPORTS_PREFIX
  
  fastp --thread 7 \
    --qualified_quality_phred 30 \
    --max_len1 80 \
    --in1 ${FASTQ_GZ_FILES} \
    --out1 ${OUT_FASTQ_GZ} \
    --html ${OUT_REPORTS_PREFIX}.html \
    --json ${OUT_REPORTS_PREFIX}_fastp.json \
    --report_title ${FASTQ_GZ_PREFIX}
done

#on coupe nos reads a 80pb pcq apres la qlite est moins bonne
#normal de pas detecter d adaptateur pr les reads: on les a pas sequence, le sequenceur a fait le tri

