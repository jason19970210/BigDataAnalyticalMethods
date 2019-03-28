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



# `...` 是一個傳值變數

score <- 80
if (score < 60){
  print("回家洗洗睡再戰下學年")
} else if (score == 60 | score < 75){
  print("低空飛過")
} else if (score == 75 | score < 90){
  print("普通")
} else {
  print("挑戰學霸")
}

iris$Type <- ifelse(iris$Sepal.Length > 5.5, "長" , "短")



for (i in seq(1,20,2)){
  if (i == 13){
  } else {
    print(i)
  }
}

USArrests
mur <- USArrests$Murder
ass <- USArrests$Assault
urb <- USArrests$UrbanPop

USArrests$QOL <- ifelse(mur > 10, "不宜人居", ifelse(ass > 100, "要非常小心", ifelse(urb > 70, "很擠", "可以住")))

table(USArrests$QOL)


library(jsonlite)
#library(rjson)
library(RCurl)
library(httr)
#BikeAPIData<-fromJSON("http://data.tycg.gov.tw/api/v1/rest/datastore/a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f?format=json")
#str(BikeAPIData)
#BikeAPIDataDF <- data.frame(BikeAPIData$result$records)

#taipeiWork <- fromJSON("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=201d8ae8-dffc-4d17-ae1f-e58d8a95b162")
#str(taipeiWork)
#nrow(taipeiWork$result$results)

library(rvest)
library(magrittr)
ppturl = "https://www.ptt.cc/bbs/Tech_Job/index.html"
esliteurl = "http://www.eslite.com/lowest_list.aspx?cate=156"
bookurl = "https://activity.books.com.tw/books66/?loc=activity_BK_001"

ppthtmlContent <- read_html(ppturl)
esliteContent <- read_html(esliteurl)
bookContent <- read_html(bookurl)

#xpath <- "/html/body/div[2]/div[2]/div[4]/div[2]/a"
#xpath1 <- "/html[1]/body[1]/div[2]/div[2]/div[*]/div[2]/a[1]"
#Google Chrome Extension > SelectorGadget

#titlePath <- ".title a"
#titles <- elitehtmlContent %>% html_nodes(".title a") %>% html_text()
#titles1 <- bookContent %>% html_nodes(xpath = "//body/div[@class='container_24 clearfix']/div[@class='grid_24']/div[@id='content-fixed']/div[5]/div[1]/div[1]/div[2]/ul[1]/li[1]") %>% html_text()
titles2 <- bookContent %>% html_nodes(xpath = "	//ul[@class='price clearfix']//b[contains(text(),'')]") %>% html_text()
titles2
titles_eslite <- esliteContent %>% html_nodes("h3 a") %>% html_text()
titles_eslite

titles_book <- bookContent %>% html_nodes("h4 a") %>% html_text()
titles_price_count <- bookContent %>% html_nodes("#content-fixed div .clearfix li:nth-child(1)") %>% html_text()
titles_price_count
titles1

xpathtest <- ppthtmlContent %>% html_nodes(xpath = "/html[1]/body[1]/div[2]/div[2]/div[*]/div[2]/a[1]") %>% html_text()
xpathtest <- ppthtmlContent %>% html_nodes(xpath = "//a[contains(.,'')]") %>% html_text()
xpathtest
