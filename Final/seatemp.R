library(jsonlite)
library(dplyr)

seatemp <- fromJSON("https://opendata.cwb.gov.tw/fileapi/v1/opendataapi/C-B0050-001?Authorization=CWB-64CBB768-EE64-4FD2-AED5-0A68D1A48B79&downloadType=WEB&format=JSON")
seatemp <- seatemp$Cwbopendata$dataset$location

sea_test2 <- data.frame(obsrtime = NA,
                        MonthAvg = NA,
                        MonthHigh = NA,
                        MonthHighTime = NA,
                       MonthLow = NA,
                       MonthLowTime = NA,
                       LocationName = NA,
                       StationID = NA,
                       lon = NA,
                       lat = NA)


for (j in 1:nrow(seatemp)){
  
  sea_test <- data.frame(obsrtime = NA,
                         MonthAvg = NA,
                         MonthHigh = NA,
                         MonthHighTime = NA,
                         MonthLow = NA,
                         MonthLowTime = NA)
  
  for (i in 1:length(seatemp$time[[j]]$obsrtime)) {
    sea_temp  <- c(seatemp$time[[j]]$obsrtime[i], seatemp$time[[j]]$weatherElement$elementValue[[i]]$vlaue)
    sea_test <- rbind(sea_test, sea_temp)
  }
  sea_test <- sea_test[-1,]
  sea_test$LocationName <- seatemp$LocationName[j]
  sea_test$StationID <- seatemp$StationID[j]
  sea_test$lon <- seatemp$lon[j]
  sea_test$lat <- seatemp$lat[j]
  
  sea_test2 <- rbind(sea_test2, sea_test)
}

sea_test2 <- sea_test2[-1,]
seatemp <- select(sea_test2, 
                    LocationName, 
                    StationID, 
                    lon,
                    lat, 
                    obsrtime, 
                    MonthAvg, 
                    MonthHigh, 
                    MonthHighTime, 
                    MonthLow, 
                    MonthLowTime)
