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


# Web Crawling (Typhoon) >> NOT WORKING

# Data Import (Typhoon, Earthquake)
typhoon_all <- read.csv("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/typhoon_web_table.csv",stringsAsFactors = F)
xml_url_base <- paste("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/earthquake/CWB-EQ-Catalog-%d","xml",sep = ".")
#eq1990 <- read_xml("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/earthquake/CWB-EQ-Catalog-1990.xml", Encoding = "utf-8")
#a <- as.list(xml_text(xml_find_all(eq1990,".//phaseNumber")))
#b <- as.list(xml_text(xml_find_all(eq1990,".//originTime")))
#eq1990 %>% xml_child() %>% map(xml_find_all, ".//phaseNumber") %>% map_if(is_empty, ~{.eq1990 <- NA})


map_df(1990:2018, function(i){
  xml_url <- read_xml(sprintf(xml_url_base,i))
  eqinfo <- xml_find_all(xml_url, ".//earthquakeinfo")
  
  #tibble::tibble
  data.frame(originTime = xml_text(xml_find_first(eqinfo, ".//originTime")),
             epicenterLon = xml_text(xml_find_first(eqinfo, ".//epicenterLon")),
             epicenterLat = xml_text(xml_find_first(eqinfo, ".//epicenterLat")),
             depth = xml_text(xml_find_first(eqinfo, ".//depth")),
             magnitudeValue = xml_text(xml_find_first(eqinfo, ".//magnitudeValue")),
             stationNumber = xml_text(xml_find_first(eqinfo, ".//stationNumber")),
             phaseNumber = xml_text(xml_find_first(eqinfo, "./phaseNumber")),
             minimumDistance = xml_text(xml_find_first(eqinfo, "./minimumDistance")),
             gap = xml_text(xml_find_first(eqinfo, "./gap")),
             rms = xml_text(xml_find_first(eqinfo, "./rms")),
             erh = xml_text(xml_find_first(eqinfo, "./erh")),
             erz = xml_text(xml_find_first(eqinfo, "./erz")),
             quality = xml_text(xml_find_first(eqinfo, "./quality")),
             reviewStatus = xml_text(xml_find_first(eqinfo, "./reviewStatus")),
            
             stringsAsFactors = FALSE   #doesnt have this parameter in tibble
  ) #end of data.frame
}) -> eq_df


# Data Filter
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



# replace `NA` to `0`
# https://bbs.pinggu.org/thread-3589221-1-1.html
#dat[is.na(dat)] <- 0
typhoon[is.na(typhoon)] <- 0




# Join the tables


# Problems
# 1. cannot get the table data from website "https://rdc28.cwb.gov.tw/TDB/public/warning_typhoon_list/"
# Solution: Manually copy and paste to `Numbers` then export to `csv` file
# 2. reading the nodes in `xml`
# Solution : Read the root node of each record first, then use `xml_find_first` & `xml_find_all`
# If take `xml_find_all` without reading the root node of each record, will get wrong value