Library Import
--------------

``` r
library(xml2)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(purrr)
library(plotly) #3d plot drawing
```

Data Import
-----------

``` r
typhoon_all <- read.csv("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/typhoon/typhoon_web_table.csv",stringsAsFactors = F)
xml_url_base <- paste("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/earthquake/CWB-EQ-Catalog-%d","xml",sep = ".")
sea_level <- read_csv("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/sea/sea_level.csv")
```

    ## Warning: Duplicated column names deduplicated: '海平面資料' => '海平面資料
    ## _1' [5], '海平面資料' => '海平面資料_2' [6]

    ## Parsed with column specification:
    ## cols(
    ##   序號 = col_double(),
    ##   測站名稱 = col_character(),
    ##   日期 = col_character(),
    ##   海平面資料 = col_character(),
    ##   海平面資料_1 = col_character(),
    ##   海平面資料_2 = col_character()
    ## )

``` r
sea_temp <- read_xml("https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/Data/sea/sea_temp.xml")
```

#### Transfer many xml files to data frame

``` r
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
```

Data Processing
---------------

### pre-filter

``` r
typhoon <- filter(typhoon_all, Year >= 1990)
```

Including Plots
---------------

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
