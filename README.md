# Screening autism-associated environmental factors in differentiating human neural progenitors with fractional factorial design-based transcriptomics
Abishek Arora (1,2), Martin Becker (1,2), Cátia Marques (3), Marika Oksanen (1,2), Danyang Li (1,2), Francesca Mastropasqua (1,2), Michelle Evelyn Watts (1,2), Manish Arora (4), Anna Falk (5,6), Carsten Oliver Daub (7,8), Ingela Lanekoff (3) and Kristiina Tammimies (1,2,*)

1.	Center of Neurodevelopmental Disorders (KIND), Centre for Psychiatry Research, Department of Women's and Children's Health, Karolinska Institutet, and Child and Adolescent Psychiatry, Stockholm Health Care Services, Stockholm County Council, Stockholm, Sweden.
2.	Astrid Lindgren Children’s Hospital, Karolinska University Hospital, Region Stockholm, Stockholm, Sweden 
3.	Department of Chemistry - BMC, Uppsala University, Uppsala, Sweden. 
4.	Department of Environmental Medicine and Public Health, Icahn School of Medicine at Mount Sinai, New York, USA. 
5.	Department of Neuroscience, Karolinska Institutet, Stockholm, Sweden. 
6.	Lund Stem Cell Center, Division of Neurobiology, Department of Experimental Medical Science, Lund University, Lund, Sweden. 
7.	Department of Biosciences and Nutrition, Karolinska Institutet, Stockholm, Sweden. 
8.	Science for Life Laboratory, Stockholm, Sweden.

*Correspondence: [kristiina.tammimies@ki.se](mailto:kristiina.tammimies@ki.se)

**Published in *Scientific Reports* (2023), DOI:** [10.1038/s41598-023-37488-0](https://doi.org/10.1038/s41598-023-37488-0) | **PubMed:** [37386098](https://pubmed.ncbi.nlm.nih.gov/37386098/) | **GEO:** [GSE229546](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE229546)

## Analysis Pipelines

Thank you for showing interest in our manuscript. In this GitHub repository you will find the source code and data sets required to replicate our figures and findings using R. With respect to the four cell lines included in our study, they have been coded as follows in the included R Markdown files:

- CTRL<sub>Male</sub> – CTRL9II (Neurotypical Male)
- CTRL<sub>Female</sub> – AF22 (Neurotypical Female)
- ASD<sub>HNRNPU</sub> – ASD12BI (Male with ASD diagnosis and *HNRNPU* deletion)
- ASD<sub>CASK</sub> – ASD17AII (Male with ASD diagnosis and *CASK* splice site variant)

### RNA-seq Analysis – Independent Effects

The [directory](RNAseq_Analysis_Levels_I_II_III) contains the R Markdown file and data sets required for differential gene expression analysis and gene-set enrichment analysis (GSEA) for independent effects of environmental factors, based on the fractional factorial experimental design. The analysis pipeline in this directory corresponds to the following stratified analysis approach as described in our manuscript: Global Effects (*Level I*), Clinical Background Effects (*Level II*) and Cell Lines Effects (*Level III*).

### RNA-seq Analysis – Interaction Effects
The [directory](RNAseq_Analysis_Level_IV) contains the R Markdown file and data sets required to perform differential gene expression analysis and GSEA for two-way interactions effects of environmental factors, based on the fractional factorial experimental design. The analysis pipeline in this directory corresponds to the following stratified analysis approach as described in our manuscript: Interaction Effects (*Level IV*).

### Gene List Enrichment Analysis
The [directory](Gene_Enrichment_Analysis) contains the R Markdown file and data sets to test for enrichment of significant differentially expressed genes in other gene lists. These were identified following analysis of global effects (*Level I*) for exposure to lead (Pb) and fluoxetine hydrochloride (FH). Enrichment was checked in publicly available gene lists that have been described in the manuscript, namely SFARI, SFARI high confidence, Epilepsy Panel App, Intellectual Disability Panel App and a developmental gene list (DOI: [10.1002/aur.2666](https://doi.org/10.1002/aur.2666)). The directory also includes the analysis of gene list enrichment for genes with differential exon usage events following bisphenol A (BPA) exposure in the CTRL<sub>Female</sub> (AF22) cell line.

### BrainSpan Enrichment Analysis
The [directory](BrainSpan_Analysis) contains the R script and data sets to check the enrichment of significant differentially expressed genes at certain timepoints in different regions of the developing human brain. For this, we used the publicly available [BrainSpan Atlas](https://www.brainspan.org) that contains spatio-temporally stratified gene expression data pertaining to typical neurodevelopment.

### Differential Exon Usage Analysis
The [directory](DEU_Analysis) contains the R Markdown files and data sets to detect differential exon usage events as independent effects of environmental factors, based on the fractional factorial experimental design. The analysis pipeline in this directory corresponds to the following stratified analysis approach as described in our manuscript: Global Effects (*Level I*), Clinical Background Effects (*Level II*) and Cell Lines Effects (*Level III*).

### Mass Spectrometry – Metabolomics Analysis
The [directory](Metabolomics_Analysis) contains the R Markdown file and data sets needed to analyse the significance of changes in concentrations of metabolites detected in cell lines treated with FH, compared to non-treated controls. The analysis pipeline in this directory corresponds to the following stratified analysis approach as described in our manuscript: Global Effects (*Level I*), Clinical Background Effects (*Level II*) and Cell Lines Effects (*Level III*). Source code to produce the concentration plots for different levels of analysis are also included.
