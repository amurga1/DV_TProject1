# bar chart using R
require("jsonlite")
require(dplyr)
require("ggplot2")
require(extrafont)

require(gridExtra)

p1 <- ggplot(data = medicareState, 
       mapping = aes(x=STATE, y=POPULATION_MILLION_)) + 
  geom_bar(position = "dodge", stat="identity") +
  labs(title='Medicare and GDP per State Data') +
  labs(x=paste("State"), y=paste("Population (millions)")) +
  layer(geom = "bar",
        position = "dodge",
        stat = "identity",
        data = medicareState,
        mapping = aes(x =STATE))

p2 <- ggplot(data = medicareState, 
       mapping = aes(x=STATE, y=AVGMEDICARESPENDING)) +  
  layer(geom = "point",
        position = "dodge",
        stat = "identity",
        data = medicareState,
        mapping = aes(y =AVGMEDICARESPENDING)) +
  labs(y=paste("Avg Medicare Spending")) +
  labs(title='Medicare and GDP per State Data')
  grid.arrange(p1, p2, ncol=2)
                       
