plot6 <- function()
{
  #library ggplot2 needed
  #library dplyr needed
  NEI <- readRDS("summarySCC_PM25.rds");
  SCC <- readRDS("Source_Classification_Code.rds");
  
  baltimore_California_EI <- NEI[NEI["fips"]=="24510"|NEI["fips"]=="06037" ,]
  motorSCC <- SCC[grepl("motor",SCC$Short.Name,ignore.case=T),]
  mergedDF <- merge(baltimore_California_EI,motorSCC,by.x="SCC",by.y="SCC");
  
  #apply labes to fips  for legend
  mergedDF$fips <- factor(mergedDF$fips,levels=c("24510","06037"),labels=c("Baltimore","California"))
  
  aggregatedDF <- aggregate(Emissions~year+fips,mergedDF,sum);

  #rename fips to City for legend
  aggregatedDF <- rename(aggregatedDF,city=fips)
  g <- ggplot(aggregatedDF,aes(year,Emissions,color=city)) + geom_smooth(method="lm",se=T) + geom_point();
  g <- g + labs(y="PM2.5 Emission in tonnes")
  g <- g + ggtitle("Baltimore VS California : Motor vehcile emissions");
  
  print(g);
  
  dev.copy(png,file="plot6.png",width=880,height=480)
  dev.off()
  
}