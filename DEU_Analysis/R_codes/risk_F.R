risk_F <- function(SampleData){
  risk_vector <- rep(NA, 43)
  for (i in 1:nrow(SampleData)) {
    if(SampleData[i,4] == "AF22" ){
      risk_vector[i] <- "control"
    }
    if(SampleData[i,4] == "CTRL9II") {
      risk_vector[i] <- "control"
    }
    if(SampleData[i,4] == "ASD17AII" ){
      risk_vector[i] <- "risk"
    }
    if(SampleData[i,4] == "ASD12BI" ){
      risk_vector[i] <- "risk"
    }
  }
  return(risk_vector)
}