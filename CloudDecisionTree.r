#read  in data

library("googleVis")

dataSet<-read.delim(file="./californian_stratocumulus_all.csv",header=T,sep="")

dataSet$Date<-as.Date(dataSet$Date)

names(dataSet)[c(7,8,9,10,11)] <- c("stability", 

                                "evaporation", 

                                "sensible", 

                                "subsidence",

                                "air sea")




for (modelName in unique(dataSet$Model) ) {

  selectedModel<-which(dataSet$Model == modelName)

  dataHad <- dataSet[selectedModel, c(4,7,8,9,10,11)]

  #browser()

  modelTree<-rpart(tcamax_low~.,data=dataHad)

  title <- gsub("_monthly_amip", "", modelName)

  prp(modelTree, main=title, varlen=11)

}