library(RMySQL)
#summary: qtl exp
con = dbConnect(RMySQL::MySQL(), dbname = "sc724")
d=dbReadTable(con, "QTL_LINK_EXP")
d2=dbReadTable(con, "TRAIT_ANALYSIS")
d3=dbReadTable(con, "PHENOTYPE")

result=d2[which(d2[,"TRAIT"] %in% intersect(d3[,"TRAIT"],d2[,"TRAIT"])),c("TRAIT","NAME","QTL_EXP","EXPERIMENTAL_DESIGN","HERITABILITY")]

dbDisconnect(con)

