d=read.table("example.gff",sep="\t",header=T)

# chromosoal distribution for QTL associated with one signle trait
out=as.matrix(table(d[,1]))
out=cbind(rownames(out),out)
colnames(out)=c("key","value")
write.csv(out,"freq_across_chr.csv",row.names=F,quote=F)