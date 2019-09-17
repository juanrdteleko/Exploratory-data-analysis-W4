##We will obtain those NEI rows with Coal and Combustion on their SCC records. Having a look at SCC, we can check that resources like coal are
##only on Scc.Level.four and combustion only appears in Scc.Leve.one.

coal <- grepl("coal",SCC$SCC.Level.Four,ignore.case = TRUE)
combRel<- grepl("comb",SCC$SCC.Level.One,ignore.case = TRUE)
coalComb<- coal&combRel
SCCcoalComb<-SCC[coalComb,]$SCC
NEI_coalComb<-NEI[NEI$SCC %in% SCCcoalComb,]


##Now we print it

Q4<-ggplot(NEI_coalComb,aes(factor(year),Emissions/10^6,fill=type)) +
    geom_bar(stat="identity") +facet_grid(.~type,scales = "free",space="free")+
    labs(x="year", y=expression("Total PM2.5 in Tons"))


print(Q4)