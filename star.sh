#!/bin/sh
#PBS -N star
#PBS -q workq
#PBS -j oe

cd /share2/pub/zhenggw/zhenggw/STAR_task/

for i in ls *.fq.gz;
  do
   index=`echo $i|cut -d _ -f 3`;
   preindex=`echo $i|cut -d _ -f 1-2`;
       if [ $index == '1.fq.gz' ];
        	 then
              STAR --runMode alignReads
            	     --runThreadN 16
            			 --genomeDir /share2/pub/zhenggw/zhenggw/Cardioids/GSE148025/ref/
            			 --readFilesIn /share2/pub/zhenggw/zhenggw/STAR_task/$preindex"_1.fq.gz" /share2/pub/zhenggw/zhenggw/STAR_task/$preindex"_2.fq.gz"
            			 --twopassMode Basic
            			 --sjdbOverhang 149
            			 --outFilterMultimapNmax 20
            			 --alignSJoverhangMin 8
            			 --alignSJDBoverhangMin 1
            			 --outFilterMismatchNmax 999
            			 --alignIntronMin 20
            			 --alignIntronMax 1000000
            			 --alignMatesGapMax 1000000
            			 --sjdbScore 2
            			 --outFilterType BySJout
            			 --outFilterScoreMinOverLread 0.33
            			 --outFilterMatchNminOverLread 0.33
            			 --limitSjdbInsertNsj 1200000
            			 --readFilesCommand zcat
            			 --outFileNamePrefix $preindex
            			 --outSAMstrandField intronMotif
            			 --outFilterIntronMotifs None
            			 --alignSoftClipAtReferenceEnds Yes
            			 --quantMode TranscriptomeSAM GeneCounts
            			 --outSAMtype BAM SortedByCoordinate
            			 --outSAMunmapped Within
            			 --genomeLoad NoSharedMemory
            			 --chimSegmentMin 15
            			 --chimJunctionOverhangMin 15
            			 --chimSegmentReadGapMax 3
            			 --chimOutType Junctions WithinBAM
            			 --alignSJstitchMismatchNmax 5 -1 5 5
            			 --chimOutJunctionFormat 1
            			 --outSAMattributes NH HI AS nM NM ch XS MD
            			 --outSAMattrRGline ID:rg1 SM:sm1
        fi
   done
