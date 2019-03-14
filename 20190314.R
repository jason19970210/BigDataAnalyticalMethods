1:6 + 3:5
# will run as 1,2,3,4,5,6 + 3,4,5,3,4,5
# result will be 4  6  8  7  9 11

# iris$Time <- 1
# iris$Sepal.Length[5] <- 5.0
# iris$Sepal.Length
# round(iris$Petal.Width)
# signif() or round(,-n)
iris$Petal.Width[c(1:75) * 2]
iris$Petal.Width[c(1:nrow(iris)/2) * 2] # not working
iris$Petal.Width[seq(2,length(iris$Petal.Width),2)]
iris$Petal.Width[c(F,T)] # make first element as FALSE, take the second element cause we make it TRUE, then goes loop
#
iris$Price <- sample(199, nrow(iris),replace = TRUE) # while replace = FALSE, the random number will only appear once
table(iris$Price)
colnames(iris[4]) <- "PW"
names(colnames(iris[4])) <- "PW"
View(iris)
# Capital 'V'iew
# Check list `iris`

b <- seq(2,20,2)
8 %% -3 #餘數
8 %/% -3  #integr division

b[c(5,6,7)]
b[5:7] # equals to b[c(5:7)
# get 5th to 7th element


listSample <- list(Students=c("Tom","Kobe","Emma"), 
                   Year=2017, 
                   Score=c(60,50,80,40), 
                   School="CGU")
listSample$Score # equals to listSample[["Score"]]
listSample[[3]]

listSample$School <- "CGUST"
listSample$Semester <- "上學期"
listSample <- c(listSample, Semester = "Up")
listSample <- list(Students=c("Tom","Kobe","Emma"), 
                   Year=2017, 
                   Score=c(60,50,80,40), 
                   School="CGUST",
                   Semester="Up"
                   )


airquality
table(airquality$Month)
