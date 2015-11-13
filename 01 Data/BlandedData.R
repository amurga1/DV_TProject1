require("jsonlite")
require("RCurl")
require("dplyr")
medicareState <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select new.state, gdp.population_million_, new.avgMedicareSpending from (SELECT STATESABBR.STATE as state, sum(MEDICARE.PERCENTSPEND_ST_) as avgMedicareSpending from medicare inner join statesabbr on MEDICARE.STATE=statesabbr.abbreviation group by STATESABBR.STATE) new Inner Join (select u.state as state, u.POPULATION_MILLION_ as population_million_ from USGFinal u) gdp on new.state = gdp.state;"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_alm3657', PASS='orcl_alm3657', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

View(medicareState)
