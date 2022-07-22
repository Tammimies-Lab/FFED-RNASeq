Eth_F <- function(SampleData){
  Eth_vector <- rep(NA, 43)
  for (i in 1:nrow(SampleData)) {
    if(SampleData[i,5] == "E1" ){
      Eth_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E2") {
      Eth_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E3" ){
      Eth_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E4" ){
      Eth_vector[i] <- "treated"
    }
    if(SampleData[i,5] == "E5"  ){
      Eth_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E6"  ){
      Eth_vector[i] <- "treated"
    }
    if(SampleData[i,5] ==  "E7" ){
      Eth_vector[i] <- "control"
    }
    if(SampleData[i,5] == "E8" ){
      Eth_vector[i] <- "treated"
    }
  }
  return(Eth_vector)
}