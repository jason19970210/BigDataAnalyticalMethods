library(jsonlite)
library(dplyr)
library(data.table)
sea_level <- fromJSON("https://opendata.cwb.gov.tw/fileapi/v1/opendataapi/C-B0048-001?Authorization=CWB-64CBB768-EE64-4FD2-AED5-0A68D1A48B79&downloadType=WEB&format=JSON")
sea_level <- sea_level$Cwbopendata$dataset$location

sea_level <- data.table(sea_level)
sea_level[, number := 1:nrow(sea_level)]
sea_level[, yyyymm := ItemValue[[.N]][[1]], by = number]
sea_level[, MeanSeaLevel := ItemValue[[.N]][2], by = number]
sea_level[, MeanSeaLevel_unit := ItemUnit[[.N]][1], by = number]
sea_level[, HHWL := ItemValue[[.N]][3], by = number]
sea_level[, HHWL_unit := ItemUnit[[.N]][2], by = number]
sea_level[, LLWL := ItemValue[[.N]][4], by = number]
sea_level[, LLWL_unit := ItemUnit[[.N]][3], by = number]

sea_level <- select(sea_level, SiteName, SiteId, yyyymm, MeanSeaLevel, MeanSeaLevel_unit, HHWL, HHWL_unit, LLWL, LLWL_unit)
