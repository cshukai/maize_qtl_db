#refence : https://ftp.maizegdb.org/MaizeGDB/FTP/MaizeGDB_MySQL/MaizeGDBSchema.pdf
library(RMySQL)
con = dbConnect(RMySQL::MySQL(), dbname = "sc724")
d=dbReadTable(con, "QTL_EXP")
d2=dbReadTable(con, "TRAIT_ANALYSIS")
d3=dbReadTable(con, "PHENOTYPE")
d4=dbReadTable(con, "QTL_LINK_ANALYSIS")
d5=dbReadTable(con, "PHENOTYPE_TRAIT")
d6=dbReadTable(con, "LOCUS")
d7=dbReadTable(con, "LINKAGE_GROUP")
## qtl processing :d6 contains qtl train and bin information
qtl=d6[intersect(which(d6[,"TYPE"]==25396),which(!is.na(d6[,"LINKAGE_GROUP"]))),]  # 25396 referes to locus that are assocaited with quantitative trait
# convert linkdage group to chromsome
chrs=NULL
for(i in 1:nrow(qtl)){
   this.link.group=qtl[i,"LINKAGE_GROUP"]#linkage group referes to chromosomes  
   this.chr=d7[which(d7[,"ID"]==this.link.group),"CHR_"]
   if(length(this.chr)==0){
       print(qtl[i,"LINKAGE_GROUP"])
   }
   chrs=c(chrs,this.chr)
} 
qtl2=cbind(qtl,chrs)
colnames(qtl2)=c(colnames(qtl),"chrs")
#value refers to bin location 


##phenotype
result=d2[which(d2[,"TRAIT"] %in% intersect(d3[,"TRAIT"],d2[,"TRAIT"])),c("TRAIT","NAME","QTL_EXP","EXPERIMENTAL_DESIGN","HERITABILITY")]
##qtl and evidence type (ex:f2)
qtl_exp=d[which(d[,"ID"] %in% result[,"QTL_EXP"]),] 

## todo- identifided which qtl are included in  47 experiments and where are they located
dbDisconnect(con)

save.image()