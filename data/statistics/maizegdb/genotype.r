library(RMySQL)
#summary of genotype
con <- dbConnect(RMySQL::MySQL(), dbname = "sc724")
res <- dbGetQuery(con, "select * from RECOMB_CLASS_FREQ")
d=dbReadTable(con, "RECOMB_CLASS_FREQ")
dbDisconnect(con)
