 library(jsonlite)
 
 qtl_d=as.matrix(read.table("example.gff",sep="\t",header=T))
 chrs=as.numeric(names(table(qtl_d[,"chr"])))

 annots=NULL
 for(i in 1:length(chrs)){
     d=qtl_d[which(as.numeric(qtl_d[,"chr"])==chrs[i]),]
     d=as.matrix(d)
     if(ncol(d)==1){
         d=t(d)
     }
     colnames(d)=colnames(qtl_d)
     these_len=as.numeric(d[,"end"])-as.numeric(d[,"start"])
     qtl_embedded=list()
    
     these_trait=NULL
     for(j in  1:nrow(d)){
         if(d[j,"Trait"]=="Ear_Number"){
             d[j,"Trait"]=1
         }
         if(as.character(d[j,"evidence_type"])=="f2"){
             d[j,"evidence_type"]=1
         }
     }
     this_set=cbind(d[,"reference"],d[,"start"],these_len,d[,"Trait"],d[,"evidence_type"])
     qtl_embedded[[1]]=this_set
     this.row=cbind(chrs[i],qtl_embedded)
     annots=rbind(annots,this.row)
     
 }
 colnames(annots)=c("chr","annots")
 annots_2=as.data.frame(annots)

 result=list()
 result[[1]]=c("name","start","length","expression-level","gene-type" )
 result[[2]]=annots_2
 names(result)=c("keys","annots")
 out=toJSON(result)