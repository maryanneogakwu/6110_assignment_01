#Extracting the chromosome names and positions from the bam file and saving it in a tsv to create visualizations.
#bcftools query -f '%CHROM\t%POS\n' variants.vcf > variant_positions.tsv

library(ggplot2)

variants <- read.table("variant_positions.tsv", header=FALSE)
colnames(variants) <- c("chrom", "pos")

ggplot(variants, aes(x=pos, y=1)) +
  geom_point() +
  labs(x="Genome Position", y="", title="Variant Distribution Along Genome") +
  theme_minimal()

# Making a variant density plot
data <- read.table("variant_density.tsv", header=FALSE)
colnames(data) <- c("Position", "VariantCount")

plot(data$Position,
     data$VariantCount,
     type="l",
     xlab="Genome Position (bp)",
     ylab="Variants per 10 kb window",
     main="Variant Density Across Genome")
