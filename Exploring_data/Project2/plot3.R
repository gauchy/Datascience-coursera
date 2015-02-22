plot3 <- function()
{
  #library ggplot2 needed
  NEI <- readRDS("summarySCC_PM25.rds");
  SCC <- readRDS("Source_Classification_Code.rds");
  BaltimoreEI <- NEI[NEI["fips"]==24510,]
  
  g <- ggplot(BaltimoreEI,aes(year,Emissions))
  
  #Removed outliers by setting the ylim to 300
  g <- g + geom_point(alpha="0.2") + geom_smooth(method="lm",se=T) +facet_grid(.~type) + coord_cartesian(ylim=c(0,300));
  print(g)
  
  dev.copy(png,file="plot3.png",width=880,height=480)
  dev.off()

  
}