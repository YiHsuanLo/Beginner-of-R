# 1025 in class exercise

install.packages("animation")
install.packages("gganimate")
library(animation)
library(ggplot2)
library(gganimate)

for(i in c(1:100)){
  print("Hello world!")
  print(i*i)
}

foo <- seq(1,100,by=2)
n <- length(foo)
foo.squared <- NULL

for(i in 1:n){
  foo.squared[i]=foo[i]^2
}

foo.df <- data.frame(foo,foo.squared)
head(foo.df)
plot(foo.df$foo,foo.df$foo.squared)


foo.squared2 <- foo^2
plot(foo,foo.squared2)


system.time(foo.squared2 <- foo^2)
system.time(for(i in 1:100000){
  foo.squared[i]=foo[i]^2
})

num_gen <- 10
N <- NULL
N[1] <- 2
for(i in c(2:num_gen)){
  N[i]=2*N[i-1]
}
N
plot(1:num_gen,N,type="b")

##search The analyst takeover 


grow <- function (growth.rate) { # argument "growth.rate" of function "grow" 
  num_gen<-10
  generation<-1:num_gen
  N <- rep (0,num_gen)
  N[1] <- 1
  for (i in 2:num_gen) {
    N[i]=growth.rate*N[i-1] # not the use growth.rate argument
  }
  plot(N~generation,type='b', main=paste("Rate =", growth.rate)) 
}

par(mfrow=c(2,5))
for(i in 1:10){
  grow(i)
}

dev.off()


grow2 <- function(growth.rate,number.generation){
  N <- NULL
  N[1] <- 1
  for (i in 2:number.generation) {
    N[i]=growth.rate*N[i-1] # not the use growth.rate argument
  }
  plot(N~c(1:number.generation),type='b', main=paste("Rate =", growth.rate))
}

grow2(2,10)


grow3 <- function (growth.rate) { 
  num_gen <- 10
  generation <- 1:num_gen
  N <- rep (0,num_gen)
  N[1] <- 1
  for (i in 2:num_gen) {
    N[i]=growth.rate*N[i-1]
  }
  plot(N~generation, xlim=c(0,10), ylim=c(0,100000), type='b', main=paste("Rate =", growth.rate))
}
saveGIF({
  for(i in c(2:10)){
    grow3(i)
}})


#Progressing

logistic <- function(growth.rate,num.generation){
  N <- NULL
  N[1] <- 10
  for(i in 2:num.generation)
  N[i] <- N[i-1]+growth.rate*N[i-1]*((100-N[i-1])/100)
  plot(N~c(1:num.generation),type="b",xlim=c(0,50),ylim=c(0,120),main=paste("Rate =",growth.rate))
}

logistic(3,50)

saveGIF({
  for(i in seq(0,4,by=0.2)){
    logistic(i,50)
  }
},interval=0.5)

#interval for increase the speed

?saveGIF








