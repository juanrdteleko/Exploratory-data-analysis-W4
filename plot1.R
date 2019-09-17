## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)
em_year <- aggregate(Emissions ~ year,NEI,sum )     ##We sum the obtain emissions per year
barplot(em_year$Emissions/10^6, names.arg= em_year$year, xlab="Years",ylab = "total PM2.5 in Tons",
        main="Total PM2.5 em.All sources.Years 1999,2002,2005,2008")
