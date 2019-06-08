library(xml2)
library(dplyr)


url <- "C:\\Users\\ll39\\Documents\\mf\\CWB-EQ-Catalog-1990.xml"

earthq_xml <- read_xml(url)
earthq <- xml_find_all(earthq_xml, ".//earthquakeinfo")

epicenterLon <- earthq %>% xml_find_first(".//epicenterLon ") %>% xml_text()
epicenterLon_unit <- earthq %>% xml_find_first(".//epicenterLon ") %>% xml_attr("unit")
epicenterLat <- earthq %>% xml_find_first(".//epicenterLat ") %>% xml_text()
epicenterLat_unit <- earthq %>% xml_find_first(".//epicenterLat ") %>% xml_attr("unit")
depth <- earthq %>% xml_find_first("./depth ") %>% xml_text()
depth_unit <- earthq %>% xml_find_first("./depth ") %>% xml_attr("unit")
magnitudeType <- earthq %>% xml_find_first(".//magnitudeType ") %>% xml_text()
magnitudeValue <- earthq %>% xml_find_first(".//magnitudeValue ") %>% xml_text()
minimumDistance <- earthq %>% xml_find_first("./minimumDistance ") %>% xml_text()
minimumDistance_unit <- earthq %>% xml_find_first("./minimumDistance ") %>% xml_attr("unit")
gap <- earthq %>% xml_find_first("./gap ") %>% xml_text()
gap_unit <- earthq %>% xml_find_first("./gap ") %>% xml_attr("unit")
rms <- earthq %>% xml_find_first("./rms ") %>% xml_text()
rms_unit <- earthq %>% xml_find_first("./rms ") %>% xml_attr("unit")
erh <- earthq %>% xml_find_first("./erh ") %>% xml_text()
erh_unit <- earthq %>% xml_find_first("./erh ") %>% xml_attr("unit")
erz <- earthq %>% xml_find_first("./erz ") %>% xml_text()
erz_unit <- earthq %>% xml_find_first("./erz ") %>% xml_attr("unit")

earthq1990_df <- data.frame(epicenterLon = epicenterLon,
                            epicenterLon_unit = epicenterLon_unit,
                            epicenterLat = epicenterLat,
                            epicenterLat_unit = epicenterLat_unit,
                            depth = depth,
                            depth_unit = depth_unit,
                            magnitudeType = magnitudeType,
                            magnitudeValue = magnitudeValue,
                            minimumDistance = minimumDistance,
                            minimumDistance_unit = minimumDistance_unit,
                            gap = gap,
                            gap_unit = gap_unit,
                            rms = rms,
                            rms_unit = rms_unit,
                            erh = erh,
                            erh_unit = erh_unit,
                            erz = erz,
                            erz_unit = erz_unit)



