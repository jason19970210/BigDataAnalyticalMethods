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
dacrdurl = "https://www.dcard.tw/f/cgu"

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



library(rvest)
library(stringr)
DCardCGU<-"https://www.dcard.tw/f/cgu"
#DCardContent<-read_html(DCardCGU, encoding = "UTF-8")
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% html_nodes(".PostEntry_unread_2U217-") %>% html_text()
#post_contentShort<- DCardContent %>% html_nodes(".PostEntry_reply_1oU-6z") %>% html_text()
post_author<- DCardContent %>% html_nodes(".PostAuthor_root_3vAJfe") %>% html_text()
#post_comment<- DCardContent %>% html_nodes(".PostEntry_comments_2iY8V3") %>% html_text()
post_like<- DCardContent %>% html_nodes(".hlvyVg") %>% html_text()
#post_url <- DCardContent %>% html_nodes(".PostEntry_entry_2rsgm") %>% html_attr("href")
post_title<-gsub("[^[:alnum:]///' ]", "", post_title)
#DCardCGU_posts <- data.frame(title = post_title, author=post_author, 
#                             commentN=post_comment, likeN=post_like)
#stringsAsFactors = F
#data.frame(column_name = 變數)
DCardCGU_posts <- data.frame(title = post_title, author=post_author, likeN=post_like, stringsAsFactors = F)
#DCardCGU_posts <- data.frame(title = post_title, author=post_author, likeN=post_like)
#for writing document preview
#knitr::kable(DCardCGU_posts)
#check column class
str(DCardCGU_posts)
class(DCardCGU_posts$likeN)
DCardCGU_posts$likeN <- as.numeric(DCardCGU_posts$likeN)
str(DCardCGU_posts)

library(rvest)
library(purrr)
ppturl_n <- paste0("https://www.ptt.cc/bbs/Tech_Job/index",n,".html")
#ppturl_n <- paste0("https://www.ptt.cc/bbs/Tech_Job/index",3390:3400,".html")
ppturl_n
ppturl = "https://www.ptt.cc/bbs/Tech_Job/index.html"
n <- 3390:3400
#title1 <- read_html(ppturl_n[1]) %>% html_nodes(".title a") %>% html_text()

#newPage

titleAll <- c()
for (url in ppturl_n){
  title1 <- read_html(url) %>% html_nodes(".title a") %>% html_text()
  titleAll <- c(titleAll, title1)
}
x <- c()
place <- grep("面試",titleAll)
for (a in place){
  print(titleAll[a])
  x <- c(x,titleAll[a])
}
#ppthtmlContent <- read_html(ppturl_n)

titleall <- c()
function_get_ppt_title <- function (url) {
  title2 <- read_html(url) %>% html_nodes(".title a") %>% html_text()
  #titleall <- c(titleall, title2)
  title2
  #return(titleall)
}

function_get_ppt_title("https://www.ptt.cc/bbs/Tech_Job/index.html")
xx <- map(ppturl_n,function_get_ppt_title)





#Ref: https://github.com/soodoku/tuber
#Ref: find functions from http://soodoku.github.io/tuber/reference/index.html
#install.packages("devtools")
#devtools::install_github("soodoku/tuber")
library(tuber)
#console.cloud.google.com
#new a project and create oauth authorization key, active `Youtube Data API`
clientID <- "101641719226-h9jl88pveeht1t6gb1i92ghkbsdvaeh3.apps.googleusercontent.com"
clientKey <- "MQPsNf1PvLKICptIFT8GH1-w"
yt_oauth(clientID,clientKey,token="")
#auth failed may be cause by "httpuv" package
#$ install.packages("Rfacebook")
#or direct install `httpuv`
#$ install.packages("httpuv")

#set using method to `OTHER` instead of `WebClient`
#then it will be fine
#set redirect url inoAuth tag page from console.cloud.google.com where the project saved
#add following lines into redirect url
#http://localhost:1410/
#http://localhost/authorize/


