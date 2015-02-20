plot2 <- function()
{
  NEI <- readRDS("summarySCC_PM25.rds");
  SCC <- readRDS("Source_Classification_Code.rds");
  BaltimoreEI <- NEI[NEI["fips"]==24510,]
  #change year to factor
  BaltimoreEI$year <- as.factor(BaltimoreEI$year)
  sumByYear <- by(BaltimoreEI[,4],BaltimoreEI$year,sum)
  

  barplot(sumByYear,col="red",ylab="Emissions in Ton",main="Baltimore City : PM2.5 emissions from all sources");
  
  dev.copy(png,file="plot2.png")
  dev.off()
  
}