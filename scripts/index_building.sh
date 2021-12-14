mkdir -p data/cds_belari

wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS16/species/mesorhabditis_belari/PRJEB30104/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa.gz  -P data/cds_belari
#on recup les fichiers fasta des cds de mesorhabditis a partir du site wormbase

gunzip data/cds_belari/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa.gz
#on dezippe le fichier

mkdir -p intermediary_results/quantification/index_belari
# maintenant on construit notre index a partir de ces cds dezippes

CDS_FASTA=data/cds_belari/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa
INDEX_OUT_PREFIX=intermediary_results/quantification/index_belari/mesorhabditis_belari

kallisto index -k 31 --make-unique -i ${INDEX_OUT_PREFIX}.index ${CDS_FASTA} \
2> ${INDEX_OUT_PREFIX}_kallisto_index_report.txt