## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



##We will obtain those NEI rows with Coal and Combustion on their SCC records. Having a look at SCC, we can check that resources like coal are
##only on Scc.Level.four and combustion only appears in Scc.Leve.one.
library(dplyr)
library(ggplot2)
##Looking at SCC we can see that under vehicle on Level.two there are all vehicle motors, included trucks,cars,bikes,... so we use it to filter

motor <- grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)    ##true for those SCC which have motor Vehicle sources
SCCmotor<-SCC[motor,]$SCC                                          ##let´s obtain the SCC ID of those sources
NEI_SCCmotor<-NEI[NEI$SCC %in% SCCmotor,]
Baltimore_NEI_SCCmotor <- NEI_SCCmotor[NEI_SCCmotor$fips=="24510",]  ##let´s keep only Baltimore vehicles

##Now we print it

Q5<-ggplot(Baltimore_NEI_SCCmotor,aes(factor(year),Emissions)) +
    geom_bar(stat="identity") +facet_grid(.~year,scales = "free",space="free")+
    labs(x="year", y=expression("Total PM2.5 in tons"))+
    labs(title=expression("PM2.5 Motor Vehicle Source Emissions. Baltimore."))

print(Q5)

