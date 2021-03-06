# Big Data Analysis Final Project
# About Typhoon and Earthquake

# Library Import
#library(RCurl)
#library(rvest)
#library(tibble) #http://blog.fens.me/r-tibble/
library(xml2)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(purrr)
library(plotly) #3d plot drawing


# Web Crawling (Typhoon) >> NOT WORKING

# Data Import (Typhoon, Earthquake)
#https://rdc28.cwb.gov.tw/TDB/public/warning_typhoon_list/
typhoon_all <- read.csv("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/typhoon/typhoon_web_table.csv",stringsAsFactors = F)
xml_url_base <- paste("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/earthquake/CWB-EQ-Catalog-%d","xml",sep = ".")
sea_level <- read_xml("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/sea/sea_level.xml")
sea_temp <- read_xml("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/sea/sea_temp.xml")
eq1990 <- read_xml("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/earthquake/CWB-EQ-Catalog-1990.xml", Encoding = "utf-8")
#a <- as.list(xml_text(xml_find_all(eq1990,".//phaseNumber")))
#b <- as.list(xml_text(xml_find_all(eq1990,".//originTime")))
#eq1990 %>% xml_child() %>% map(xml_find_all, ".//phaseNumber") %>% map_if(is_empty, ~{.eq1990 <- NA})




location <- xml_find_all(sea_temp, './/LocationName')


eqinfo <- xml_find_all(eq1990, ".//earthquakeinfo")


if (1 < 0){
  SiteId = xml_text(xml_find_all(sea_level_info, ".//SiteId")),
  ItemNameA = xml_text(xml_find_all(sea_level_info, ".//ItemName")),
  ItemValueA = xml_text(xml_find_all(sea_level_info, ".//ItemValue")),
  ItemUnitA = xml_text(xml_find_all(sea_level_info, ".//ItemUnit")),
  ItemNameB = xml_text(xml_find_all(sea_level_info, "./ItemName")),
  ItemValueB = xml_text(xml_find_all(sea_level_info, "./ItemValue")),
  ItemUnitB = xml_text(xml_find_all(sea_level_info, "./ItemUnit")),
  ItemNameC = xml_text(xml_find_all(sea_level_info, "./ItemName")),
  ItemValueC = xml_text(xml_find_all(sea_level_info, "./ItemValue")),
  ItemUnitC = xml_text(xml_find_all(sea_level_info, ".//ItemUnit")),
}

#https://www.youtube.com/watch?v=82s8KdZt5v8
# Transfer many xml files to data frame
map_df(1990:2018, function(i){
  xml_url <- read_xml(sprintf(xml_url_base,i))
  eqinfo <- xml_find_all(xml_url, ".//earthquakeinfo")
  
  #tibble::tibble
  data.frame(originTime = xml_text(xml_find_first(eqinfo, ".//originTime")),
             epicenterLon = xml_text(xml_find_first(eqinfo, ".//epicenterLon")),
             epicenterLat = xml_text(xml_find_first(eqinfo, ".//epicenterLat")),
             depth = xml_text(xml_find_first(eqinfo, ".//depth")),
             magnitudeValue = xml_text(xml_find_first(eqinfo, ".//magnitudeValue")),
             #stationNumber = xml_text(xml_find_first(eqinfo, ".//stationNumber")),
             #phaseNumber = xml_text(xml_find_first(eqinfo, "./phaseNumber")),
             #minimumDistance = xml_text(xml_find_first(eqinfo, "./minimumDistance")),
             gap = xml_text(xml_find_first(eqinfo, "./gap")),
             rms = xml_text(xml_find_first(eqinfo, "./rms")),
             erh = xml_text(xml_find_first(eqinfo, "./erh")),
             erz = xml_text(xml_find_first(eqinfo, "./erz")),
             quality = xml_text(xml_find_first(eqinfo, "./quality")),
             #reviewStatus = xml_text(xml_find_first(eqinfo, "./reviewStatus")),
             
             stringsAsFactors = FALSE   #doesnt have this parameter in tibble
  ) #end of data.frame
}) -> eq_df




