plot5 <- function()
{
  #library ggplot2 needed
  NEI <- readRDS("summarySCC_PM25.rds");
  SCC <- readRDS("Source_Classification_Code.rds");
  
  baltimoreEI <- NEI[NEI["fips"]==24510,]
  motorSCC <- SCC[grepl("motor",SCC$Short.Name,ignore.case=T),]
  mergedDF <- merge(baltimoreEI,motorSCC,by.x="SCC",by.y="SCC");
  
  aggregatedDF <- aggregate(Emissions~year,mergedDF,sum);
  
  g <- ggplot(aggregatedDF,aes(year,Emissions)) + geom_line();
  g <- g + labs(y="PM2.5 Emission in tonnes")
  g <- g + ggtitle("Baltimore City : Motor vehcile emissions");
  
  print(g);
  
  dev.copy(png,file="plot5.png",width=880,height=480)
  dev.off()
  
}