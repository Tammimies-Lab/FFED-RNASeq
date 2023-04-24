VPA_F <- function(SampleData){
  VPA_vector <- rep(NA, 43)
  for (i in 1:nrow(SampleData)) {
    if(SampleData[i,5] == "E1" ){
      VPA_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E2") {
      VPA_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E3" ){
      VPA_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E4" ){
      VPA_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E5"  ){
      VPA_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E6"  ){
      VPA_vector[i] <- "control"
    }
    if(SampleData[i,5] ==  "E7" ){
      VPA_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E8" ){
      VPA_vector[i] <- "treated"
    }
  }
  return(VPA_vector)
}