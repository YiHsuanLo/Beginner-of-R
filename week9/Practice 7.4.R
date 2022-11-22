data <- read.table("https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt",header=T)

nutrient <- data[which(data$treatment=="nutrient"),1:6]
water <- data[which(data$treatment=="water"),1:6]

nutrient
water

my.t.test <- function(x,y,tail){
  
  #mean
  x.mean = apply(x,2,mean)
  y.mean = apply(y,2,mean)
  
  #standard deviation
  x.sd = apply(x,2,sd)
  y.sd = apply(y,2,sd)
  
  #sample size
  x.N = nrow(x)
  y.N = nrow(y)
  
  #t value
  t = (x.mean-y.mean)/sqrt(x.sd^2/x.N+y.sd^2/y.N)
  
  #degree of freedom
  df = nrow(x)+nrow(y)-2
  
  #alternative hypothesis & p value
  if(tail == "two.tailed"){
    p = 2*(1-pt(abs(t),df))
  }else if(tail == "left.tailed"){
    p = pt(t,df)
  }else if(tail == "right.tailed"){
    p = 1-pt(t,df)
  }
  
  return(data.frame(t=round(t,5),p.value=round(p,7),reject=round(p,7)<=0.05))
}


my.t.test(nutrient,water,"two.tailed")


