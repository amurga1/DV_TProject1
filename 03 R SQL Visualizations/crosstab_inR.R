require("jsonlite")
require("RCurl")
require(ggplot2)
require(dplyr)

# creating crosstab
head(medicare)
med4 <- medicare %>% select(CLAIM_TYPE, STATE, HOSPITAL_NAME, AVGSPENDINGPEREPISODE_HOSPI_) %>% arrange(desc(STATE))

View(med4)

m1 <- medicare %>% group_by(STATE, HOSPITAL_NAME) %>% summarize(mean_hosp = mean(AVGSPENDINGPEREPISODE_HOSPI_), mean_state = mean(AVGSPENDPEREPISODE_ST_)) %>% mutate(kpi = ifelse( mean_hosp <= mean_state, 'Lower', 'Higher')) 
View(m1)