stat <- get_stats(video_id = "wki0BqlztCo")
data.frame(stat)
detail <- get_video_details(video_id = "wki0BqlztCo")
str(detail$items[[1]]$snippet)
channelStat <- get_channel_stats(channel_id = "UCBa5G_ESCn8Yd4vw5U-gIcg")
data.frame(channelStat)


#===========================================
#https://www.r-bloggers.com/using-the-tuber-package-to-analyse-a-youtube-channel/
library(tuber)
library(tidyverse)
library(lubridate)
library(stringi)
library(wordcloud)
library(gridExtra)

#httr::set_config( config( ssl_verifypeer = 0L ) ) # = Fixes some certificate problems on linux = #

# = Autentication = #
clientID <- "101641719226-h9jl88pveeht1t6gb1i92ghkbsdvaeh3.apps.googleusercontent.com"
clientKey <- "MQPsNf1PvLKICptIFT8GH1-w"
yt_oauth(clientID,clientKey,token="")

# = Download and prepare data = #

# = Channel stats = #
chstat = get_channel_stats("UCbZRdTukTCjFan4onn04sDA")

# = Videos = #
videos = yt_search(term="", type="video", channel_id = "UCbZRdTukTCjFan4onn04sDA")
videos = videos %>%
  mutate(date = as.Date(publishedAt)) %>%
  filter(date > "2016-01-01") %>%
  arrange(date)

# = Comments = #
comments = lapply(as.character(videos$video_id), function(x){
  get_comment_threads(c(video_id = x), max_results = 1000)
})

# = Prep the data = #
# = Video Stat Table = #
videostats = lapply(as.character(videos$video_id), function(x){
  get_stats(video_id = x)
})
videostats = do.call(rbind.data.frame, videostats)
videostats$title = videos$title
videostats$date = videos$date
videostats = select(videostats, date, title, viewCount, likeCount, dislikeCount, commentCount) %>%
  as.tibble() %>%
  mutate(viewCount = as.numeric(as.character(viewCount)),
         likeCount = as.numeric(as.character(likeCount)),
         dislikeCount = as.numeric(as.character(dislikeCount)),
         commentCount = as.numeric(as.character(commentCount)))

# = General Stat Table = #
genstat = data.frame(Channel="Dan Vasc", Subcriptions=chstat$statistics$subscriberCount,
                     Views = chstat$statistics$viewCount,
                     Videos = chstat$statistics$videoCount, Likes = sum(videostats$likeCount),
                     Dislikes = sum(videostats$dislikeCount), Comments = sum(videostats$commentCount))

# = videostats Plot = #
p1 = ggplot(data = videostats[-1, ]) + geom_point(aes(x = viewCount, y = likeCount))
p2 = ggplot(data = videostats[-1, ]) + geom_point(aes(x = viewCount, y = dislikeCount))
p3 = ggplot(data = videostats[-1, ]) + geom_point(aes(x = viewCount, y = commentCount))
grid.arrange(p1, p2, p3, ncol = 2)

# = Comments TS = #
comments_ts = lapply(comments, function(x){
  as.Date(x$publishedAt)
})
comments_ts = tibble(date = as.Date(Reduce(c, comments_ts))) %>%
  group_by(date) %>% count()
ggplot(data = comments_ts) + geom_line(aes(x = date, y = n)) +
  geom_smooth(aes(x = date, y = n), se = FALSE) + ggtitle("Comments by day")+
  geom_vline(xintercept = as.numeric(as.Date("2017-11-08")), linetype = 2,color = "red")+
  geom_vline(xintercept = as.numeric(as.Date("2017-04-28")), linetype = 2,color = "red")

# = coments by video = #
selected = (nrow(videostats) - 3):nrow(videostats)
top4 = videostats$title[selected]
top4comments = comments[selected]

