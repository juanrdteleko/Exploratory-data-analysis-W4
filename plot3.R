## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)


Baltimore_em <- NEI[NEI$fips =="24510",]

Q3<-ggplot(Baltimore_em,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +facet_grid(.~type,scales = "free",space="free")+
    labs(x="year", y=expression("Total PM2.5 in Tons"))+
    labs(title=expression("PM2.5. Emissions in Baltimore City per sources. 1999–2008"))

print(Q3)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
