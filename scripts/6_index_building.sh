#Creation of an index of Mesorhabditis Belari Coding DNA Sequences

mkdir -p data/cds_belari

wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS16/species/mesorhabditis_belari/PRJEB30104/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa.gz  -P data/cds_belari
#get the M.Belari CDS fasta files from the WormBase website
gunzip data/cds_belari/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa.gz
#unzip the files

mkdir -p intermediary_results/quantification/index_belari
#creation of a new directory in which will be the built index from the unzipped CDS

#Creation of the index itself

CDS_FASTA=data/cds_belari/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa
INDEX_OUT_PREFIX=intermediary_results/quantification/index_belari/mesorhabditis_belari

kallisto index -k 31 --make-unique -i ${INDEX_OUT_PREFIX}.index ${CDS_FASTA} \
2> ${INDEX_OUT_PREFIX}_kallisto_index_report.txt
#-i: name the output file
#-k: length of the kmeres (by default: 30)