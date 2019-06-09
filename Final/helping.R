library(xml2)
library(dplyr)
library(plotly)


url <- "https://raw.githubusercontent.com/jason19970210/BigDataAnalyticalMethods/master/Final/earthquake/CWB-EQ-Catalog-1990.xml"

earthq_xml <- read_xml(url)
earthq <- xml_find_all(earthq_xml, ".//earthquakeinfo")

epicenterLon <- earthq %>% xml_find_first(".//epicenterLon ") %>% xml_text()
#epicenterLon_unit <- earthq %>% xml_find_first(".//epicenterLon ") %>% xml_attr("unit")
epicenterLat <- earthq %>% xml_find_first(".//epicenterLat ") %>% xml_text()
#epicenterLat_unit <- earthq %>% xml_find_first(".//epicenterLat ") %>% xml_attr("unit")
depth <- earthq %>% xml_find_first("./depth ") %>% xml_text()
#depth_unit <- earthq %>% xml_find_first("./depth ") %>% xml_attr("unit")
#magnitudeType <- earthq %>% xml_find_first(".//magnitudeType ") %>% xml_text()
magnitudeValue <- earthq %>% xml_find_first(".//magnitudeValue ") %>% xml_text()
minimumDistance <- earthq %>% xml_find_first("./minimumDistance ") %>% xml_text()
#minimumDistance_unit <- earthq %>% xml_find_first("./minimumDistance ") %>% xml_attr("unit")
gap <- earthq %>% xml_find_first("./gap ") %>% xml_text()
#gap_unit <- earthq %>% xml_find_first("./gap ") %>% xml_attr("unit")
rms <- earthq %>% xml_find_first("./rms ") %>% xml_text()
#rms_unit <- earthq %>% xml_find_first("./rms ") %>% xml_attr("unit")
erh <- earthq %>% xml_find_first("./erh ") %>% xml_text()
#erh_unit <- earthq %>% xml_find_first("./erh ") %>% xml_attr("unit")
erz <- earthq %>% xml_find_first("./erz ") %>% xml_text()
#erz_unit <- earthq %>% xml_find_first("./erz ") %>% xml_attr("unit")

earthq1990_df <- data.frame(originTime = xml_text(xml_find_first(earthq, ".//originTime")),
                            epicenterLon = epicenterLon,
                            #epicenterLon_unit = epicenterLon_unit,
                            epicenterLat = epicenterLat,
                            #epicenterLat_unit = epicenterLat_unit,
                            depth = depth,
                            #depth_unit = depth_unit,
                            #magnitudeType = magnitudeType,
                            magnitudeValue = magnitudeValue,
                            phaseNumber = xml_text(xml_find_first(earthq, "./phaseNumber")),
                            minimumDistance = minimumDistance,
                            #minimumDistance_unit = minimumDistance_unit,
                            gap = gap,
                            #gap_unit = gap_unit,
                            rms = rms,
                            #rms_unit = rms_unit,
                            erh = erh,
                            #erh_unit = erh_unit,
                            erz = erz)
                            #erz_unit = erz_unit



#https://stackoverflow.com/questions/25346430/dealing-with-empty-xml-nodes-in-r
if (1 < 0){
  xmlGetNodeAttr <- function(n, xp, attr, default=NA) {
    ns<-getNodeSet(n, xp)
    if(length(ns)<1) {
      return(default)
    } else {
      sapply(ns, xmlGetAttr, attr, default)
    }
  }

a <- fname=xmlGetNodeAttr(eq1990, "./earthquakeinfo","originTime",NA)
data.frame(
  lname=xmlGetNodeAttr(x, "./Info","lastNm",NA),
  orgname=xmlGetNodeAttr(x, "./CrntEmps/CrntEmp[1]","orgNm",NA),
  zip=xmlGetNodeAttr(x, "./CrntEmps/CrntEmp[1]/BrnchOfLocs/BrnchOfLoc[1]","city",NA)
)
}


library(chron)
dtimes = c("2002-06-09 12:45:40","2003-01-29 09:30:40","2002-09-04 16:45:40","2002-11-13 20:00:40","2002-07-07 17:30:40")
dtparts = t(as.data.frame(strsplit(dtimes,' ')))
row.names(dtparts) = NULL
thetimes = chron(dates=dtparts[,1],times=dtparts[,2],format=c('y-m-d','h:m:s'))
thetimes




a <- 3+NA
a


# 3d plot drawing
plot_ly (
  type = 'scatter3d' , x = c( 9, 8, 5, 10 ) ,
  y = c( 1, 2, 4, 8 ) ,
  z = c( 11, 8, 15, 3 ) , mode = 'lines' )


plot_ly (
  #x=rchisq ( 100, 5, 0 ),
  x = eq_df$magnitudeValue,
  type = 'histogram' )


axis_template <- list( showgrid = F , zeroline = F , nticks = 20 , showline = T ,title = 'AXIS' , mirror = 'all' )
plot_ly (x = eq_df$magnitudeValue, type = 'histogram') %>% layout(xaxis = axis_template , yaxis = axis_template )


plot_ly (
  type = 'scattergeo' , lon = c( -73.5, 151.2 ) , lat = c( 45.5, -33.8 ) , marker = list (
    color = c( 'red' , 'blue' ) , size = c( 30, 50 ) , mode = 'markers' ))

plot_ly (
  x = rnorm( 1000, sd = 10 ) , y = rnorm( 1000, sd = 5 ) , type = 'histogram2d' )

plot_ly (
  y = rnorm( 50 ) , type = 'box' )

plot_ly (
  x = c( 1, 2, 3 ),
  y = c( 5, 6, 7 ),
  type = 'scatter' , mode = 'markers' )
