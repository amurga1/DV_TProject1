# creating crosstab
head(medicare)
med4 <- medicare %>% select(CLAIM_TYPE, STATE, HOSPITAL_NAME, AVGSPENDINGPEREPISODE_HOSPI_) %>% arrange(desc(STATE))

View(med4)

