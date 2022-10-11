##week6
data(iris)
#col= rgb(red,green,blue,transparent)
#col= "rgbnumber"
#col= "color"

plot(iris$Petal.Length)
plot(iris$Petal.Width)
plot(data=iris, Petal.Length~Petal.Width)

plot(data=iris, Petal.Length~Petal.Width,
     xlab="Petal width (cm)",
     ylab="Petal length (cm)",
     main="Petal width & length of iris flower")

plot(data=iris, Petal.Length~Petal.Width,
     xlab="Petal width (cm)",
     ylab="Petal length (cm)",
     main="Petal width & length of iris flower",
     pch=19,cex=2,
     col=rgb(1,0,0,0.1))

#pch="ploting character"
#cex="character expension"

col.iris <- ifelse(iris$Species=="setosa","purple",ifelse(iris$Species=="versicolor","blue","pink"))
col.iris

plot(data=iris, Petal.Length~Petal.Width,
     xlab="Petal width (cm)",
     ylab="Petal length (cm)",
     main="Petal width & length of iris flower",
     pch=19,cex=2,
     col= scales::alpha(col.iris,0.2))

col.iris <- as.factor(col.iris)
levels(col.iris)
legend(x="bottomright", pch=19, cex=1, legend= c("versicolor","setosa", "virginica"), col=levels(as.factor(scales::alpha(col.iris,0.2))))


col=levels(col.iris)
col
col2=levels(as.factor(scales::alpha(col.iris,0.2)))
col2

ratio <- iris$Petal.Length/iris$Sepal.Width ##
plot(data=iris, Petal.Length~Petal.Width,
     xlab="Petal width (cm)",
     ylab="Petal length (cm)",
     main="Petal width & length of iris flower",
     pch=19,cex=ratio*2,las=1,
     col= scales::alpha(col.iris,0.2))
legend(x="bottomright", pch=19, cex=1, legend= c("versicolor","setosa", "virginica"), col=levels(as.factor(scales::alpha(col.iris,0.2))))

#cex.axis,cex.lab,cex.main


pairs(iris[1:4],col=scales::alpha(col.iris,0.2))


blossom <- NULL
blossom$year <- 2010:2019
blossom$count.alaska <- c(3, 1, 5, 2, 3, 8, 4, 7, 6, 9)
blossom$count.canada <- c(4, 6, 5, 7, 10, 8, 10, 11, 15, 17)
as.data.frame(blossom)

plot(count.alaska~year, data=blossom,
     type="b",pch=20,
     lty=2,lwd=0.5,col="red",
     ylab="No. of flower blossoming")
#lty="line type"
#lwd="line width"
lines(count.canada~year, data=blossom, type="b", pch=20,
      lty=3, lwd=0.5, col="blue")

#y range
y.rng <- range(c(blossom$count.alaska,blossom$count.canada))


plot(count.alaska~year, data=blossom,
     type="b",pch=20,
     lty=2,lwd=0.5,col="red",ylim=y.rng,#c(0,20),
     ylab="No. of flower blossoming")
lines(count.canada~year, data=blossom, type="l", pch=20,
      lty=1, lwd=0.5, col="blue")


dens <- density(iris$Sepal.Width,bw=0.05)
plot(dens, main="-")

qqnorm(iris$Sepal.Width)
qqline(iris$Sepal.Width)


par(las=1) #change the defult setting
plot(Petal.Length ~ Petal.Width, dat = iris, las=1)
dev.off()



library(lattice)






