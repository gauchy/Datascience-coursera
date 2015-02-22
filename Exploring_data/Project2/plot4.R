plot4 <- function()
{

  #library ggplot2 needed
  NEI <- readRDS("summarySCC_PM25.rds");
  SCC <- readRDS("Source_Classification_Code.rds");
  

  coalSCC <- vector();
  for(i in 1:nrow(SCC))
  {
    EI.Sector <- SCC[i,4];

    if(length(grep("Coal",EI.Sector,ignore.case =T))>0)
    {
      coalSCC <- c(coalSCC,as.character(SCC[i,1])); 
      
    }
  }
  
  coalSCC <- as.factor(coalSCC);
  coalSCCDF <- SCC[SCC$SCC %in% coalSCC,];
  
  mergedDF <- merge(coalSCCDF,NEI,by.x="SCC",by.y="SCC")
  
  emissionsByYearType <- aggregate(Emissions ~ year, data = mergedDF, sum)
  
  g <- ggplot(emissionsByYearType,aes(year,Emissions))
  

  g <- g + geom_point() + geom_line();
  g <- g + labs(y="Emissions in tonnes") + ggtitle("National : Coal based PM2.5 Emissions")
  print(g)
  
  dev.copy(png,file="plot4.png",width=880,height=480)
  dev.off()

  
  
}