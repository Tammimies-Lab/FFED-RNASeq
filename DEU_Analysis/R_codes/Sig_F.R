##This function is simplifying the selection of significant exons
##The user gives dxr result object as an input and chooses the thresholds
##and gives them as pval, log2fc and ebm parameters. The output is 
##a dataframe with significant dxr results

Sig_F <- function(data, pval, log2fc, ebm){
  sig <- as.data.frame(data[data$padj < pval & !is.na(data$padj),]) 
  sig <- sig[sig$log2fold_treated_control < -log2fc | sig$log2fold_treated_control > log2fc,]
  sig <- sig[sig$exonBaseMean>= ebm,]
  sig <- sig[order(sig$padj),]
  return(sig)
}