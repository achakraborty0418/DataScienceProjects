rankall<-function(outcome,rk){
  d<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  temp<-split(d,d$State)
  
  for(i in temp)
  {
    if (outcome == "Heart Attack"){
      i<-i[order(as.numeric(i$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),i$Hospital.Name),]
      if(rk=="best"){
        p<-i[which.min(i$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
      }else if(rk=="worst"){
        p<-i[which.max(i$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
      }else{
        p<-i[rk,]
        
      }
      
    }else if(outcome == "Heart Failure"){
      i<-i[order(as.numeric(i$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),i$Hospital.Name),]
      if(rk=="best"){
        p<-i[which.min(i$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
      }else if(rk=="worst"){
        p<-i[which.max(i$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
      }else{
        #df<-data.frame("Hospital Name"=i$Hospital.Name,"Rate"=i$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
        p<-i[rk,]
      }
    }else if (outcome == "Pneumonia"){
      
      i<-i[order(as.numeric(i$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),i$Hospital.Name),]
      if(rk=="best"){
        p<-i[which.min(i$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
      }else if(rk=="worst"){
        p<-i[which.max(i$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
      }else{
        #df<-data.frame("Hospital Name"=i$Hospital.Name,"Rate"=i$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia) 
        p<-i[rk,]
        
      }
      
    }else {print("Invalid Outcome")}
    #Final<- data.frame("Hospital Name", "State")
      Final<-data.frame("Hospital Name"=p$Hospital.Name, "State"=p$State)
      print(Final)
    #return(c(p$Hospital.Name, p$State))
      
  }
  #Final<-data.frame("Hospital Name"=p$Hospital.Name, "State"=p$State)
  #Final
  #return(c(p$Hospital.Name, p$State))
  #return(z)
}
