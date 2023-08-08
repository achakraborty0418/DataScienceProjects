#library(data.table)
#setDT(temp)
library(dplyr)
rankhospital<-function(st,outcome,rk){
  d<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  p<-split(d,d$State)
  temp<-p[[st]]
  
  if (outcome == "Heart Attack"){
    temp<-temp[order(as.numeric(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),temp$Hospital.Name),]
    #d<-data.frame(temp$Hospital.Name,temp$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    df<-data.frame("Hospital Name"=temp$Hospital.Name,"Rate"=temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
  }else if(outcome == "Heart Failure"){
    temp<-temp[order(as.numeric(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),temp$Hospital.Name),]
    #d<-data.frame(temp$Hospital.Name,temp$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    df<-data.frame("Hospital Name"=temp$Hospital.Name,"Rate"=temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
  }else if (outcome == "Pneumonia"){
    
    temp<-temp[order(as.numeric(temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),temp$Hospital.Name,decreasing = FALSE),]
    #d<-data.frame(temp$Hospital.Name,temp$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    df<-data.frame("Hospital Name"=temp$Hospital.Name,"Rate"=temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    
  }else {print("Invalid Outcome")}
  
  print(df)
  
  if(rk=="best"){
    p<-df[which.min(df$Rate),]
    
    p$Hospital.Name
  }else if(rk=="worst"){
    p<-df[which.max(df$Rate),]
    p$Hospital.Name
  }else
    p<-df[rk,]
  p$Hospital.Name
  
}
