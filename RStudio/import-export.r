# save as import-export.r
data<-read.table("gene-exprA-exprB.tab",header=TRUE,sep="\t")
attach(data)
png("mioploto.png")
plot(log2(exprA),log2(exprB),col="blue")
dev.off()

