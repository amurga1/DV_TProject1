setwd("~/DataVisualization/CSVs")

file_path <- "statesAbbr.csv"

df <- read.csv(file_path, stringsAsFactors = FALSE)

# Replace "." (i.e., period) with "_" in the column names.
names(df) <- gsub("\\.+", "_", names(df))

str(df)

for(n in names(df)) {
  df[n] <- data.frame(lapply(df[n], gsub, pattern="[^ -~]",replacement= ""))
}

dimensions <- c("State", "Abbreviation")


# Make all state data to upper case
df["State"] <- data.frame(lapply(df["State"], toupper))


write.csv(df, paste(gsub(".csv", "", file_path), ".reformatted.csv", sep=""), row.names=FALSE, na = "")

states <- gsub(" +", "_", gsub("[^A-z, 0-9, ]", "", gsub(".csv", "", file_path)))
sql <- paste("CREATE TABLE", states, "(\n-- Change table_name to the table name you want.\n")

for(d in dimensions) {
  if(d != tail(dimensions, n=1)) sql <- paste(sql, paste(d, "varchar2(4000),\n"))
  else sql <- paste(sql, paste(d, "varchar2(4000)\n"))
}

sql <- paste(sql, ");")
cat(sql)

