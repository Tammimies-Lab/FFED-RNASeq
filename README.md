# Transcriptomic and functional mapping of autism associated environmental factors in developing human neurons
Abishek Arora (1,2), Martin Becker (1,2), Cátia Marques (3), Marika Oksanen (1,2), Danyang Li (1,2), Francesca Mastropasqua (1,2), Michelle Evelyn Watts (1,2), Manish Arora (4), Anna Falk (5,6), Carsten Oliver Daub (7,8), Ingela Lanekoff (3) and Kristiina Tammimies (1,2)

1.	Center of Neurodevelopmental Disorders (KIND), Centre for Psychiatry Research, Department of Women's and Children's Health, Karolinska Institutet, and Child and Adolescent Psychiatry, Stockholm Health Care Services, Stockholm County Council, Stockholm, Sweden.
2.	Astrid Lindgren Children’s Hospital, Karolinska University Hospital, Region Stockholm, Stockholm, Sweden 
3.	Department of Chemistry - BMC, Uppsala University, Uppsala, Sweden. 
4.	Department of Environmental Medicine and Public Health, Icahn School of Medicine at Mount Sinai, New York, USA. 
5.	Department of Neuroscience, Karolinska Institutet, Stockholm, Sweden. 
6.	Lund Stem Cell Center, Division of Neurobiology, Department of Experimental Medical Science, Lund University, Lund, Sweden. 
7.	Department of Biosciences and Nutrition, Karolinska Institutet, Stockholm, Sweden. 
8.	Science for Life Laboratory, Stockholm, Sweden.
Correspondence: [kristiina.tammimies@ki.se](mailto:kristiina.tammimies@ki.se)

**Available on bioRxiv (DOI: Add DOI here once available)**

## Analysis Pipelines

Thank you for showing interest in our manuscript. In this GitHub repository you will find the source code and data sets required to replicate our figures and findings using R. With repect to the four cell lines included in our study, they have been coded as follows in the included R Markdown files:

- CTRL<sub>Male</sub> – CTRL9II (Neurotypical Male)
- CTRL<sub>Female</sub> – AF22 (Neurotypical Female)
- ASD<sub>HNRNPU</sub> – ASD12BI (Male with ASD diagnoses and *HNRNPU* deletion)
- ASD<sub>CASK</sub> – ASD17AII (Male with ASD diagnoses and *CASK* mutation)

### RNA-seq Analysis – Independent Effects

The [directory](RNAseq_Analysis_Levels_I_II_III) contains the R Markdown file and data sets required for differential gene expression analysis and gene-set enrichment analysis (GSEA) for independent effects of environmentnal factors, based on the fractional factorial experiment design. The analysis pipeline in this directory corresponds to the following stratified analysis approach as described in our manuscript: Global Effects (*Level I*), Clinical Background Effects (*Level II*) and Cell Lines Effects (*Level III*).

### RNA-seq Analysis – Interaction Effects
The [directory](RNAseq_Analysis_Level_IV) contains the R Markdown file and data sets required to perfom differential gene expression analysis and GSEA for two-way interactions effects of environmentnal factors, based on the fractional factorial experiment design. The analysis pipeline in this directory corresponds to the following stratified analysis approach as described in our manuscript: Interaction Effects (*Level IV*).

### Gene List Enrichment Analysis
The [directory](Gene_List_Enrichment) contains the R Markdown file and data sets to test for enrichemnt of significant differentially expressed genes in other gene lists. These were identified following analysis of global effects (*Level I*) for exposure to lead (Pb) and fluoxetine hydrochloride (FH). Enrichement was checked in publicly available gene lists that have been described in the manuscript, namely SFARI, SFARI high confidence, Epilepsy Panel App, Intellectual Disability Panel App and neurodevelopmental gene list (DOI: 10.1002/aur.2666). The analysis also includes analysis of gene list enrichment for genes with differential exon usage events following bisphenol A (BPA) exposure in the CTRL<sub>Female</sub>(AF22) cell line.

### Mass Spectrometry – Metabolomics Analysis
The [directory](Metabolomics_Analysis) contains the R Markdown file and data sets needed to analyse the significance of changes in concentrations of metabolites detected in cell lines treated with FH, compared to non-treated controls. The analysis pipeline in this directory corresponds to the following stratified analysis approach as described in our manuscript: Global Effects (*Level I*), Clinical Background Effects (*Level II*) and Cell Lines Effects (*Level III*). Source code to produce the concentration plots for different levels of analysis are also inucluded.
