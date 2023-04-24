FH_F <- function(SampleData){
  FH_vector <- rep(NA, 43)
  for (i in 1:nrow(SampleData)) {
    if(SampleData[i,5] == "E1" ){
      FH_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E2") {
      FH_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E3" ){
      FH_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E4" ){
      FH_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E5"  ){
      FH_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E6"  ){
      FH_vector[i] <- "control"
    }
    if(SampleData[i,5] ==  "E7" ){
      FH_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E8" ){
      FH_vector[i] <- "control"
    }
  }
  return(FH_vector)
}