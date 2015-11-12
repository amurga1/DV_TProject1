#bar chart using R
require("jsonlite")
require(dplyr)
require("ggplot2")
require(extrafont)

med1 <- medicare %>% select(STATE, AVGSPENDPEREPISODE_ST_, HOSPITAL_NAME) %>% group_by(STATE) %>% summarize(num_hospitals = n_distinct(HOSPITAL_NAME), avgSpending = sum(AVGSPENDPEREPISODE_ST_))%>% arrange(desc(STATE))
View(med1)

med2 <- med1 %>% select(avgSpending) %>% summarize(avg = mean(avgSpending))
View(med2)

ggplot(data = med1, 
       mapping = aes(x=STATE, y=avgSpending, fill = num_hospitals)) + 
scale_fill_gradient(
    low = "red",
    high = "blue") +
geom_bar(position = "dodge", stat="identity") +
  labs(title='Medicare Spending per State') +
  labs(x=paste("State"), y=paste("Average Spending per State")) +
  layer(geom = "bar",
        position = "dodge",
        stat = "identity",
        data = med1,
        mapping = aes(x =STATE))+
geom_hline(yintercept = 2570966) # this number is what comes up in med2
