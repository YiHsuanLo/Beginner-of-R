# Practice 6.2


install.packages("gifski")

#Load package
library(animation)
library(gifski)

#Create function "grow"
grow <- function(start_1,start_2,a){  #a for flexible competition coefficient
  
  #Parameters
  num_gen <- 30
  N1 <- NULL
  N2 <- NULL
  generation <- c(1:num_gen)
  growth.rate <- 1.2
  K1 <- 100
  K2 <- 120
  N1[1] <- start_1
  N2[1] <- start_2
  
  #Lotka-Volterra equation
  for (i in 2:num_gen){
    N1[i] = N1[i-1] + (3.2 * N1[i-1] * ((K1-N1[i-1]-(a[1]*N2[i-1]))/K1))
    N2[i] = N2[i-1] + (growth.rate * N2[i-1] * ((K2-N2[i-1]-(a[2]*N1[i-1]))/K2))
  }
  
  #Plot
  #print(N1[1])
  if(N1[1]>0){
    plot(N1~generation,typ="b",ylim=c(0,max(K1,K2)),ylab="N")
  }else{
    plot(N1~generation,typ="n",ylim=c(0,max(K1,K2)),ylab="N")
  }
  #print(N2[1])
  if(N2[1]>0){
    lines(N2~generation,typ="b",col=2)
  }
}


#Run function "grow" with fixed competition coefficient 0.8
par(mar=c(5,5,1,1),mfrow=c(3,1),las=1)

#start_1=1, start_2=0
grow(1,0,c(0.8,0.8))
text(25,20,"Species 1 alone",cex=1.5)

#start_1=0, start_2=1
grow(0,1,c(0.8,0.8))
text(25,20,"Species 2 alone",cex=1.5)

#start_1=1, start_2=2
grow(1,2,c(0.8,0.8))
text(25,20,"Both Species competing",cex=1.5)


#Save competing interaction plots as GIF with flexible competition coefficients (0.5~1.5)
#start_1=1, start_2=0
saveGIF({
  for(x in seq(0.5,1.5,by=0.1)){
    for(y in seq(0.5,1.5,by=0.1)){
      grow(1,0,c(x,y))
      text(25,20,paste("a12 =",x),cex=1)
      text(25,10,paste("a21 =",y),cex=1)}
  }},interval=0.8)


#start_1=0, start_2=1
saveGIF({
  for(x in seq(0.5,1.5,by=0.1)){
    for(y in seq(0.5,1.5,by=0.1)){
      grow(0,1,c(x,y))
      text(25,20,paste("a12 =",x),cex=1)
      text(25,10,paste("a21 =",y),cex=1)}
  }},interval=0.8)


#start_1=1, start_2=2
saveGIF({
  for(x in seq(0.5,1.5,by=0.1)){
    for(y in seq(0.5,1.5,by=0.1)){
      grow(1,2,c(x,y))
      text(25,20,paste("a12 =",x),cex=1)
      text(25,10,paste("a21 =",y),cex=1)}
    }},interval=0.8)

 


  