complete <- function ( directory, id=1:332 ) {
  
  path=paste(directory, "\\", formatC(id, width=3, flag=0),".csv", sep="")
  j=c(1)
  data_bind=data.frame()
  
  for(i in id) {
    data = read.csv(path[j])
    nocase = nrow( data[complete.cases(data), ] )
    temp_df = c(i, nocase)
    data_bind = rbind( data_bind, temp_df)
    
    j=j+1
  }
  colnames(data_bind)<-c("id", "nobs")
  data_bind
}