### MDViz ELTeC
# R script to produce mosaic plot from data in file "titles.csv"
  md<-read.table("titles.csv",header = T, sep = ",", fileEncoding = "UTF-8")
  head(md)
  table(md$when,md$sex)
#  plot(md)
  str(md)
  
# if package vcd not installed, uncomment following line and run as root
#install.packages("vcd")

library(vcd)

args = commandArgs(trailingOnly=TRUE)
print(args)
oFile=paste(args[2], "/mosaic.png", sep="")
print(oFile)
jpeg(oFile)
mosaic(~ vols + when + sex, data=md,
       highlighting = "sex",
       highlighting_fill=c("pink","lightblue"),
       direction=c("v","h","h"),
       labeling = labeling_values,
       main="Title counts for each balance criterion"
)

dev.off()
