d<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
p<-split(d,d$State)
temp<-p$MD
#q<-min(split(outcome,list(outcome$state,outcome$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)))
#r<-min(split(outcome,list(outcome$state,outcome$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)))
k<-temp[which.min(temp$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
k$Hospital.Name
