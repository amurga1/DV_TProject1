require("jsonlite")
require("RCurl")
require(ggplot2)
require(dplyr)

# creating crosstab
head(medicare)


m5 <- medicare %>% group_by(STATE) %>% distinct(CLAIM_TYPE) %>% select(STATE, AVGSPENDPEREPISODE_ST_, AVGSPENDPEREPISODE_NAT_, CLAIM_TYPE) %>% mutate(kpi = ifelse( AVGSPENDPEREPISODE_ST_ <= AVGSPENDPEREPISODE_NAT_, 'Lower', 'Higher')) 
View(m5)



ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_discrete() +
  labs(title='Claim Type Sependings by Hospitals in States') +
  labs(x=paste("CLAIM TYPE"), y=paste("STATE")) +
  layer(data=m5, 
        mapping=aes(x=CLAIM_TYPE, y=STATE, label=AVGSPENDPEREPISODE_ST_), 
        stat="identity", 
        stat_params=list(), 
        geom="text",
        geom_params=list(colour="black"), 
        position=position_identity()
  ) +
  layer(data=m5, 
        mapping=aes(x=CLAIM_TYPE, y=STATE, label=AVGSPENDPEREPISODE_NAT_), 
        stat="identity", 
        stat_params=list(), 
        geom="text",
        geom_params=list(colour="black", vjust=2), 
        position=position_identity()
  ) +
  layer(data=m5, 
        mapping=aes(x=CLAIM_TYPE, y=STATE, fill=kpi), 
        stat="identity", 
        stat_params=list(), 
        geom="tile",
        geom_params=list(alpha=.5), 
        position=position_identity()
  )
