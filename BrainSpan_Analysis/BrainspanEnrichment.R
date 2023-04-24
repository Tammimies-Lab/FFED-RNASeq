# Author: Danyang Li
# Date: 21/05/08

# The brainspan data is downloaded from https://www.brainspan.org/static/download.html

#import significant genes
fh <- read.csv('FH_Global_Cells_Sig_Genes.csv', header=T)
pb <- read.csv('Pb_Global_Cells_Sig_Genes.csv', header=T)
colnames(fh)[2] <- 'ensembl_gene_id'

## brainspan data
#gene information
geneinfo <- read.csv("rows_metadata.csv", header = T)
row_info <- dplyr::inner_join(fh, geneinfo, by = "ensembl_gene_id") %>% select(row_num, ensembl_gene_id, gene_symbol)

##column information
metainfo <- read.csv("columns_metadata.csv", header = T)

qual <- readxl::read_xlsx('Human_Brain_Seq_Stages-converted.xlsx', sheet = 4)
qual <- qual[,c(4,6,8)]
qual <- qual[!is.na(qual$`Allen Institute ID`),]
colnames(qual)[1] <- 'donor_name'
colnames(qual)[2] <- 'structure_acronym'
metainfo <- dplyr::left_join(metainfo, qual, by = c('donor_name', 'structure_acronym'))
# expression
expr <- read.csv("expression_matrix.csv", header = FALSE, row.names = "V1")
df_tot <- as.data.frame(matrix(NA,length(row_info$row_num), length(metainfo$column_num)))
a = 1
for (i in row_info$row_num) {
  b = 2
  df_tot[a,1] <- as.character(row_info[a,3]) 
  for (j in metainfo$column_num) {
    df_tot[a,b] <- expr[i,j]
    colnames(df_tot)[b] <- as.character(metainfo[j,7])  
    b = b+1
  }
  a = a+1
}

rownames(df_tot) <- df_tot$V1
df_tot <- df_tot[,2:dim(df_tot)[2]]

## division to four regions
r1 <- subset(metainfo, metainfo$structure_acronym=="IPC" | metainfo$structure_acronym=="V1C" | metainfo$structure_acronym=="ITC" | metainfo$structure_acronym=="OFC" | metainfo$structure_acronym=="STC" | metainfo$structure_acronym=="A1C" | metainfo$structure_acronym=="A1C-STC" )
r2 <- subset(metainfo, metainfo$structure_acronym=="S1C" | metainfo$structure_acronym=="M1C" | metainfo$structure_acronym=="DFC" | metainfo$structure_acronym=="VFC" | metainfo$structure_acronym=="MFC" | metainfo$structure_acronym=="M1C-S1C") 
r3 <- subset(metainfo, metainfo$structure_acronym=="HIP" | metainfo$structure_acronym=="AMY" | metainfo$structure_acronym=="STR") 
r4 <- subset(metainfo, metainfo$structure_acronym=="CB" | metainfo$structure_acronym=="MD" | metainfo$structure_acronym=="CBC")

# mean expression in each region
df_r <- as.data.frame(matrix(NA,length(row_info$row_num)*length(r1$column_num), 4))
a = 1
aa = 1
for (i in row_info$row_num) {
  b=1
  for (j in r1$column_num) {
    df_r[aa,1] <- row_info[a,2]
    df_r[aa,2] <- expr[i,j]
    df_r[aa,3] <- as.character(r1[b,4]) # age
    df_r[aa,4] <- r1[b,7] # region
    aa = aa+1
    b = b+1
  }
  a = a+1
}