p = list()
for(i in 1:4){
  df = top4comments[[i]]
  df$date = as.Date(df$publishedAt)
  df = df %>%
    arrange(date) %>%
    group_by(year(date), month(date), day(date)) %>%
    count()
  df$date = make_date(df$`year(date)`, df$`month(date)`,df$`day(date)`)
  p[[i]] = ggplot(data=df) + geom_line(aes(x = date, y = n)) + ggtitle(top4[i])
}
do.call(grid.arrange,p)

## = WordClouds = ##
comments_text = lapply(comments,function(x){
  as.character(x$textOriginal)
})
comments_text = tibble(text = Reduce(c, comments_text)) %>%
  mutate(text = stri_trans_general(tolower(text), "Latin-ASCII"))
remove = c("you","the","que","and","your","muito","this","that","are","for","cara",
           "from","very","like","have","voce","man","one","nao","com","with","mais",
           "was","can","uma","but","ficou","meu","really","seu","would","sua","more",
           "it's","it","is","all","i'm","mas","como","just","make","what","esse","how",
           "por","favor","sempre","time","esta","every","para","i've","tem","will",
           "you're","essa","not","faz","pelo","than","about","acho","isso",
           "way","also","aqui","been","out","say","should","when","did","mesmo",
           "minha","next","cha","pra","sei","sure","too","das","fazer","made",
           "quando","ver","cada","here","need","ter","don't","este","has","tambem",
           "una","want","ate","can't","could","dia","fiquei","num","seus","tinha","vez",
           "ainda","any","dos","even","get","must","other","sem","vai","agora","desde",
           "dessa","fez","many","most","tao","then","tudo","vou","ficaria","foi","pela",
           "see","teu","those","were")
words = tibble(word = Reduce(c, stri_extract_all_words(comments_text$text))) %>%
  group_by(word) %>% count() %>% arrange(desc(n)) %>% filter(nchar(word) >= 3) %>%
  filter(n > 10 & word %in% remove == FALSE) 

set.seed(3)
wordcloud(words$word, words$n, random.order = FALSE, random.color = TRUE,
          rot.per = 0.3, colors = 1:nrow(words))

#============================================


library(RCurl)
library(httr)
library(rvest)
uniqlourl = "http://www.uniqlo.com/tw/store/list/limited-offer/men/"

uniqlohtmlContent <- read_html(uniqlourl)

product_name <- uniqlohtmlContent %>% html_nodes(".name a") %>% html_text()
product_price <- uniqlohtmlContent %>% html_nodes(".price") %>% html_text()
product_url <- uniqlohtmlContent %>% html_nodes(".name a") %>% html_attr("href")
#gsub(欲替換掉字串, 欲替換成, 參數)
gsub(" |\n", "", product_price)
uniqlodf<-data.frame(product_name,product_price,product_url)
nrow(uniqlodf)


#from mac using `xml2` package instead of using `XML` package
library(xml2)
openDataUrl <- "http://gis.taiwan.net.tw/XMLReleaseALL_public/scenic_spot_C_f.xml"
openDataUrlContent <- read_xml(openDataUrl)
# name <- openDataUrlContent %>% xml_find_all(openDataUrlContent, ".//Name") %>% xml_text()
name <- xml_find_all(openDataUrlContent, ".//Name")
name_text <- xml_text(name)
orgclass <- xml_find_all(openDataUrlContent, ".//Orgclass")
orgclass_text <- xml_text(orgclass)
add <- xml_find_all(openDataUrlContent, ".//Add")
add_text <- xml_text(add)
opentime <- xml_find_all(openDataUrlContent, ".//Opentime")
opentime_text <- xml_text(opentime)
opendata_df <- data.frame(name=name_text,orgclass=orgclass_text,add=add_text,opentime=opentime_text)
table(opendata_df$orgclass_text)



#做子集的三種方法：[ ]、$、subset
#做子集時的篩選條件輸入：放布林、放名稱、放index