# Data pre-Filter
typhoon <- filter(typhoon_all, Year >= 1990)


# Data Retyping
# Typhoon
typhoon$Year <- as.character(typhoon$Year)
typhoon$Alarm_Start <- as.Date(typhoon$Alarm_Start)
typhoon$Alarm_End <- as.Date(typhoon$Alarm_End)
typhoon$Min_Pressure_NT <- as.numeric(typhoon$Min_Pressure_NT)
typhoon$Max_Wind_Speed_NT <- as.numeric(typhoon$Max_Wind_Speed_NT)
typhoon$Level.7_Storm_Radius_NT <- as.numeric(typhoon$Level.7_Storm_Radius_NT)
typhoon$Level.10_Storm_Radius_NT <- as.numeric(typhoon$Level.10_Storm_Radius_NT)
typhoon$Alarm_Counts <- as.numeric(typhoon$Alarm_Counts)

typhoon_all$Year <- as.character(typhoon_all$Year)
typhoon_all$Alarm_Start <- as.Date(typhoon_all$Alarm_Start)
typhoon_all$Alarm_End <- as.Date(typhoon_all$Alarm_End)
typhoon_all$Min_Pressure_NT <- as.numeric(typhoon_all$Min_Pressure_NT)
typhoon_all$Max_Wind_Speed_NT <- as.numeric(typhoon_all$Max_Wind_Speed_NT)
typhoon_all$Level.7_Storm_Radius_NT <- as.numeric(typhoon_all$Level.7_Storm_Radius_NT)
typhoon_all$Level.10_Storm_Radius_NT <- as.numeric(typhoon_all$Level.10_Storm_Radius_NT)
typhoon_all$Alarm_Counts <- as.numeric(typhoon_all$Alarm_Counts)
# Date format : https://www.stat.berkeley.edu/~s133/dates.html

# Earthquake
eq_df$originTime <- as.Date(eq_df$originTime)
eq_df$epicenterLon <- as.numeric(eq_df$epicenterLon)
eq_df$epicenterLat <- as.numeric(eq_df$epicenterLat)
eq_df$depth <- as.numeric(eq_df$depth)
eq_df$magnitudeValue <- as.numeric(eq_df$magnitudeValue)
eq_df$gap <- as.numeric(eq_df$gap)
eq_df$rms <- as.numeric(eq_df$rms)
eq_df$erh <- as.numeric(eq_df$erh)
eq_df$erz <- as.numeric(eq_df$erz)




# replace `NA` to `0`
# https://bbs.pinggu.org/thread-3589221-1-1.html
#dat[is.na(dat)] <- 0
typhoon_all[is.na(typhoon_all)] <- 0
typhoon[is.na(typhoon)] <- 0



# Data Filter
eq_df_1990_05 <- eq_df %>% filter(between(originTime, as.Date("1990-05-01"),as.Date("1990-05-31")))
eq_df_2018_07 <- eq_df %>% filter(between(originTime, as.Date("2018-07-01"),as.Date("2018-07-31")))
eq_df_2018 <- eq_df %>% filter(between(originTime, as.Date("2018-01-01"),as.Date("2018-12-31")))
eq_df_2017 <- eq_df %>% filter(between(originTime, as.Date("2017-01-01"),as.Date("2017-12-31")))



# Plot Drawing
#theme_set(theme_bw()) # Change the theme to my preference
# Earthquake

plot_ly(x = eq_df$magnitudeValue, type = 'histogram')# 芮氏規模統計
plot_ly(x = eq_df$gap, type = 'histogram')
ggplot(data = eq_df_2018_07, aes(x = originTime, y = magnitudeValue)) + geom_point()
ggplot(data = typhoon, aes(x = Min_Pressure_NT, y = Max_Wind_Speed_NT)) + geom_point(shape=1) + geom_smooth(method=lm)
ggplot(data = typhoon, aes(x = Level.7_Storm_Radius_NT, y = Level.10_Storm_Radius_NT)) + geom_point()
ggplot(data = typhoon_all, aes(x = Level.10_Storm_Radius_NT, y = Alarm_Counts)) + geom_point()