## calculate means group by same time points  
p1 <- subset(metainfo, metainfo$age=="12 pcw" | metainfo$age=="8 pcw" | metainfo$age=="9 pcw") %>% select(column_num)
p2 <- subset(metainfo, metainfo$age=="13 pcw" | metainfo$age=="16 pcw" | metainfo$age=="17 pcw") %>% select(column_num)
p3 <- subset(metainfo, metainfo$age=="19 pcw" | metainfo$age=="21 pcw" | metainfo$age=="24 pcw") %>% select(column_num)
p4 <- subset(metainfo, metainfo$age=="25 pcw" | metainfo$age=="26 pcw" | metainfo$age=="35 pcw" | metainfo$age=="37 pcw")
p5 <- subset(metainfo, metainfo$age=="1 yrs" | metainfo$age=="10 mos" | metainfo$age=="4 mos") %>% select(column_num)
p6 <- subset(metainfo,  metainfo$age=="2 yrs" | metainfo$age=="3 yrs" | metainfo$age=="4 yrs" | metainfo$age=="8 yrs") %>% select(column_num)
p7 <- subset(metainfo, metainfo$age=="11 yrs" | metainfo$age=="13 yrs" | metainfo$age=="19 yrs" | metainfo$age=="15 yrs" | metainfo$age=="18 yrs") %>% select(column_num)
p8 <- subset(metainfo, metainfo$age=="21 yrs" | metainfo$age=="23 yrs" | metainfo$age=="30 yrs" | metainfo$age=="36 yrs" | metainfo$age=="37 yrs" | metainfo$age=="40 yrs") %>% select(column_num)
l = list(p1, p2, p3, p4, p5, p6, p7, p8)

require(data.table)
df_r <- data.table(df_r)[, lapply(.SD, mean), by="V1,V3", .SDcols = !"V4"]
df_r$V4 <- 'r1'
colnames(df_r) <- c('ensembl_gene_id','age','expr','region')
df_r <- dplyr::left_join(df_r, row_info[,2:4], by = 'ensembl_gene_id')
df_r_scale <- as.data.frame(df_r %>% group_by(ensembl_gene_id) %>% mutate(expr_scale = scale(expr)))
df_r_scale$age <- factor(df_r_scale$age, levels=c('8 pcw', '9 pcw', '12 pcw', '13 pcw', '16 pcw', '17 pcw', '19 pcw', '21 pcw', '24 pcw', '25 pcw', '26 pcw', '35 pcw', '37 pcw', '4 mos', '10 mos', '1 yrs', '2 yrs', '8 yrs', '11 yrs', '13 yrs', '15 yrs', '18 yrs', '19 yrs', '21 yrs', '23 yrs', '30 yrs', '36 yrs',  '37 yrs', '40 yrs'))

## gene region enrichment using mean expression
df_mean <- matrix(NA, 10001, 8)
column = 1
set.seed(1234)
for (i in 1:length(l)) {
  df <- as.data.frame(matrix(NA,length(geneinfo$ensembl_gene_id), length(inner_join(r1, l[[i]], by = 'column_num')$column_num)))
  a = 1
  for (m in inner_join(r1, l[[i]], by = 'column_num')$column_num) {
    df[,a] <- expr[,m]
    a = a+1
  }
  df_gene <- matrix(NA,dim(df)[2], length(row_info$row_num))
  b=1
  for (n in row_info$row_num) {
    df_gene[,b] <- t(df)[,n]
    b = b+1
  }
  df_mean[1,column] <- mean(as.matrix(df_gene), na.rm = TRUE)
  
  row = 2
  for (perm in 1:10000) {
    per_row_num <- sample(geneinfo$row_num, length(row_info$row_num), replace=FALSE)
    df_perm <- matrix(NA,dim(df)[2], length(per_row_num))
    b=1
    for (n in per_row_num) {
      df_perm[,b] <- t(df)[,n]
      b = b+1
    }
    df_mean[row,column] <- mean(as.matrix(df_perm), na.rm = TRUE)
    row = row + 1
  }
  column = column + 1
}

## same for the r2-r4 regions 

## get significance level of region enrichment
# calculate the proportion of permutation coefficients higher than significant gene coefficient value as p-value
sig_p1 <- dim(df_mean[df_mean$V1>df_mean[1,1],])[1]/10000
sig_p2 <- dim(df_mean[df_mean$V2>df_mean[1,2],])[1]/10000
sig_p3 <- dim(df_mean[df_mean$V3>df_mean[1,3],])[1]/10000
sig_p4 <- dim(df_mean[df_mean$V4>df_mean[1,4],])[1]/10000
sig_p5 <- dim(df_mean[df_mean$V5>df_mean[1,5],])[1]/10000
sig_p6 <- dim(df_mean[df_mean$V6>df_mean[1,6],])[1]/10000
sig_p7 <- dim(df_mean[df_mean$V7>df_mean[1,7],])[1]/10000
sig_p8 <- dim(df_mean[df_mean$V8>df_mean[1,8],])[1]/10000


