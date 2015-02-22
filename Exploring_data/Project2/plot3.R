plot3 <- function()
{
  #library ggplot2 needed
  NEI <- readRDS("summarySCC_PM25.rds");
  SCC <- readRDS("Source_Classification_Code.rds");
  BaltimoreEI <- NEI[NEI["fips"]==24510,]
  
  ## group the total emission per year and by type.
  emissionsByYearType <- aggregate(Emissions ~ year + type, data = BaltimoreEI, sum)
  g <- ggplot(emissionsByYearType,aes(year,Emissions))
  

  g <- g + geom_point() + geom_smooth(method="lm",se=T) +facet_grid(.~type) +labs(y="PM2.5 emission in tonnes")
  g <- g + ggtitle("Balitmore City : Emission from different types")
  print(g)
  
  dev.copy(png,file="plot3.png",width=880,height=480)
  dev.off()

  
}