plot_ly (x = ~typhoon$Level.7_Storm_Radius_NT,  y = ~typhoon$Level.10_Storm_Radius_NT,  type = 'scatter' , mode = 'markers', color = ~typhoon$Level)
plot_ly (x = ~typhoon$Level.10_Storm_Radius_NT,  y = ~typhoon$Alarm_Counts,  type = 'scatter' , mode = 'markers', color = ~typhoon$Level)
plot_ly (x = ~typhoon$Min_Pressure_NT,  y = ~typhoon$Max_Wind_Speed_NT,  type = 'scatter' , mode = 'markers', color = ~typhoon$Level)
typhoon_all %>% filter(Min_Pressure_NT > 0) %>% plot_ly(x = ~.$Max_Wind_Speed_NT, y = ~.$Min_Pressure_NT, type = 'scatter', mode = 'markers', color = .$Level)
typhoon %>% plot_ly (x = ~.$Level.10_Storm_Radius_NT, y = ~.$Level.7_Storm_Radius_NT ,z = ~.$Alarm_Counts,  type = 'scatter3d' , mode = 'markers', color = ~.$Level)
ggplotly(ggplot(data = typhoon, aes(x = Min_Pressure_NT, y = Max_Wind_Speed_NT)) + geom_point(shape=1) + geom_smooth(method=lm))


plot_ly(x = ~eq_df_2018_07$depth,  y = ~eq_df_2018_07$magnitudeValue,  type = 'scatter' , mode = 'markers')
plot_ly(x = ~eq_df_2018_07$epicenterLon, y = ~eq_df_2018_07$epicenterLat, z = ~eq_df_2018_07$depth,  type = 'scatter3d' , mode = 'markers' )

plot_ly(x = ~eq_df_2018_07$erh, y = ~eq_df_2018_07$erz, z = ~eq_df_2018_07$rms,  type = 'scatter3d' , mode = 'markers')
plot_ly(x = ~eq_df_2018$erh,  y = ~eq_df_2018$originTime,  type = 'scatter' , mode = 'markers')
plot_ly(x = ~eq_df_2017$erh,  y = ~eq_df_2017$originTime,  type = 'scatter' , mode = 'markers')
plot_ly(x = ~eq_df_2017$rms,  y = ~eq_df_2017$originTime,  type = 'scatter' , mode = 'markers')
plot_ly(x = ~eq_df_2017$erh,  y = ~eq_df_2017$erz,  type = 'scatter' , mode = 'markers')




#plot_ly(x = ~sub_level_temp$lat, y = ~sub_level_temp$lon, z = ~sub_level_temp$MeanSeaLevel, type = 'scatter3d', mode = 'markers', marker=list(
#  size=seq(0, 39), color=seq(-120, 50), colorbar=list( title='Colorbar'),
#  colorscale='Viridis',
#  reversescale =T))



### 假設問題

plot_ly(x = ~typhoon$Level.7_Storm_Radius_NT, y = ~typhoon$Level.10_Storm_Radius_NT, type = 'scatter', mode = 'markers')



eq_df$Year %>% substring(.$originTime, 1,7)

eq_level_temp_typhoon %>% filter(.$Level.7_Storm_Radius_NT >= 0 & .$Level.10_Storm_Radius_NT >= 0) %>% ggplot(aes(x = Level.7_Storm_Radius_NT, y = Level.10_Storm_Radius_NT)) + geom_point() + geom_smooth()




# Problems & Solutions
# 1. cannot get the table data from website "https://rdc28.cwb.gov.tw/TDB/public/warning_typhoon_list/"
# Solution: Manually copy and paste to `Numbers` then export to `csv` file
# 2. reading the nodes in `xml`
# Solution : Read the root node of each record first, then use `xml_find_first` & `xml_find_all`
# If take `xml_find_all` without reading the root node of each record, will get wrong value
# 3. rstudio console is displayed with the system default language
# Solution : 
# https://stackoverflow.com/questions/56503222/how-to-data-frame-with-different-number-of-rows-but-related-not-by/56511335#56511335
# 4. rstudio variable issue: after running some `retyping` code, the attribute of data frame disappeared
