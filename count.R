a = list.files()
dir = paste("./",a,sep="")
n = length(dir)
merge_data = read.table("./1164567-3_FRAS220007269.count", sep="\t", col.names = c("gene_id","c2","1164567-3_FRAS220007269.count","c4"))
merge_data$c2 <- NULL
merge_data$c4 <- NULL
for (i in 2:n){
	new_data = read.table(file = dir[i],sep="\t", col.names = c("gene_id","c2",a[i],"c4"))
	new_data$c2 <- NULL
	new_data$c4 <- NULL
	merge_data = merge(merge_data,new_data,by = "gene_id")
}

write.table(merge_data,file="matrix.count",sep = "\t",quote = F,row.names = F)
