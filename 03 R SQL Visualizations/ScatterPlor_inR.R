#Scatter plot in R
# using Percentspend Hosp (y) and AvgsSpending per episode (x)
require("ggplot2")
require(extrafont)
ggplot(data=medicare, aes(x=PERCENTSPEND_HOSP_, y=AVGSPENDINGPEREPISODE_HOSPI_)) +
geom_point( size=4, shape=21, fill="blue", colour = "blue") +
labs(title='Hospital Spending') +
labs(x=paste("Percent Spending"), y=paste("Avg Spending per Episode"))
