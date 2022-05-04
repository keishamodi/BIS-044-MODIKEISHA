cat("\014")

#Installing needed Libraries
if (!require("ggplotgui")) devtools::install_github("gertstulp/ggplotgui")
library(ggplotgui)

if (!require("ggplot2")) install.packages("ggplot2")

library(ggplot2)

#Reading in Data
DF <- read.csv("TBQ05.20211116133909.csv")
nrow(DF)

#Making Value a numeric
DF$VALUE <- as.numeric(DF$VALUE)

#Making NA be 0
DF[is.na(DF)] = 0

DFF <- DF[which(DF$Port == "All Main Irish Ports"),]

#Creating breakdown of Total Tonnage per Port
by(DFF$VALUE,DFF$Region.of.Trade,sum)

#Making Graph
DF <- DF[which(DF$C01713V02044 == 1 &
                 DF$Port != "All Main Irish Ports"),]

graph <- ggplot(DF, aes(x = Quarter, y = VALUE, colour = Port)) +
  geom_point() +
  theme_bw()
graph
#-5 na, -5 plot 90/100

