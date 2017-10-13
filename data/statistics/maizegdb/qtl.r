#refence : https://ftp.maizegdb.org/MaizeGDB/FTP/MaizeGDB_MySQL/MaizeGDBSchema.pdf
library(RMySQL)
con = dbConnect(RMySQL::MySQL(), dbname = "sc724")
d=dbReadTable(con, "QTL_EXP")
d2=dbReadTable(con, "TRAIT_ANALYSIS")
d3=dbReadTable(con, "PHENOTYPE")

#locate useful qtl information
##phenotype
result=d2[which(d2[,"TRAIT"] %in% intersect(d3[,"TRAIT"],d2[,"TRAIT"])),c("TRAIT","NAME","QTL_EXP","EXPERIMENTAL_DESIGN","HERITABILITY")]
##qtl and evidence type (ex:f2)
qtl_exp=d[which(d[,"ID"] %in% result[,"QTL_EXP"]),] 

dbDisconnect(con)

