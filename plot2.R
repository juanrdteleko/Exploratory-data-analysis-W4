## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)




Baltimore_em <- NEI[NEI$fips =="24510",]
Baltimore_em_year <- aggregate(Emissions ~ year, Baltimore_em, sum)
barplot(Baltimore_em_year$Emissions, names.arg= Baltimore_em_year$year, xlab="Years",ylab = "total Baltimore PM2.5", 
        main=("PM2.5. Total Emissions in Baltimore City. 1999–2008"))
