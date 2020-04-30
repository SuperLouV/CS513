
# myString <- "hello world"
# print(myString)
# help(c)
# example(c)
# c <- "hello"
# print(c)
# ?min()
x1 <- c(10, 5, 6, 6, 7)
x1
mode(x1)
x2 <- c(1, 2, 3, 4)
x2

x3 <- x1 + x2
x3
x4<-c(1,2,3,4,5,6)
mode(x4)
typeof(x4)

x5<-seq(from=1,to=6,by=1)
typeof(x5)

x6<-1:6
typeof(x6)

x7<-as.integer(x5)
typeof(x7)

mixed_vector<-as.character(c(1,2,8,5))
mode(mixed_vector)

ls()
?rm()

objects<-ls()
?rm()
rm(list=ls())

myfirstname<-"yilin"
myfirstname
mylastname<-"lou"
mylastname
myname<-c(myfirstname,mylastname)
myname
rm("myfirstname")
myfirstname


avector<-c(1,2,3,4)
avector

names(avector)<-c("one","two","three","four")
avector

typeof(avector)
elmentnames<-names(avector)

############################

x<-names(avector)
x
names(avector)<-c("new 1","new 2","new 3","new 4")
avector
names(avector)
myvectornames<-names(avector)

#factor
?factor()

cat<-c("good","bad","good","bad","bad","bad","good")

typeof(cat)
cat2<-factor(cat)
cat2
typeof(cat2)

cat3 <- factor(cat, levels = (c("good", "bad")))
cat3
catnumb <- as.numeric(cat3)
catnumb


days<-c("Monday","Sunday","Tuesday","Wednesday","Thursday","Saturday")
days
days_factor<-factor(days)

days_factor<-factor(days,levels = (c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))
asint<-as.integer(days_factor)

##list
my.list <- list(34453,c("khasha","Dehnad"),c(14,3,12,15,19))
my.list

my.list <-list(stud.id=34453,stud.name=c("First name","Last name"),
               stud.marks=c(14,3,12,15,19))
is.list(my.lst)
mode(my.lst)
typeof(my.lst)
length(my.lst)

my.lst2<-list(seq=1:10,my.list)

length(my.lst2)
my.dataset <- data.frame(site=c('A','B','C','D','E'),ph=c(7.4,6.3,8.6,7.2,8.9))
is.list(my.dataset)
is.data.frame(my.dataset)
is.matrix(my.dataset)
typeof(my.dataset)
length(my.dataset)

data()
data(iris)
View(iris)
typeof(iris)
nrow(iris)
is.data.frame(iris)

y<-c(22,33,44)


#####write
?write.csv()
write.csv("")

a<-c("a1","a2","a3","a4")
ax<-c("a1","a2")
setdiff(a,ax)
temp<- as.data.frame(install.packages())
avector<-c(1,2,3,4)
typeof(avector)
second<-avector[2]
names(avector) <- c("first", "second", "third", "fourth")
second <- avector["second"]

avector
avector[2] <- 22
avector

my.lst <- list(34453,c("khasha","Dehnad"),c(14,3,12,15,19))
my.lst[2]
typeof(my.lst[2])

my.lst[2]
my.lst3<-my.lst[[2]]
typeof(my.lst3)
is.vector(my.lst3)
my.lst3[1]

my.lst
str(my.lst)

is.list(my.lst[2])
my.lst
element2<-my.lst[[2]]
is.list(element2)
is.vector(element2)
ln<-my.lst[[2]][2]



data()
data(iris)
View(iris)
iris[5,4]
iris[,-3]
iris[-3,]
iriris[c(13,5,10),c(5,2,4)]

tridcol_allrows<-iris[,-3]
iris[3,]

subset4<-iris[c(T,F,F,F),]





