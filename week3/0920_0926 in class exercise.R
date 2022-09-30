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

library(dplyr)
summarised <- summarise(iris,Mean.Width=mean(Sepal.Width))
summarised

##dplyr
select1 <- dplyr::select(iris, Sepal.Length, Sepal.Width)
head(select1)
select2 <- dplyr::select(iris, Sepal.Length:Petal.Width)
head(select2,2)
select3 <- dplyr::select(iris, c(1,2,5))
head(select3)
select4 <- dplyr::select(iris, -Species,-Sepal.Length)
head(select4)

#filter
setosa <- iris$Species=="setosa"
setosa <- iris[setosa,]
setosa
filtered1 <- filter(iris, Species=="setosa")
filtered1
filtered2 <- filter(iris, Species=="versicolor",Sepal.Width>3)
filtered2
filtered3 <- filter(iris, Species=="versicolor",Sepal.Width>3,Sepal.Length>4)
filtered3

tail(filtered2,2)

#mutate
rm(mutated)
mutated1 <- mutate(iris, Greater.Half=Sepal.Width>0.5*Sepal.Length)
tail(mutated1)

table(mutated1$Greater.Half)

table(iris$mutated1.Greater.Half)

#arrange
arranged1 <- arrange(iris,Sepal.Width)
head(arranged1)
arranged2 <- arrange(iris,desc(Sepal.Width))
tail(arranged2)

#group_by
gp <- group_by(iris,Species)
gp
gp.mean <- summarise(gp, Mean.Sepal=mean(Sepal.Width), Mean.Petal=mean(Petal.Width))
gp.mean


#pipe operator %>%

objectB <- iris%>%
  arrange(iris$Sepal.Width)%>%
  filter(Species=="setosa", Sepal.Width>3)
head(objectB)  
tail(objectB,2)

iris%>%
  group_by(Species)%>%
  summarise(Mean.Length=mean(Sepal.Length))


##tidyr
getwd()
rm(tw_corals)
Tw_corals <- read.table("week3/Data/tw_corals.txt",header=T,sep="\t",dec=".")
Tw_corals
library(tidyr)
tw_corals <- data.frame(t(Tw_corals))
Tw_corals_long <- Tw_corals%>%pivot_longer(Southern_TW:Northern_Is, names_to="Region_TW", values_to="Richness")
Tw_corals_long
Tw_corals_wide <- pivot_wider(Tw_corals_long, names_from="Region_TW", values_from="Richness")
Tw_corals_wide

income <- read.table("week3/Data/metoo.txt",header=T,sep="\t",dec=".",na.strings="n/a")
income
income_long <- income%>%pivot_longer(cols=-state, names_to=c("gender","work_type"), values_to="income", names_sep="_")
income_long2 <- income%>%pivot_longer(cols=-state, names_to=c("gender_work_type"), values_to="income")
income_wide <- income_long%>%
  pivot_wider(names_from=c("gender":"work_type"),values_from="income")
income_wide2 <- income_long%>%
  pivot_wider(names_from=c("gender":"work_type"),values_from="income",names_sep=".")


#splitting
#column
income_long_var <- income%>%
  pivot_longer(cols=-1,
               names_to="var1",
               values_to="income")

head(income_long_var,10)
rm(income_seq)
income_sep <- income_long_var%>%separate(col=var1,sep="_",into=c("gender","work_type"))
income_sep
income_sep2 <- income%>%
  pivot_longer(cols=-1,
               names_to="var1",
               values_to="income")%>%
  separate(col=var1,sep="_",
           into=c("gender","work_type"))
income_sep2
income_sep3 <- income%>%
  pivot_longer(cols=-1,
               names_to=c("gender","work_type"),
               values_to="income",
               names_sep="_")
income_sep3

#row
income_long_var%>%separate_rows(var1,sep="_")


df <- tibble(x=c("Dark","Brunette","Blond"),n=c(10,3,1))  
df
uncount(df,n)
uncount(df,n,.id="individual #")


