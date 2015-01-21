extractMeanSD <- function(reading)
{
  meansAndStdCols <- vector();
  for(i in names(reading))
  {
    
    if(length(grep("mean()",i,fixed=T))>0)
    {
      meansAndStdCols <- c(meansAndStdCols,i)
    }
    else if(length(grep("std()",i,fixed=T))>0)
    {
      meansAndStdCols <- c(meansAndStdCols,i)
    }
    
  }
  
  return(reading[meansAndStdCols])
}