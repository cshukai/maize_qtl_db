library(RMySQL)
#summary: qtl exp
con = dbConnect(RMySQL::MySQL(), dbname = "sc724")
d=dbReadTable(con, "QTL_EXP")
dbDisconnect(con)

