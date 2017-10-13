library(RMySQL)
con = dbConnect(RMySQL::MySQL(), dbname = "sc724")
 d=dbReadTable(con, "PHENOTYPE")
