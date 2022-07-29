#真核普转文库，没有链特异性
#column 1: gene ID column 2: counts for unstranded RNA-seq choose column
a = list.files(pattern = "*.tab$")
dir = paste("./",a,sep="")
n = length(dir)
merge_data = read.table("./01305877-1ReadsPerGene.out.tab", sep="\t", col.names = c("gene_id","01305877","c3","c4"))
merge_data$c3 <- NULL
merge_data$c4 <- NULL
merge_data <- merge_data[-c(1:4),]
for (i in 2:n){
	index <- strsplit(a[i],"-",fixed = T)[[1]][1]
	new_data = read.table(file = dir[i],sep="\t", col.names = c("gene_id",index,"c3","c4"))
	new_data$c3 <- NULL
	new_data$c4 <- NULL
	merge_data <- merge_data[-c(1:4),]
	merge_data = merge(merge_data,new_data,by = "gene_id")
}

write.table(merge_data,file="matrix.count",sep = "\t",quote = F,row.names = F)
