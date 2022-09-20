#week 3
library(datasets)
data("iris")
head(iris)

str(iris)
summary(iris)
fix(iris)

# read data set from url
students <- read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') 
str(students)
head(students)

students$height
students[,1]
students[1,1]
students[10,]

students$height[5]
students[c(1,10),]

f <- students$gender=="female"
females <- students[f,] 
females
rownames(females) <- c("Vanessa","Vicky","Michelle","Joyce","Victoria")
females
rownames(females) <- females$height
females

N1 <- iris$Species=="setosa"
N2 <- iris$Species=="versicolor"
N3 <- iris$Species=="virginica"
setosa <- iris[N1,]
versicolor <- iris[N2,]
virginica <- iris[N3,]
str(virginica)


?sample
1:nrow(females)
sample(1:nrow(females),3)
sample(1:nrow(females),4,replace=T)
sf <- sample(1:nrow(females),2)
females[sf,]


ind1 <- order(students$height)
students[ind1,]
students[order(-students$height),]
str(iris)


colors <- ifelse(students$gender=="male","blue","red")
students$colors <- colors
students$colors <- ifelse(students$gender=="male","blue","red")
students$gender <- ifelse(students$gender=="male","green","yellow")
students

tall <- students$height>=160
tallDF <- students[tall,]
tallDF
str(tall)
str(tallDF)

not38 <- students$shoesize!=38
not38
shoesDF <- students[not38,]
shoesDF

head(iris)

colors <- ifelse(iris$Species=="setosa","purple",ifelse(iris$Species=="versicolor","blue","pink"))
iris$colors <- colors
sort <- order(-iris$Sepal.Width)
iris[sort,]
versicolor <- iris[iris$Species=="versicolor",]
versicolor$colors <- NULL
head(versicolor)

iris[sort,]
iris$size <- iris$Sepal.Length*iris$Sepal.Width
sort2 <- order(-iris$size)
iris[sort2,]
