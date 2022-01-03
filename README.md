# RNA-sequencing to study programmed genome elimination in *Mesorhabditis belari*
*TP NGS 2021 - Nina*

This project was initiated by Marie Delattre's team "Evolutionary Cell Biology in Nematodes" from the LBMC.

## Context of the project

Programmed genome elimination happens in several species, and notably in the somatic cells of a free-living soil nematode called *Mesorhabditis belari*. In this nematode, genome elimination happens in five events during embryo development between the stages 5-cells and 15-cells.

The project presented here aims to identify potential effectors of the genome elimination mechanism thanks to a transcriptomic screen. Following RNA-sequencing of single embryos at different stages, the objective is to find genes for which the expression correlates with genome elimination. Therefore, *M.belari* embryos were sorted at different developmental stages:
- 1 cell and 2 cells (before elimination)
- 4 cells and 8 cells (during elimination)
- 8 cells + 5h (around 60 cells) and 8 cells + 7h (around 100 cells) (after elimination).

Samples extraction was duplicated at each stage, so 12 samples were obtained in total.

To identify genes differentially expressed during genome elimination (4-8 cells stages), mRNAs from the 12 samples were sequenced by Illumina and mapped to *M.belari* reference transcriptome.

## Files organization

This project is organized in 3 directories:
- **data**: not linked to Git, contains raw FastQ files obtained from the 12 samples sequencing
- **results**: not linked to Git
    - **intermediary results**: contains the trimmed samples sequences, the trimming reports and the index construction from the reference genome
    - **quantification**: contains the results from the Kallisto mapping
- **scripts**: linked to Git, contains the different scripts detailing how to obtain and analyse the results.

## Timeline of the analysis

### Obtention of the count matrix

#### Data download

*See 2_data_download script.*
Import of the raw sequencing data (fastq files) from the IGFL ftp (file transfer protocol).

#### Data renaming

*See 3_data_renaming script.*
 Fastq files moved in the data/fasq_files directory and renamed to refer clearly to a given sample (e.g., 8cells5h_rep2).

#### Data quality control
 
*See 4_data_quality_control script.*
Use of the fastqc function to perfom a series of analyses on the raw data fastq files. Obtention of quality scores and GC content for each read. The results show that the data are of good quality (except at the very begining and at the end, thus reads will be cut and kept from 30pb to 80pb for further analysis) and that the GC content display a multimodal distribution (surprizing, but will not prevent from conducting further analysis).

#### Data trimming

*See 5_data_trimming script.*
Based on the quality analysis report, deletion of the low quality parts of the reads; reads are cut and kept from 30pb to 80pb.

#### Index building

*See 6_index_building script.*
Import of the annotated *M.belari* Coding DNA Sequences (CDS) from WormBase Parasite to build a transcription index, which will be used for the pseudomapping of the samples reads.

#### Quantification running

*See 7_quantification_running and 8_aggregation_reports scripts.*
Use of Kallisto to pseudomap the trimmed reads on the *M.belari* index (single ead reads). Fragment length of 552 and Standard Deviation of 200 were chosen based on the IGFL Illumina data sequencing report.

Aggregation of all the pseudomapping data into one file using multiqc. Surprisingly, the results show a low pseudomapping ratio (around 25%), that could be explained by non-optimal Kallisto parameters or the sequencing or rRNA instead of mRNA only.

Obtention of the count matrix (table that reports, for each sample, the number of fragments that have been assigned to each gene) to detect differentially expressed genes. 

### Analysis of the count matrix

Import of the quantification data into R using tximport.
See *analysis_R.Rmd* to read the details concerning the method and results of the count matrix analyses.
To sum up, a principal component analysis (PCA) was conducted to check the data quality, genes with significant down- or up-regulation during genome elimination or similar expression patterns were identified, and their interactions were analysed using the "string" database.