library(jsonlite)
json_url <- "http://data.tycg.gov.tw/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f?format=json"
json <- fromJSON(json_url)
park_df <- json$result$records
park_place <- json$result$records$parkName
select_park <- grep("公園", park_df$parkName)
#for (i in select_park){
#  print(park_place[i])
#  print(json$result$records[i])
#}
aa <- park_df[select_park,]


library(dplyr)
edu_origin <- read.csv("http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=7DD5CC42-4EFA-4AFD-9004-AF576CB2B337",stringsAsFactors = F)
pop_origin <- read.csv("http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=46D0FA91-0159-47B9-BA49-D158F5FD4443",stringsAsFactors = F)

edu <- edu_origin[2:nrow(edu_origin),]
pop <- pop_origin[2:nrow(pop_origin),]


edu_pop <- inner_join(pop,edu,by=c( "site_id", "village" = "village." ))

edu_pop$birthrate <- as.integer(edu_pop$birth_total) / as.integer(edu_pop$edu_age_15up_total)
edu_pop <- edu_pop[order(edu_pop$birthrate, decreasing=TRUE),]


library(tidyr)
#edu_origin <- read.csv("http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=7DD5CC42-4EFA-4AFD-9004-AF576CB2B337",stringsAsFactors = F)
#edu <- edu_origin[2:nrow(edu_origin),]
# delete total colume
edu_new <- edu[-5]
edu_gather <- gather(edu_new, key = Class, value = Value, -statistic_yyy, -district_code, -site_id, -village.)

library(tidyr)
AType <- read.csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/HEPATITIS_A_Cases.csv", stringsAsFactors = F)
AType_gather <- gather(AType, key = State, value = Value, -YEAR, -WEEK)
AType_gather$Value <- as.integer(AType_gather$Value)
# get non na value
AType_gather <- AType_gather[!is.na(AType_gather$Value),]
str(AType_gather)


# 2019.05.16
# rtestfinal <- strsplit(rtest, "[\n|\t|\r]+")
# rtestfianl.1 <- mpa.

library(SportsAnalytics)
library(data.table)
NBA1819<-fetch_NBAPlayerStatistics("18-19")
NBA1819DT<-data.table(NBA1819)
# 2 Methods
# NBA1819<-fetch_NBAPlayerStatistics("18-19") %>% as.data.table()
# NBA1819DT<-data.table(fetch_NBAPlayerStatistics("18-19"))
NBA1819DT[TotalPoints>2000, .N]# in dplyr will be using n() to return the nunber of filter result
# Output
# [1] 6
NBA1819DT[TotalPoints>2000,.(meanSteals = mean(Steals),
                             meanTotalRebounds = mean(TotalRebounds))]

library(dplyr)
filter(NBA1819, TotalPoints>2000) %>% summarise(n(), # or use `nPlayers = n()`
                                                meanSteals=mean(Steals),
                                                meanTotalRebounds=mean(TotalRebounds))

NBA1819DT[GamesPlayed > 50, .(meanSteals = mean(Steals),
                              meanTotalRebounds = mean(TotalRebounds)), by = Position]

group_by(NBA1819,Position) %>% filter(GamesPlayed > 50)  %>% summarise(meanSteals=mean(Steals),
                                     meanTotalRebounds=mean(TotalRebounds))

length(NBA1819$Team %>% unique())
group_by(NBA1819,Team) %>% arrange(TotalPoints) %>% slice(1)

mtTable<-table(mtcars$cyl,mtcars$am)
mtTable
chisq.test(mtTable) # X-squared = 8.7407, df = 2, p-value = 0.01265
chisq.test(mtTable,simulate.p.value = T)
chisq.test(mtTable, set.seed(1234))
fisher.test(mtTable) # p-value = 0.009105, alternative hypothesis: two.sided



#======================================


#library(jsonlite)
library(dplyr)
library(stringr)
library(ggplot2)

