Pb_F <- function(SampleData){
  Pb_vector <- rep(NA, 43)
  for (i in 1:nrow(SampleData)) {
    if(SampleData[i,5] == "E1" ){
      Pb_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E2") {
      Pb_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E3" ){
      Pb_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E4" ){
      Pb_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E5"  ){
      Pb_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E6"  ){
      Pb_vector[i] <- "treated"
    }
    if(SampleData[i,5] ==  "E7" ){
      Pb_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E8" ){
      Pb_vector[i] <- "treated"
    }
  }
  return(Pb_vector)
}