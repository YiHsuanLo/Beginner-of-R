#1101 in class exercise

install.packages("psych")
library(psych)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(car)

# students data set url 
students<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') 
# to write it:
write.table(students, file = "Data/students.txt", sep = "\t", row.names=T)

students
summary(students)
psych::describe(students)
describeBy(students, students$gender)
describeBy(students, list(students$gender,students$population))

mean(students$height)
ind.male <- students$gender == "male"
mean(students$height[ind.male])

a <- aggregate(students$height,list(students$gender),median)
b <- tapply(students$height,students$gender, median)


data(iris)
iris
#1.
plot1 <-ggplot(iris, aes(x=Species, y=Sepal.Length)) + 
  geom_boxplot()

plot2 <-ggplot(iris, aes(x=Species, y=Sepal.Width)) + 
  geom_boxplot() 

plot3 <-ggplot(iris, aes(x=Species, y=Petal.Length)) + 
  geom_boxplot() 

plot4 <-ggplot(iris, aes(x=Species, y=Petal.Width)) + 
  geom_boxplot() 

grid.arrange(plot1,plot2,plot3,plot4,ncol=2)
?grid.arrange
describeBy (iris,iris$Species)

#2.
iris %>% group_by(Species) %>% summarise(across(c(1:4), length))
aggregate(iris[,1:4],by=list(iris$Species), median)

group_by(iris,Species)



x <- students$height
y <- students$shoesize
s <- students[,1:2]

#pearson
cor(x,y)
cor(s)
cor.test(x,y)
ggplot(students, aes(x=height,y=shoesize))+
  geom_point()+
  stat_smooth(method=lm,col="red")

#spearman just rank
cor(x,y, method="spearman")
cor.test(x,y, method="spearman")


w <-(1:100)
z <-exp(x)
cor.test(w,z,method='pearson') # super low
cor.test(w,z,method='spearman') #super high


die <- data.frame(obs=c(55,44,35,45,31,30), row.names=c('Cast1','Cast2','Cast3','Cast4','Cast5','Cast6'))
die
chisq.test(die)





#normality is important in small sample size
 