edu_103_full <- read.csv("/Users/macbook/Desktop/三下/107bigdatacguimhw1-jason19970210/Input/103年各教育程度別初任人員經常性薪資─按大職類分.csv",stringsAsFactors = F)
edu_104_full <- read.csv("/Users/macbook/Desktop/三下/107bigdatacguimhw1-jason19970210/Input/104年各教育程度別初任人員經常性薪資─按大職類分.csv",stringsAsFactors = F)
edu_105_full <- read.csv("/Users/macbook/Desktop/三下/107bigdatacguimhw1-jason19970210/Input/105年各教育程度別初任人員每人每月經常性薪資─按大職類分.csv",stringsAsFactors = F)
edu_106_full <- read.csv("/Users/macbook/Desktop/三下/107bigdatacguimhw1-jason19970210/Input/106年各教育程度別初任人員每人每月經常性薪資─按大職類分.csv",stringsAsFactors = F)

# 大學薪資
join_103_106 <- inner_join(edu_103_full, edu_106_full, by="大職業別")
#取`大學薪資`欄位
join_103_106$大學.薪資.x <- as.numeric(join_103_106$大學.薪資.x)
join_103_106$大學.薪資.y <- as.numeric(join_103_106$大學.薪資.y)
join_103_106$percent <- (join_103_106$大學.薪資.y / join_103_106$大學.薪資.x)

join_103_106 <- arrange(join_103_106,desc(percent))
filter_105 <- filter(join_103_106 , percent > 1.05)
head(filter_105, 10)
career <- as.character(filter_105$大職業別) # 提高超過5%的的職業有哪些(5分)
tmp <- strsplit(career, "-") # by library(stringr)
#tmp <- unlist(tmp, use.names=F)
tmp[[1]][1]
table(unlist(lapply(tmp, "[", 1)))
grep("不動產",tmp)
#sum(str_count(join_103_106$大職業別,"-")) # `-` 數量

# How to create a data frame
# https://dzone.com/articles/learn-r-how-create-data-frames


df_103 <- edu_103_full[,c(2,12)]
df_104 <- edu_104_full[,c(2,12)]
df_105 <- edu_105_full[,c(2,12)]
df_106 <- edu_106_full[,c(2,12)]
joined_df_103_to_106 <- inner_join(df_103, df_104, by="大職業別")
joined_df_103_to_106 <- inner_join(joined_df_103_to_106, df_105, by="大職業別")
joined_df_103_to_106 <- inner_join(joined_df_103_to_106, df_106, by="大職業別")

# ===
# re-order the data frame
# example : `data <- data[c(1,3,2)]`
#joined_df_103_to_106 <- joined_df_103_to_106[c(2,1,3,4,5,6,7,8,9)]

# rename column names
# http://rprogramming.net/rename-columns-in-r/
# names(data) <- c("new_name", "another_new_name")
names(joined_df_103_to_106) <- c("大職業別","College_f_m_103","College_f_m_104","College_f_m_105","College_f_m_106")
#joined_df_103_to_106[2:5] <- as.numeric(joined_df_103_to_106[2:5])
joined_df_103_to_106$`College_f_m_103` <- as.numeric(joined_df_103_to_106$`College_f_m_103`)
joined_df_103_to_106$`College_f_m_104` <- as.numeric(joined_df_103_to_106$`College_f_m_104`)
joined_df_103_to_106$`College_f_m_105` <- as.numeric(joined_df_103_to_106$`College_f_m_105`)
joined_df_103_to_106$`College_f_m_106` <- as.numeric(joined_df_103_to_106$`College_f_m_106`)

# replace `NA` to `0`
# https://bbs.pinggu.org/thread-3589221-1-1.html
#dat[is.na(dat)] <- 0
joined_df_103_to_106[is.na(joined_df_103_to_106)] <- 0

# order the table
joined_df_103_to_106 <- arrange(joined_df_103_to_106,desc(College_f_m_103))



