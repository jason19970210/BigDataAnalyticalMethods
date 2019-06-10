library(jsonlite)
library(dplyr)
library(data.table)

sea <- fromJSON("https://opendata.cwb.gov.tw/fileapi/v1/opendataapi/C-B0048-001?Authorization=CWB-64CBB768-EE64-4FD2-AED5-0A68D1A48B79&downloadType=WEB&format=JSON")
sea <- sea$Cwbopendata$dataset$location

sea <- data.table(sea)
sea[, yyyymm := ItemValue[[1]][1]]
sea[, MeanSeaLevel := ItemValue[[1]][2]]
sea[, MeanSeaLevel_unit := ItemUnit[[1]][1]]
sea[, HHWL := ItemValue[[1]][3]]
sea[, HHWL_unit := ItemUnit[[1]][2]]
sea[, LLWL := ItemValue[[1]][4]]
sea[, LLWL_unit := ItemUnit[[1]][3]]

sea <- select(sea, SiteName, SiteId, yyyymm, MeanSeaLevel, MeanSeaLevel_unit, HHWL, HHWL_unit, LLWL, LLWL_unit)
