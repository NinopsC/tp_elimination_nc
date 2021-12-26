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
    - ***intermediary results***: contains the trimmed samples sequences, the trimming reports and the index construction from the reference genome
    - ***quantification***: contains the results from the Kallisto mapping
- **scripts**: linked to Git, contains the different scripts detailing how to obtain and analyse the results.

## Timeline of the analysis
