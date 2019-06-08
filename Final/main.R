# Big Data Analysis Final Project
# About Typhoon and Earthquake

# Library Import
#library(RCurl)
#library(rvest)
library(xml2)
#library(dplyr)
library(ggplot2)
library(tidyverse)

# Web Crawling (Typhoon) >> NOT WORKING

# Data Import (Typhoon, Earthquake)
typhoon <- read.csv("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/typhoon_web_table.csv",stringsAsFactors = F)
xml_url_base <- paste("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/earthquake/CWB-EQ-Catalog-%d","xml",sep = ".")
#eq1990 <- read_xml("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/earthquake/CWB-EQ-Catalog-1990.xml", Encoding = "utf-8")
map_df(1990:2018, function(i){
  xml_url <- read_xml(sprintf(xml_url_base,i))
  
  data.frame(originTime = xml_text(xml_find_all(xml_url, ".//originTime")),
             epicenterLon = xml_text(xml_find_all(xml_url, ".//epicenterLon")),
             epicenterLat = xml_text(xml_find_all(xml_url, ".//epicenterLat")),
             depth = xml_text(xml_find_all(xml_url, ".//depth")),
             magnitudeValue = xml_text(xml_find_all(xml_url, ".//magnitudeValue")),
             stationNumber = xml_text(xml_find_all(xml_url, ".//stationNumber")),
             phaseNumber = as.list(xml_text(xml_find_all(xml_url, ".//phaseNumber"))),
             
             stringsAsFactors = FALSE
  )
}) -> eq_df

map_df(1990:2018, function(i){
  
  xml_url <- read_xml(sprintf(xml_url_base,i))
  
  cbind(originTime = xml_text(xml_find_all(xml_url, ".//originTime")),
        phaseNumber = xml_text(xml_find_all(xml_url, ".//phaseNumber")),
        minimumDistance = xml_text(xml_find_all(xml_url, ".//minimumDistance")),
        gap = xml_text(xml_find_all(xml_url, ".//gap")),
        rms = xml_text(xml_find_all(xml_url, ".//rms")),
        erh = xml_text(xml_find_all(xml_url, ".//erh")),
        erz = xml_text(xml_find_all(xml_url, ".//erz")),
        quality = xml_text(xml_find_all(xml_url, ".//quality")),
        reviewStatus = xml_text(xml_find_all(xml_url, ".//reviewStatus")),
        
        stringsAsFactors = F)
}) -> eq_df_tmp

# cbind by originTime


# Data Retyping
# Typhoon
typhoon$Year <- as.character(typhoon$Year)
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
# 2. 