#for each file in the data directory
#if the number of complete cases is greater than the threshold
#calculate the correlation between the sulfate vector and nitrate vector
#append the result to a correlation vector
corr <- function ( directory, threshold = 0 ){
  
  i = c(1)
  ans=c()
  
  complete_data = complete(directory)
  complete_data = complete_data[complete_data$nobs>threshold,]
  
  rec = nrow(complete_data)
  if(rec==0){return (ans)}
  else{
    path=paste(directory, "\\", formatC(complete_data[,1], width=3, flag= 0), ".csv", sep="")
  
    for(i in 1:rec){
    
      data = read.csv(path[i])
      co = cor(x=data$sulfate,y=data$nitrate , use="pairwise.complete.obs", method="pearson")
      ans = append( ans, co )
    
    }
    ans
  }
}