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

applyPrettyNames <- function(reading)
{
  originalNames <- names(reading)
  allNewNames <- vector();
  
  for(i in originalNames)
  {
    newName <- vector();
    
    if(i =="sub_id" ||i=="activity_name"||i=="act_id")
    {
      allNewNames<- c(allNewNames,i);
      next;
    }
    if(length(grep("mean()",i,fixed=T))>0)
    {
      newName <- c(newName,"Mean_of_");
    }
    else if(length(grep("std()",i,fixed=T))>0)
    {
      newName <- c(newName,"SD_of_");
    }
    
    if(substring(i,nchar(i),nchar(i))=="X" ||substring(i,nchar(i),nchar(i))=="Y"||substring(i,nchar(i),nchar(i))=="Z")
    {
      newName <- c(newName,substring(i,nchar(i),nchar(i)),"_of_");
    }
    
    
    if(length(grep("Mag",i,fixed=T))>0)   
    {
      newName <- c(newName,"Euclidean_norm_of_");
    }
    if(length(grep("Jerk",i,fixed=T))>0)   
    {
      newName <- c(newName,"Jerk_obtained_from_");
    }
    if(substring(i,1,1)=="t")   
    {
      newName <- c(newName,"Butterworth_filtered_");
    }
    if(substring(i,1,1)=="f")   
    {
      newName <- c(newName,"Fast_fourier_transformed_");
    }
    
    
    if(length(grep("BodyBody",i,fixed=T))>0)   
    {
      newName <- c(newName,"Body_Body_");
    }
    else if(length(grep("Body",i,fixed=T))>0)   
    {
      newName <- c(newName,"Body_");
    }
    
    
    if(length(grep("Gravity",i,fixed=T))>0)   
    {
      newName <- c(newName,"Gravity_");
    }
    if(length(grep("Acc",i,fixed=T))>0)   
    {
      newName <- c(newName,"Acceleration");
    }
    if(length(grep("Gyro",i,fixed=T))>0)   
    {
      newName <- c(newName,"Angular_velocity");
    }
    
    allNewNames<- c(allNewNames,paste(newName,collapse=""));
    
  }
  
  names(reading) <- allNewNames;
}

