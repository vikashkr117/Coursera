pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  #Creating right path for all files
  #"E:\\Personal\\In Progress\\R\\Week-2\\specdata"
  path=paste(directory,"\\",formatC(id, width=3, flag=0),".csv", sep="")
  
  bind_data={}
  bind_data=as.data.frame(bind_data)

  j=c(1) #Initializing for path vector index tracking
  
  for (i in id) {
  
    data=read.csv(path[j])
    bind_data=rbind(bind_data,as.data.frame(data[,pollutant]))
    j=j+1
    
  }
  
  m=mean(bind_data[,1], na.rm=TRUE)
  m
}