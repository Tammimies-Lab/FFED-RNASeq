BPA_F <- function(SampleData){
  BPA_vector <- rep(NA, 43)
  for (i in 1:nrow(SampleData)) {
    if(SampleData[i,5] == "E1" ){
      BPA_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E2") {
      BPA_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E3" ){
      BPA_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E4" ){
      BPA_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E5"  ){
      BPA_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E6"  ){
      BPA_vector[i] <- "treated"
    }
    if(SampleData[i,5] ==  "E7" ){
      BPA_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E8" ){
      BPA_vector[i] <- "control"
    }
  }
  return(BPA_vector)
}