# histogram 直方圖 > 一維資料(x=連續變量,y=usually be count or frequency)
# bar chart 長條圖 > 二維資料(x=類別變量,y=連續變量)


qplot(data = NBA1819DT, x=NBA1819DT$Steals,y=NBA1819DT$TotalRebounds)
ggplot(data = NBA1819DT, mapping=aes(x=Steals,y=TotalRebounds))+geom_point()+geom_smooth()
cor(NBA1819DT$Steals,NBA1819DT$TotalRebounds) #計算相關係數
# cor value > 0.8 : 高度相關
# cor value < 0.3 : 低度相關
# [1] 0.678612


company_register <- read.csv("http://data.gcis.nat.gov.tw/od/file?oid=9D63D882-9B21-4FAA-9A10-2D5E0D938A47")
company_register <- company_register[-c(1,2), ]
cor1 <- cor(company_register$總計家數,company_register$總計資本額)
plot <- ggplot(company_register, mapping = aes(總計家數, 總計資本額))+geom_point()+geom_smooth()+theme(text=element_text(family="PingFang TC Light", size=14))
plot + annotate("text", x = 60000, y = 6000000, label = paste("r = ", cor1))

library(jsonlite)
animal_data <- fromJSON("http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx")
animal_group <- group_by(animal_data,shelter_name,animal_kind)
num <- summarise(animal_group, num = n())
plot <- ggplot(num, aes(shelter_name,num))+geom_bar(stat = "identity")
plot + coord_flip() + theme_set(theme_bw()) + theme(text=element_text(family="PingFang TC Light", size=6),axis.text.x = element_text(angle = 90, hjust = 1)) + facet_grid(animal_kind~.)

#======================


library(ggplot2)
car_103_full <- read.csv("/Users/macbook/Desktop/三下/107bigdatacguimhw1-jason19970210/Input/103年各職類別初任人員經常性薪資－按行業別分.csv",stringsAsFactors = F)
car_104_full <- read.csv("/Users/macbook/Desktop/三下/107bigdatacguimhw1-jason19970210/Input/104年各職類別初任人員經常性薪資－按行業別分.csv",stringsAsFactors = F)
car_105_full <- read.csv("/Users/macbook/Desktop/三下/107bigdatacguimhw1-jason19970210/Input/105年各職類別初任人員每人每月經常性薪資－按行業別分.csv",stringsAsFactors = F)
car_106_full <- read.csv("/Users/macbook/Desktop/三下/107bigdatacguimhw1-jason19970210/Input/106年各職類別初任人員每人每月經常性薪資－按行業別分.csv",stringsAsFactors = F)

car_103 <- filter(car_103_full,行業別 %in% c("資訊及通訊傳播業","企業總管理機構及管理顧問業","電腦系統設計服務業","資料處理及資訊供應服務業","銀行業"))
car_104 <- filter(car_104_full,行業別 %in% c("資訊及通訊傳播業","企業總管理機構及管理顧問業","電腦系統設計服務業","資料處理及資訊供應服務業","銀行業"))
car_105 <- filter(car_105_full,行業別 %in% c("資訊及通訊傳播業","企業總管理機構及管理顧問業","電腦系統設計服務業","資料處理及資訊供應服務業","銀行業"))
car_106 <- filter(car_106_full,行業別 %in% c("資訊及通訊傳播業","企業總管理機構及管理顧問業","電腦系統設計服務業","資料處理及資訊供應服務業","銀行業"))

rbind_car <- rbind(car_103, car_104, car_105, car_106)
for (i in 3:dim(rbind_car)[2]) {
  rbind_car[,i] <- as.numeric(rbind_car[,i])
  rbind_car[,i][is.na(rbind_car[,i])] <- 0
}

rbind_car <- rbind_car[,c(1,2,5)]
ggplot(rbind_car,aes(x=年度,y=專業人員.薪資,color=行業別))+geom_line()+ theme(text=element_text(family="PingFang TC Light", size=6))





