# Making a rainfall plot show whether the observed SNPs/INS/DEL are clustered (hotspots) or evenly spaced across the genome.
# Load data
SNPindels <- read.table("variants_sorted.tsv",
                       col.names=c("chrom","pos","ref","alt","type"))

# Ensure numeric positions
variants$pos <- as.numeric(SNPindels$pos)

# Compute distance to previous variant within each chromosome
SNPindels <- SNPindels %>%
  arrange(chrom, pos) %>%
  group_by(chrom) %>%
  mutate(
    dist = pos - lag(pos),
    log_dist = log10(dist)
  ) %>%
  na.omit()

ggplot(SNPindels, aes(x = pos, y = log_dist, color = type)) +
  geom_point(size = 1, alpha = 0.7) +
  facet_wrap(~chrom, scales = "free_x") +
  theme_minimal(base_size = 14) +
  labs(
    title = "Rainfall Plot of Variant Distribution",
    x = "Genomic Position (bp)",
    y = "Log10 Distance to Previous Variant",
    color = "Variant Type"
  )
