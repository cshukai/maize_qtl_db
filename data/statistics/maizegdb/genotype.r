library(RMySQL)
#summary of genotype
con <- dbConnect(RMySQL::MySQL(), dbname = "sc724")
d=dbReadTable(con, "RECOMB_CLASS_FREQ")
dbDisconnect(con)
