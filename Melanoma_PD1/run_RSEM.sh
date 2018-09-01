# 调用 RSEM 计算基因表达量的TPM值

mkdir ./RSEM_STAR
rsem-prepare-reference --gtf ./gencode.v22.annotation.gtf --star -p 60 ./GRCh38.d1.vd1.fa ./RSEM_STAR/hg38

for i in $(seq 3184279 3184306);do
rsem-calculate-expression --paired-end -p 60 --star --star-gzipped-read-file --append-names --output-genome-bam ../PRJNA312948/SRR${i}_1.fastq.gz ../PRJNA312948/SRR${i}_2.fastq.gz ./RSEM_STAR/hg38 SRR${i};
done
