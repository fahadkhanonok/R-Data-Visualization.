library(tidyverse)

###Load the data (if you want, you could do this locally from your computer rather than download from Dropbox)

rdsa1 <- read.csv("D:/R codes/ggplot.sumlation.agri/rdrsa2.csv", fileEncoding = "UTF-8")
summary(rdsa1$Yield..kg.ha.)

ggplot(rdsa1,aes(x=Blast_Severity....,y=Yield..kg.ha.,color=Variety))+
  geom_point()

ggplot(rdsa2,aes(x=Blast_Severity....,y=Yield..kg.ha.,color=Variety))+
  geom_jitter()+
 labs(x=" Disease Severity",y="Yield kg/ha",title="Rice Blast Disease:variety and pesticide effect compearison")
  
Pesticide_nature <- recode(rdsa1$Pesticide_Type,`1`="Chemical Pesticide",`2`="Bio Pesticide")
rdsa1 <- add_column(rdsa1,Pesticide_nature)
rdsa1$Pesticide_nature

ggplot(rdsa1,aes(x=Blast_Severity....,y=Yield..kg.ha. ,color=Variety))+
  geom_jitter()+
  labs(x=" Disease Severity",y="Yield kg/ha",title="Rice Blast Disease:variety and pesticide effect compearison")+facet_wrap(~Pesticide_nature)



