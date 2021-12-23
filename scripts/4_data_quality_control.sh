# Check the raw data quality using fastqc

mkdir -p results/intermediary_results/raw_quality

for FASTQ_GZ_FILES in data/fastq_files/*gz
do
  FASTQ_GZ_NAME=$(basename $FASTQ_GZ_FILES)
  FASTQ_GZ_PREFIX=${FASTQ_GZ_NAME/.fastq.gz}
  fastqc $FASTQ_GZ_FILES -o results/intermediary_results/raw_quality -t 7
  #echo $FASTQ_GZ_FILES
  #echo $FASTQ_GZ_NAME
   echo $FASTQ_GZ_PREFIX
done

#Get all the "gz" files
#basename = only get the file name, after the last slash
#prefix = get rid of .fastq.gz in the variable included in "name"