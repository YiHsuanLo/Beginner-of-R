## week 5 class exercise 
## numeric (integer,double)
## character
## logical
 
rairuoho <- read.table("https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt",header=T)
typeof(rairuoho)
x <- c(1.0, -3.4, 2, 140.1) ## c: combine
typeof(x)
mode(x)

x <- 4
typeof(x)
x <- 4L # same as x <- 4 but with 4 in integer rather than double
typeof(x)

a <- 3
b <- 5.3
typeof(a)
a+b
a <- "3"
b <- "5.3"
typeof(a)
a+b

plot(a,b) #"plot" can plot character which can be transform into numeric

x1 <- c(1,0,0,1)
typeof(x1)
x2 <- as.logical(x1)# as: asign
typeof(x2)

a <- c("M", "F", "F", "U", "F", "M", "M", "M", "F", "U")
mode(a)
class(a)
as.factor(a)
a.fact <- as.factor(a)
a
a.fact
mode(a)
mode(a.fact) #in a factor, the characters are actually turn into numbers and are leveled 
class(a)
class(a.fact)
attributes(a.fact)
factor(a,levels=c("U","M","F"))

data(iris)
iris
?subset
iris.sel <- subset(iris,Species==c("setosa","virginica"))
iris.sel$Species
iris.sel
boxplot(Petal.Width ~ Species, iris.sel, horizontal = TRUE)
droplevels(iris.sel$Species)
iris.sel$Species <- droplevels(iris.sel$Species)
boxplot(Petal.Width ~ Species, iris.sel, horizontal = TRUE)
iris.sel
rownames(iris.sel) = seq(length=nrow(iris.sel))
iris.sel

x <- c(23, NA, 1.2, 5)
y <- c(23, NULL, 1.2, 5)
mean(x)
mean(x,na.rm=T) #rm: remove, na: not availiable 
mean(y)




x <- c(674 , 4186 , 5308 , 5083 , 6140 , 6381)
x
x[3]
x[c(1,3,4)]
x[2:4]
x <- c( 1.2, 5, "Rt", "2000")
x
typeof(x)

#matrix can only store one kind of data type whereas data frame can store multiple types  
m1 <- matrix(runif(9,0,10), nrow = 3, ncol = 3)
m1
m2 <- array(runif(27,0,10), c(3,3,3)) #3x3x3 matrix
m2


name <- c("a1","a2","b3")
value1 <- c(23,4,12)
value2 <- c(1,45,5)
dat <- data.frame(name,value1,value2)
str(dat)
attributes(dat)
names(dat) #column names
rownames(dat)


A <- data.frame(
  x = c(7.3, 29.4, 29.4, 2.9, 12.3, 7.5, 36.0, 4.8, 18.8, 4.2),
  y = c(5.2, 26.6, 31.2, 2.2, 13.8, 7.8, 35.2, 8.6, 20.3, 1.1) )
B <- c(TRUE, FALSE)
C <- c("apples", "oranges", "round")
my.lst <- list(A = A, B = B, C = C)
my.lst
str(my.lst)
names(my.lst)
my.lst$A
my.lst[[1]]
class(my.lst[1])
class(my.lst[[1]])

lst.notags <- list(A, B, C)
lst.notags
names(lst.notags)

M <- lm(y~x, A)
str(M)
names(M)
str(M$qr)
str(M$qr$rank)







