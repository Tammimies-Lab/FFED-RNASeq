Zn_F <- function(SampleData){
  Zn_vector <- rep(NA, 43)
  for (i in 1:nrow(SampleData)) {
    if(SampleData[i,5] == "E1" ){
      Zn_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E2") {
      Zn_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E3" ){
      Zn_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E4" ){
      Zn_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E5"  ){
      Zn_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E6"  ){
      Zn_vector[i] <- "treated"
    }
    if(SampleData[i,5] ==  "E7" ){
      Zn_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E8" ){
      Zn_vector[i] <- "control"
    }
  }
  return(Zn_vector)
}