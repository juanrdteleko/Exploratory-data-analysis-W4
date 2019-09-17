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
LosAngeles_NEI_SCCmotor <-NEI_SCCmotor[NEI_SCCmotor$fips=="06037",] ##We´ll do the same for Los Angeles

Baltimore_NEI_SCCmotor$Place <- "Baltimore"
LosAngeles_NEI_SCCmotor$Place <- "Los Angeles"
ALL_NEI_SCCmotor <- rbind(Baltimore_NEI_SCCmotor,LosAngeles_NEI_SCCmotor)

##Now we print it

Q6<-ggplot(ALL_NEI_SCCmotor,aes(factor(year),Emissions,fill=Place)) +
    geom_bar(stat="identity") +facet_grid(.~Place,scales = "free",space="free")+
    labs(x="year", y=expression("Total PM2.5 in Tons"))+
    labs(title=expression("PM2.5 Motor Vehicle Emissions.Baltimore & LA.1198-2008"))


print(Q6)

