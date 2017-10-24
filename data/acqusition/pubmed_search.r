library(rentrez)
library(XML)
snp_search =entrez_search(db="snp", term="Zea mays[ORGN]" ,use_history = TRUE)
recs =entrez_fetch(db="snp", web_history=snp_search$web_history, rettype="xml", parsed=TRUE)

recs_list=xmlToList(recs)
save.image()