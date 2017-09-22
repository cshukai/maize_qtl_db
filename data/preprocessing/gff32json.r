 library(jsonlite)
 
 qtl_d=read.table("example.gff",sep="\t",header=T)
 chrs=as.numeric(names(table(qtl_d[,"chr"])))
 #trait=qtl_d[,"Trait"]
 #start_pos=qtl_d[,"start"]
 #end_pos=qtl_d[,"end"]
 #evidence_type=qtl_d[,"evidence_type"]
 #authors=qtl_d[,"reference"]
 annots=NULL
 for(i in 1:length(chrs)){
     d=qtl_d[which(qtl_d[,"chr"]==chrs[i]),]
     these_len=d[,"end"]-d[,"start"]
     qtl_embedded=list()
     #these_type=d[,"evidence_type"]
     #these_auth=d[,"reference"]
     #these_trait=d[,"Trait"]
     these_trait=NULL
     for(j in  1:nrow(d)){
         if(d[j,"Trait"]=="Ear_Number"){
             
         }
     }
     this_set=cbind(d[,"reference"],d[,"start"],these_len,d[,"Trait"],d[,"evidence_type"])
     qtl_embedded[[1]]=this_set
     this.row=cbind(chrs[i],qtl_embedded)
     annots=rbind(annots,this.row)
     
 }
 
 
 result[[1]]=c("name","start","length","expression-level","gene-type" )
 result[[2]]=annots
 names(result)=c("keys","annots")
 toJSON(result)