#Extracting the chromosome names and positions from the bam file and saving it in a tsv to create visualizations.
#bcftools query -f '%CHROM\t%POS\n' variants.vcf > variant_positions.tsv

library(ggplot2)

variants <- read.table("variant_positions.tsv", header=FALSE)
colnames(variants) <- c("chrom", "pos")

#Making a heatmap
bin_size <- 10000  # 10 kb windows

variants$bin <- floor(variants$pos / bin_size)

heat <- as.data.frame(table(variants$bin))
colnames(heat) <- c("bin", "count")

ggplot(heat, aes(x=as.numeric(bin), y=1, fill=count)) +
  geom_tile() +
  scale_fill_gradient() +
  labs(x="Genome Window (10kb bins)", y="", title="Variant Density Heatmap") +
  theme_minimal()
