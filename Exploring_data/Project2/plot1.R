plot1 <- function()
{
  NEI <- readRDS("summarySCC_PM25.rds");
  SCC <- readRDS("Source_Classification_Code.rds");
  #change year to factor
  NEI$year <- as.factor(NEI$year)
  sumByYear <- by(NEI[,4],NEI$year,sum)
  
  #In Million Tons
  sumByYear <- sumByYear/1000000
  barplot(sumByYear,col="red",ylab="Emissions in Million Ton",main="PM2.5 from all sources");
  
  dev.copy(png,file="plot1.png")
  dev.off()
  
}