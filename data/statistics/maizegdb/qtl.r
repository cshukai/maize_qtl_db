#refence : https://ftp.maizegdb.org/MaizeGDB/FTP/MaizeGDB_MySQL/MaizeGDBSchema.pdf
library(RMySQL)
con = dbConnect(RMySQL::MySQL(), dbname = "sc724")
d=dbReadTable(con, "QTL_EXP")
d2=dbReadTable(con, "TRAIT_ANALYSIS")
d3=dbReadTable(con, "PHENOTYPE")
d4=dbReadTable(con, "QTL_LINK_ANALYSIS")
d5=dbReadTable(con, "PHENOTYPE_TRAIT")
d6=dbReadTable(con, "LOCUS")
#d6 contains qtl train and bin information
qtl=d6[which(d6[,"TYPE"]==25396),]

#locate useful qtl information
##phenotype
result=d2[which(d2[,"TRAIT"] %in% intersect(d3[,"TRAIT"],d2[,"TRAIT"])),c("TRAIT","NAME","QTL_EXP","EXPERIMENTAL_DESIGN","HERITABILITY")]
##qtl and evidence type (ex:f2)
qtl_exp=d[which(d[,"ID"] %in% result[,"QTL_EXP"]),] 

## todo- identifided which qtl are included in  47 experiments and where are they located
dbDisconnect(con)
