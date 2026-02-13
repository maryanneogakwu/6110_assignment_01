## _Salmonella enterica_ Genome Assembly
**Maryanne Ogakwu**
**1395098**
# Table of Contents

1. [Overview](#overview)
2. [1 | Introduction](#1--introduction)
   1. [Genome Assembly](#genome-assembly)
   2. [Whole Genome Alignment](#whole-genome-alignment)
   3. [Short read sequences](#short-read-sequences)
   4. [Long read sequences](#long-read-sequences)
   5. [Goals of Genome Assembly](#goals-of-genome-assembly)
6. [Challanges in Genome assembly and alignment](#challanges-in-genome-assembly-and-alignment)
7. [Proposed Algorithms, Pros and Cons](#proposed-algorithms-pros-and-cons)
   1. [BacSeq](#bacseq)
       - [Pros of the BacSeq package](#pros-of-the-bacseq-package)
       - [Cons of the BacSeq package](#cons-of-the-bacseq-package)
   2. [Pangaea](#pangaea)
       - [Pros of Pangaea package](#pros-of-pangaea-package)
       - [Cons of Pangaea package](#cons-of-pangaea-package)
   3. [Ragout](#ragout)
       - [Pros of Ragout](#pros-of-ragout)
       - [Cons of Ragout](#cons-of-ragout)
8. [Planned workflow](#planned-workflow)
9. [Packeges used for Analysis](#packeges-used-for-analysis)
   1. [Flye (Genome Assembly)](#flye-genome-assembly)
   2. [Minimap2 (Alignment)](#minimap2-alignment)
   3. [SeqKit (Assembly Quality Assessment)](#seqkit-assembly-quality-assessment)
   4. [Samtools (SAM/BAM Processing)](#samtools-sambam-processing)
   5. [BCFtools (Variant Calling)](#bcftools-variant-calling)
   6. [IGV (Visualization)](#igv-visualization)
10. [Methods](#methods)
    1. [1. Data Acquisition](#1-data-acquisition)
    2. [2. Raw read Quality Control](#2-raw-read-quality-control)
    3. [3. De novo Genome Assembly using Flye](#3-de-novo-genome-assembly-using-flye)
    4. [4. Genome Alignment](#4-genome-alignment)
    5. [5. Assembly Evaluation](#5-assembly-evaluation)
    6. [6. Variant Calling](#6-variant-calling)
    7. [7. Visualization](#7-visualization)
11. [Results](#results)
12. [Discussion](#discussion)
    1. [Assembly Quality](#assembly-quality)
    2. [The IGV inspections](#the-igv-inspections)
    3. [Genome-wide visualizations](#genome-wide-visualizations)
13. [References](#references)
14. [Software Versions & Reproducibility](#software-versions--reproducibility)

## Overview
This repository is for my BINF 6110 assignment 1. It will contain a Markdown file detailing genome assembly and challanges in genome assembly and alignment with a reference genome.  Down the line it will be updated with the code I'll use t assemble a specified genome and the alignment. The project will involve assembly of raw Oxford Nanopore reads, gene mapping of raw reads to the refernce genome,and visualization of variants (SNPs) displayed between the raw reads nad the reference genome. Both the raw and _Salmonella enterica_ raw reads and the _Salmonella enterica_ were obtained through the NCBI database.

## **1 | Introduction**
#### Genome Assembly
Genome Assembly Involves reconstructing an organism's genome using fragments of sequenced DNA, called sequence reads [^1]. Common sequencing methods include Illumina sequencing, Oxford Nanopore, PacBio sequencing and Sangers sequencing, which pioneered sequencing techniques in the 70s [^7]. 
#### Whole Genome Alignment
Whole  Genome Alignment involves  aligning the entire genomes from different species or individuals within the same species [^5]. It helps give global perspective on genomic similarity and variation, providing insights into genetic diseases, evolutionary relationships and gene function [^13].  
Short read and long reads have been used based on the type of analysis being run and the desired results. 
#### Short read sequences
Short reads have been used for their high precision, but they have issues when it comes down to assembly and alignment. this is due to their propensity for multiple mapping on the same genome, leading to gaps and mismatches [^17].Tools like BOWTIE2 and BWA have been developed for short reads, being able to process large data and pinpont small-scale geneticc variations with high accuracy [^10].  
#### Long read sequences
Long reads are thousands of base pairs and have been shown to enhance genome assembly and facilitate alignment of challanging regions. Though they have high error rates and present challanges for for alignment precision [^9]. PacBio's SMRT Analysis, Oxford  Nanoporee MinION -based Minimap2 are designed for long reads and are good at detangling complex genomic architectures and reducing gaps in assemblies [^12].

##   Goals of Genome Assembly  
As stated by the Biology Insights Team (2025) [^2], there are a variety of ways in which genomic research has been  applied and utilized, ranging from gene annotation to agriultural productivity
1. Genome annotaion to identify locations of genes and other functional elements like promoters, CDS, and termination sites as well as predicting the functions.  
2. Identification of gene variations and mutations like SNPs that could cause diseases, aiding in development of diagnostic tools and targeted therapies.  
3. Comparative Genomic analysis of species to understand diversity between species and determine evolutionary relationships, adaptations and unique biological features
4. Developments in Crop breeding to produce crops that have desirable characteristics like pest resistance, higher yield and greater nutritional value.

## Challanges in Genome assembly and alignment
As powerful and efficient as long read and short read assemblies are, both techniques come with their drawbacks, especially when using a reference genome to conduct the alignment, as opposed to using de novo techniques. Somedrawbacks to connsider are:  
1. Error prone refernce: construction of a reference genome from improper or incomplete sequencing can lead to errors that mislead research and affect the accuracy of genetic studies [^8].
2. DNA fragmentation: Short Read sequencing technologies often produce fragmented, incomplete assemblies, leading to misalignment [^16].  
3. Repeatitve DNA sequences: these make it dificult for assembly algorithms to determine and arrange the fragment reads in the correct order, leading to misassemblies and gaps [^17].
4. Shorter reads offer less overlap information and require higher coverage to achieve a good assembly [^14].
5. Computational Demands: long read and optical mapping techniques used in building robust chromosome level scaffolds are technically challenging and needs high quality data, which can be limited by computational errors and increased costs [^4].
6. Maps with Low resolution: these may be too coarse to give accurate positioning and orientation of relatively short sequence contigs [^6].
7. Dependence on data quality: Poor-quality sequencing reads or contaminated samples can lead to fragmented assemblies and unreliable downstream results (Sequencing Read Quality Control).

## Proposed Algorithms, Pros and Cons  

### BacSeq  
The Paper "BacSeq: A User-Friendly Automated Pipeline for Whole-Genome Sequence Analysis of Bacterial Genomes" by Chukamnerd et. al. in 2023 [^3], presented an all in one package that carried out multiple funtions and was beginner friendly. It is an open source, java-based GUI that combines multiple tools to simplify bacterial whole genome sequencing. It can performing quality checks, genome assembly, evaluation, annotation, drug resistance and virulence gene detection. The BacSeq pipeline supports pan-genome analysis, SNP-based phylogenetic tree construction, and detection of CAZymes and CRISPR-Cas systems.  
####  Pros of the BacSeq package  
1. The GUI based design reduces reliance on command-line use and makes it is accessible to non-bioinformaticians.  
2. The program supports hybrid assembly, integrating short and long read sequences, further improving genome completedness.  

#### Cons of the BacSeq package  
1. Despite the package having a user firndly GUI, it only supports Linux systems, which limits the access to MacOS and Windows users.
2. The package still requires sufficient computational processing power and memory, especially when being used for multi-isolate analyses. 

### Pangaea
Pangaea is a de novo metagenomic assembler introduced in the paper "Exploring high-quality microbial genomes by assembling short-reads with long-range connectivity" by Zhang et. al. in 2024 [^18]. It was designed to improve genome reconstruction from short reads with physical barcodes (linked-reads) or virtual barcodes (derived from aligning short-reads to long-reads). Pangaea focuses on reducing assembly complexity and addressing the challenges posed by highly uneven microbial abundances.  

#### Pros of Pangaea package  
1. It is a cost efficient alternative to long read sequencing, as it achieves near-complete and even circular microbial genomes using short-reads with long-range connectivity, reducing reliance on expensive deep long-read sequencing.
2. It is generalizable to hybrid assemblies, meaning it can also work with virtual barcodes derived from short–long read hybrid data, extending its usefulness beyond linked-read technologies. 

#### Cons of Pangaea package
1. Computational complexity due to the use of deep learning (VAE-based binning), multiple assembly stages, and ensemble merging increases computational cost and pipeline complexity compared to standard short-read assemblers.
2. There is more focus on gut microbiomes as most real-data benchmarking is on human gut samples so the program's performance in other complex environments like soil, marine and host-associated niches remains to be fully demonstrated.

### Ragout  
This is a reference assisted scoffolding tool introduced in the paper "Ragout—a reference-assisted assembly tool for bacterial genomes" by Kolmogorov et. al. in 2014 [^11]. Ragout is an open-source bioinformatics tool designed to improve draft bacterial genome assemblies by ordering and orienting contigs using multiple complete reference genomes. Ragout is its use of multi-scale synteny blocks combined with iterative scaffolding and assembly graph refinement, allowing it to incorporate both large and small contigs while minimizing misassemblies. It uses multiple related bacterial genomes for assembly, rather than using just a single refernce genome, incorporating evolutionary relationships among references through a phylogenetic tree and uses a genome rearrangement framework to infer the correct ordering of contigs, even in the presence of structural variations such as inversions and translocations.    

#### Pros of Ragout
1. The use of multiple refernce genomes reduces errors caused by reliance on a single refernce, ultimately improving robustness in the presence of genome arrangements.  
2. It provides an improved assembly quality, producing high coverage, fewer scaffolds, less misordered contigs, and near chromosome level assemblies.    

#### Cons of Ragout  
1. Performance of the program reduces when there are only few or distantly related refernce genomes available. This makes it more difficult to accurately assemble rarer bacterial genomes.
2. This program is limited to bacterial genomes because it relies on Sibelia for synteny block construction, which works best for closely related microbial species.
3. There is a risk of refernce bias, making novel genomic structures or strain-specific arrangements in the target genome misassembled.

## Planned workflow
1. Data acquisition: obtaining raw reads as well as the reference genome.  
2. Raw read Quality Control: carried out with NanoPlot and FastQC, to assess read length and quality to ensure it is suitable for assembly.
3. De novo Genome Assembly: generating a draft assembly of contigs using the Flye tool. 
4. Reference-Assisted Scaffolding with Ragout: order and orient contigs using one or more closely related Salmonella reference genomes to Produce a more complete and biologically accurate genome assembly.
5. Assembly Evaluation: confirmation of assembly quality, completedness and contiguity.
6. Variant Calling: alignment to detect genetic differences between your isolate and the reference genome using Minimap2.
7. Visualization: Visualize genome alignment and structural differences and interpret results to support biological conclusions using IGV for variants and Bandage for an assembly graph

## Packeges used for Analysis

### Flye (Genome Assembly)
Flye [Flye(v2.9.6)](https://github.com/mikolmogorov/Flye) used to assemble long Oxford Nanopore reads into contiguous genome sequences without a reference genome. It is specifically optimized for noisy long reads and performs well with bacterial genomes. Flye produces long contigs and handles repeats effectively using repeat graphs. However, assemblies may still contain base-level errors due to long-read error rates [^20]. It also requires an estimated genome size and correct read type selection [^21].

Pros: Excellent for long reads, high contiguity, good repeat handling [^22].
Cons: Base errors remain, needs correct parameters, computationally heavy [^22].

## Minimap2 (Alignment)

Minimap2 [Minimap2 (v2.30)](https://github.com/lh3/minimap2) used to align the assembled genome and raw reads to the NCBI reference genome. It is fast and designed for long-read and assembly alignment, supporting multiple presets for different tasks. The tool produces accurate SAM files for downstream analysis such as variant calling [^23]. However, choosing the wrong preset can lead to poor alignments. It also does not perform variant calling itself, only alignment.

Pros: Very fast, versatile presets, accurate for long reads and assemblies[^23].
Cons: Preset confusion, alignment only (no analysis), command complexity [^23].

## SeqKit (Assembly Quality Assessment)

SeqKit used to examine basic statistics of the assembled genome such as sequence length, GC content, and overall composition. It provides fast, command-line summaries that help verify the integrity and characteristics of FASTA/FASTQ files before deeper analysis. SeqKit is lightweight and efficient, making it ideal for quick validation of assembly outputs. However, it only reports descriptive statistics and does not assess assembly accuracy or misassemblies. It is best used as a preliminary quality check alongside tools like QUAST [^27].

Pros: Very fast, simple commands, useful summary statistics, lightweight [^27].
Cons: No alignment or accuracy assessment, limited to descriptive metrics [^27].

## Samtools (SAM/BAM Processing)

Samtools [samtools (v1.23)](https://github.com/samtools/samtools) used to convert, sort, and index alignment files from SAM to BAM format. It is essential for preparing alignment files for efficient access and visualization. The tool allows filtering, viewing, and manipulating large alignment datasets quickly. However, command syntax can be unintuitive and version mismatches can cause library errors. It also does not perform analysis beyond file handling [^24].

Pros: Fast file processing, essential for BAM handling, widely compatible [^24].
Cons: Cryptic commands, dependency issues, not analytical [^24]. 

## BCFtools (Variant Calling)

BCFtools [samtools (v1.23)](https://github.com/samtools/samtools) to call genetic variants by comparing aligned raw reads to the reference genome. It works directly with BAM files and produces VCF files listing SNPs and indels. The tool is efficient and integrates seamlessly with Samtools. However, default parameters may not be optimal for long-read data and require tuning. Interpretation of the VCF output also requires additional visualization tools [^25].

Pros: Fast variant calling, integrates with Samtools, standard VCF output [^25].
Cons: Needs parameter tuning, less optimized for long reads, complex output [^25].

## IGV (Visualization)

IGV  [IGV (v2.19.7)](https://github.com/igvteam/igv) to visually inspect alignments and confirm variant positions in the genome. It provides an interactive interface to explore reads, coverage, and mutations at specific loci. This makes it ideal for validating variant calls and identifying hotspots. However, large files can load slowly and correct file formatting is required. It is also manual and not suitable for automated analysis [^26].

Pros: Clear visual validation, interactive, easy to interpret variants [^26].
Cons: Slow with large files, strict file requirements, manual inspection [^26].

##  Methods
### 1. Data Acquisition:
Raw Oxford Nanopore Reads obtained in FASTQ format from https://trace.ncbi.nlm.nih.gov/Traces/?run=SRR32410565 and the reference _Salmonella enterica_ (NCBI RefSeq assembly ASM695V2 GCF_000006945.2) were obtained from the NCBI database

### 2. Raw read Quality Control
Raw read length were inspected using [Nanoplot (v1.46.2)](https://github.com/wdecoster/NanoPlot) to determine the need for filtering out lower quality sequences. Eventually determining that filtering the reads could reduce coverage by removing the short reads that could contain complexitty , reducing assembly quality. 
~~~
NanoPlot --fastq SRR32410565.1.fastq -o nanoplot_output/
~~~

### 3. De novo Genome Assembly using Flye
After quality control checks, the genome was assembled from the raw reads using [Flye(v2.9.6)](https://github.com/mikolmogorov/Flye). The number of threads used was 4, genome size was -809.3m, and the -hq flag was used because it is already expected that raw reads from Oxford nanopore are of higher quality high quality.
~~~
flye --nano-hq SRR32410565.1.fastq \
--genome-size 809.3m \
--threads 4 \
--out-dir SRR32410565_flye_out
~~~

### 4. Genome Alignment 
The raw reads were aligned using [Minimap2 (v2.30)](https://github.com/lh3/minimap2). Two presets were used, the first to map the raw reads to the reference genome used the flags `---x map-ont` to adjust the algorithm for long noisy reads such as Oxford Nanopore reads. The second was for complete genome to genome alignment by mapping my assembled genome to my refernce genome. The flags used was `-as asm5` which is a preset optimized for assembly vs assembly aligment with <5% sequence difference.
~~~
minimap2 -ax map-ont -t 4 GCF_000006945.2_ASM694v2_genomic.fna SRR32410565.1.fastq > reads_ref_aln.sam
minimap2 -ax asm5  -t 4 GCF_000006945.2_ASM694v2_genomic.fna  assembly.fasta > Sal_aln.sam
~~~
### 5. Assembly Evaluation 
The assembly evaluation was carried out using [Seqkit (v2.10.1)](https://github.com/shenwei356/seqkit.git).
~~~
 seqkit stats assembly.fasta
~~~
The table below summarizes key metrics of the genome assembly: the number of contigs, total length, and contig size distribution. This evaluatin providies an overview of assembly quality and completeness and serves as a benchmark for comparing different assemblies or assembly methods
| File           | Format | Type | # Sequences | Total Length | Min Length | Avg Length  | Max Length |
|:---------------|:------:|:----:|------------:|-------------:|-----------:|------------:|-----------:|
| assembly.fasta | FASTA  | DNA  | 3           | 5,104,812    | 109,059    | 1,701,604  | 3,318,776  |

### 6. Variant Calling
Variant calling was performed between the raw reads and the NCBI refernece genome. SAM files generated from the assembly were converted to BAM format, sorted and indexed using [samtools (v1.23)](https://github.com/samtools/samtools). For variant calling, raw Nanopore reads were aligned directly to the reference genome using minimap2 with the map-ont preset, as variant detection requires mapping sequencing reads to reference coordinates rather than comparing assembled contigs [^19]
~~~
samtools view -bS reads_ref_aln.sam -o reads_ref_aln.bam
z
samtools sort reads_ref_aln.sam -o reads_ref_aln.sorted.bam

samtools index reads_ref_aln.sorted.bam
~~~
Variant calling was performed using bcftools [bcftool (v2.21)](https://github.com/samtools/bcftools.git). The flags used were `mpileup` to summarise read bases at each position against the refernce, and `--max-depth 2000` to limit the maximum read depth considered at each position to 2000 reads to prevent reduced computation time and incorrect inflation of variant confidence due to regions with high coverage. The flag `-mv` contains `-m` that is used as a multiallelic caller and the `-v` flag outputs onlyy variant sites. `-Ov` is the output VCF format in text form.
~~~
bcftools mpileup -f GCF_000006945.2_ASM694v2_genomic.fna --max-depth 2000 reads_ref_aln.sorted.bam | bcftools call -mv -Ov -o variants2000.vcf
~~~
Checking the variant file
~~~
bcftools stats variants2000.2.vcf | grep ^SN
~~~
The results of the table below show thatthe genome is SNP-rich with very few indels, suggesting high-quality alignment and variant calling. Multiallelic sites are minimal, meaning most variants are simple biallelic SNPs, which is easier to work with for downstream analysis.
| Metric                         | Value  |
|--------------------------------|--------|
| Number of samples               | 1      |
| Number of records               | 12,328 |
| Number of no-ALTs               | 0      |
| Number of SNPs                  | 12,245 |
| Number of MNPs                  | 0      |
| Number of indels                | 83     |
| Number of other variants        | 0      |
| Number of multiallelic sites    | 142    |
| Number of multiallelic SNP sites| 139    |

### 7. Visualization
Visualization of relevant SNPs observed between the alignment of the  reference genome and the raw reads was carried out using using [IGV (v2.19.7)](https://github.com/igvteam/igv).Graphical representation of Variant distribution and  frequency was carried out using R and R studio [R (4.5.1)](https://www.r-project.org/).
The variant density plot was created to show how the SNPs were distributed throught the alignment.
~~~
awk '{
window = int($2/10000);
counts[window]++
}
END {
for (w in counts)
print w*10000, counts[w]
}' variant_positions.tsv | sort -n > variant_density.tsv
~~~
The heatmap was created to show how the occurence of the SNPs varied throught the alignmnet.
~~~
bin_size <- 10000  # 10 kb windows

variants$bin <- floor(variants$pos / bin_size)

heat <- as.data.frame(table(variants$bin))
colnames(heat) <- c("bin", "count")

ggplot(heat, aes(x=as.numeric(bin), y=1, fill=count)) +
geom_tile() +
scale_fill_gradient() +
labs(x="Genome Window (10kb bins)", y="", title="Variant Density Heatmap") +
theme_minimal()
~~~

## Results
<img width="1857" height="894" alt="snp identified" src="https://github.com/user-attachments/assets/60e65d1f-dfcd-4660-b85e-a6eeba5c8ab8" />

**Figure 1:** **IGV Visualisation of a prominent SNP present in the reads**.
There are significatly marked SNPS at position NC_003197.2:103,018. with a base quality of QV 50. This shows that the reads have an insertion of G in the place of T. The G in the reads differ from the reference sequence in greater than 20 percent (20%) the quality weigthed reads. 99% of the reads have Guanine as an insertion, with a total count of 179 Guanine insertions. 

<img width="1854" height="890" alt="real fake" src="https://github.com/user-attachments/assets/4c4b4223-43d1-4ca2-9fca-56fda24f3c10" />

**Figure 2:** **IGV visualisation of an incorrectly called heterozygous SNP**. 
At position NC_003197.2:3,963,935 there seems to be a heterozygous SNP variance, but this is not the case. Although IGV flags this site as heterozygous, bacterial genomes are haploid. The overwhelming majority of reads (97%) support a T at this position while the reference shows A, confirming a true SNP. The remaining bases represent sequencing noise typical of ONT reads. 

<img width="455" height="305" alt="density plot variant" src="https://github.com/user-attachments/assets/00d048d3-a1fb-4544-ae22-a1ab0b34ee72" />

**Figure 3** **Density Plot of the Variant SNPs in the alignment**.
The x-axis shows genome position, and the y-axis shows how many variants occur in each 10 kb window. Most regions have very few variants, meaning the genome is highly similar to the reference. The sharp peaks mark mutation “hotspots” where many differences are concentrated in specific regions.

<img width="455" height="305" alt="variant density heatmap" src="https://github.com/user-attachments/assets/3140502e-3368-42f3-a6ce-082c889bea90" /> 

**Figure 3** **Heatmap showing the density and distribution  of variants in the alignment**.
This heatmap shows how variants are distributed along the genome in 10 kb windows. Most regions have few variants, indicating strong similarity to the reference genome. Bright regions represent mutation hotspots where variants are highly concentrated.

<img width="1000" height="500" alt="Rainfall plot" src="https://github.com/user-attachments/assets/cd5846b1-fe57-463b-92a0-44228c70c66b" />

**Figure 4** **Rainfall Plot showing the distribution of SNPs, insertions and delections** 
This rainfall plot displays each variant by genomic position on the x-axis and the log10 distance to the previous variant on the y-axis, allowing spatial mutation patterns to be visualized across NC_003197.2 and NC_003277.2. Lower y-values indicate variants occurring very close together, revealing mutation hotspots and regions of high variant density along the genome. While higher y-values represent large gaps between variants, highlighting conserved regions with relatively few sequence changes. The faceted layout shows that the plasmid (NC_003277.2) exhibits tighter clustering of variants compared to the chromosome, suggesting localized regions of higher variability. Color coding distinguishes SNPs, insertions, and deletions, demonstrating that SNPs dominate the clustered regions while indels are more sparsely distributed.

## Discussion
#### Assembly Quality
The assembly produced four contigs with high sequencing coverage, indicating strong read support and reliable consensus generation across the genome. The two largest contigs (3.32 Mb and 1.68 Mb) show coverage above 120× and are marked as non-circular, suggesting they represent the primary chromosomal segments that were not fully resolved into a single continuous sequence. Their large sizes and absence of repeats imply that the assembler was able to resolve most genomic complexity, but structural features such as unresolved joins or complex regions likely prevented full circularization. The third contig (109 kb) is marked as circular with very high coverage (188×), strongly indicating that this sequence represents a plasmid. Circularity combined with elevated coverage is characteristic of plasmid DNA, as plasmids often exist in multiple copies within bacterial cells, leading to higher read depth relative to the chromosome. The clean assembly of this contig without repeats further supports that the assembler successfully reconstructed this plasmid as a complete, biologically meaningful unit.
The smallest contig (6.2 kb) displays lower coverage (73×) and is flagged as containing repeats. This suggests it may represent a repetitive or low-complexity region that the assembler could not confidently place within the larger chromosomal contigs. Such small repeat-associated contigs are common in long-read assemblies and often arise from unresolved repeat structures or mobile genetic elements that cannot be uniquely anchored in the genome graph.
Overall, the assembly demonstrates strong workflow success: high coverage across all contigs, successful identification of a circular plasmid, and near-complete reconstruction of the chromosomal content. The presence of two large non-circular chromosomal contigs and one small repeat contig indicates minor fragmentation likely due to complex genomic regions rather than insufficient data quality. This reflects a high-quality long-read assembly where most biological structure is preserved, with only small unresolved repeat-driven segments remaining.

#### The IGV inspections
(Figures 1 and 2) validate the reliability of the variant calls and highlight the importance of manual curation alongside automated pipelines. At **NC_003197.2:103,018**, the strong read support and high base quality confirm a true SNP where guanine consistently replaces the reference thymine, demonstrating accurate alignment and confident variant detection. In contrast, the site flagged as “heterozygous” at **NC_003197.2:3,963,935** illustrates a common visualization artifact in haploid bacterial genomes, where minor sequencing noise from ONT reads can mimic mixed alleles. This reinforces that apparent heterozygosity in bacteria should be interpreted cautiously and assessed in the context of read proportions and sequencing error profiles.

#### Genome-wide visualizations 
(Figures 3 and 4) further reveal that most of the genome shows very low variant density, indicating strong similarity between the assembled genome and the reference. However, distinct peaks in the density plot and bright regions in the heatmap identify mutation hotspots where differences are concentrated within specific 10 kb windows. These localized clusters suggest regions of elevated evolutionary change rather than uniform divergence across the chromosome. Such patterns are typical of genomic regions under selective pressure, mobile genetic elements, or recombination-prone sites.

The rainfall plot provides additional resolution by showing how variants are spaced relative to one another across both the chromosome (**NC_003197.2**) and the plasmid (**NC_003277.2**). The tighter clustering of variants on the plasmid compared to the chromosome indicates that the plasmid is more variable and may be undergoing faster evolutionary change. The dominance of SNPs within these clusters, with fewer insertions and deletions, suggests that point mutations are the primary driver of sequence divergence in this dataset. Together, these observations demonstrate that while the assembly is largely conserved relative to the reference, specific genomic regions—particularly on the plasmid—exhibit concentrated variability with potential biological significance.



## References
[^1]: BiologyInsights Team. (2025, July 25). *Genome Assembly: How It Works and Why It Matters - Biology Insights*. Biology Insights. https://biologyinsights.com/genome-assembly-how-it-works-and-why-it-matters/
[^2]: BiologyInsights Team. (2025b, August 4). 5 Major Genomics Applications Changing Modern Science - Biology Insights. Biology Insights. https://biologyinsights.com/5-major-genomics-applications-changing-modern-science/  
[^3]: Chukamnerd, A., Jeenkeawpiam, K., Chusri, S., Pomwised, R., Singkhamanan, K., & Surachat, K. (2023). BacSeq: A User-Friendly Automated Pipeline for Whole-Genome Sequence Analysis of Bacterial Genomes. Microorganisms, 11(7), 1769. https://doi.org/10.3390/microorganisms11071769  
[^4]: Collins, A. (2018). The challenge of genome sequence assembly. The Open Bioinformatics Journal, 11(1), 231–239. https://doi.org/10.2174/1875036201811010231  
[^5]: Couronne, O., Poliakov, A., Bray, N., Ishkhanov, T., Ryaboy, D., Rubin, E., Pachter, L., & Dubchak, I. (2003). Strategies and tools for whole-genome alignments. Genome research, 13(1), 73–80. https://doi.org/10.1101/gr.762503
[^6]: Du, H., Liang, C. Assembly of chromosome-scale contigs by efficiently resolving repetitive sequences with long reads. Nat Commun 10, 5360 (2019). https://doi.org/10.1038/s41467-019-13355-3  
[^7]: Eren, K., Taktakoğlu, N., & Pirim, I. (2022). DNA Sequencing Methods: From Past to Present. The Eurasian journal of medicine, 54(Suppl1), 47–56. https://doi.org/10.5152/eurasianjmed.2022.22280
[^8]: Guo, Y., Song, Y., Jiang, L. et al. A detailed guide to assessing genome assembly based on long-read sequencing data using Inspector. Nat Protoc 20, 2845–2864 (2025). https://doi.org/10.1038/s41596-025-01149-5  
[^9]: Hotaling, S., Wilcox, E. R., Heckenhauer, J., Stewart, R. J., & Frandsen, P. B. (2023). Highly accurate long reads are crucial for realizing the potential of biodiversity genomics. BMC genomics, 24(1), 117. https://doi.org/10.1186/s12864-023-09193-9
[^10]: Medina-Medina, N.; Broka, A.; Lacey, S.; Lin, H.; Klings, E.; Baldwin, C.; Steinberg, M.; Sebastiani, P. Comparing Bowtie and BWA to align short reads from a RNA-Seq experiment. In Proceedings of the 6th International Conference on Practical Applications of Computational Biology & Bioinformatics, Salamanca, Spain, 28–30 March 2012; Springer: Berlin/Heidelberg, Germany, 2012.  
[^11]: Mikhail Kolmogorov, Brian Raney, Benedict Paten, Son Pham, Ragout—a reference-assisted assembly tool for bacterial genomes, *Bioinformatics*, Volume 30, Issue 12, June 2014, Pages i302–i309, [https://doi.org/10.1093/bioinformatics/btu280](https://doi.org/10.1093/bioinformatics/btu280)  
[^12]: Nakano, K.; Shiroma, A.; Shimoji, M.; Tamotsu, H.; Ashimine, N.; Ohki, S.; Shinzato, M.; Minami, M.; Nakanishi, T.; Teruya, K. Advantages of genome sequencing by long-read sequencer using SMRT technology in medical area. *Hum. Cell* **2017**, *30*, 149–161. 
[^13] Saada, B., Zhang, T., Siga, E., Zhang, J., & Magalhães Muniz, M. M. (2024). Whole-Genome Alignment: Methods, Challenges, and Future Directions. Applied Sciences, 14(11), 4837. https://doi.org/10.3390/app14114837  
[^14]: seqWell. (2024, December 11). Short-Read Sequencing vs. Long-Read Sequencing: Which Technology is Right for Your Research? seqWell, Inc. https://seqwell.com/short-read-sequencing-vs-long-read-sequencing-which-technology-is-right-for-your-research/  
[^15]: Sequencing Read Quality Control – Microbial Genome Assembly with Short Reads. (n.d.). https://genomicsaotearoa.github.io/microbial_genomics_short_reads/2.sequencing-read-qc.html  
^[16]: Tamang, S. (2025, April 24). Short-Read Sequencing: Principle, process, examples, uses. Microbe Notes. https://microbenotes.com/short-read-sequencing/  
[^17]: Tørresen, O.K.; Star, B.; Mier, P.; Andrade-Navarro, M.A.; Bateman, A.; Jarnot, P.; Gruca, A.; Grynberg, M.; Kajava, A.V.; Promponas, V.J. Tandem repeats lead to sequence assembly errors and impose multi-level challenges for genome and protein databases. *Nucleic Acids Res.* **2019**, *47*, 10994–11006.
[^18] Zhang, Z., Xiao, J., Wang, H. et al. Exploring high-quality microbial genomes by assembling short-reads with long-range connectivity. Nat Commun 15, 4631 (2024). 
[^19]: Nanopore - variant calling – nanopore sequencing. (n.d.). Software Carpentry - Nanopore Sequencing. https://otagobioinformaticsspringschool.github.io/nanopore/05-nanopore-variantcalling/index.html https://doi.org/10.1038/s41467-024-49060-z   
[^20] Qin, M., Wu, S., Li, A. et al. LRScaf: improving draft genomes using long noisy reads. BMC Genomics 20, 955 (2019). https://doi.org/10.1186/s12864-019-6337-2.

[^21] Flye - OmicsBox User Manual. (n.d.). https://docs.omicsbox.biobam.com/latest/Flye/

[^22] Genome Assembly: Hands-on Training: Oxford Nanopore Assembly using Flye. (2025, November 11). https://rcac-bioinformatics.github.io/genome-assembly/oxford-nanopore-assembly.html

[^23] Minimap2.1. (n.d.). https://lh3.github.io/minimap2/minimap2.html

[^24] samtools – Bioinformatics guidance page. (n.d.).https://scienceparkstudygroup.github.io/ibed-bioinformaticspage/source/core_tools/samtools.html

[^25] Variant calling and genotyping with bcftools | MSc Genomic Medicine CM4 module. (n.d.). https://www.chg.ox.ac.uk/bioinformatics/training/msc_gm/2024/live/bioinformatics_pipelines_for_NGS_data/extras/variant_calling/variant_calling_with_bcftools/

[^26] Robinson, J. T., Thorvaldsdóttir, H., Wenger, A. M., Zehir, A., & Mesirov, J. P. (2017). Variant Review with the Integrative Genomics Viewer. Cancer research, 77(21), e31–e34. https://doi.org/10.1158/0008-5472.CAN-17-0337

[^27] Shen, W., Sipos, B., & Zhao, L. (2024). SeqKit2: A Swiss army knife for sequence and alignment processing. iMeta, 3(3), e191. https://doi.org/10.1002/imt2.191

## Software Versions & Reproducibility
Software used for the analysis was installed via **Bioconda** and **Conda-forge** and executed within a conda environment (**Miniconda**) on an **Linux System**.
All analyses were performed using open-source software. Software versions and parameters are documented to support reproducibility of the workflow.


 Tool | Version |
|------|---------|
| SRA -tools | 3.0.5 |
| Flye | 2.9.6 |
| Seqkit | 2.10.1 |
| NanoPlot | 1.46.1 |
| Filtlong | 0.3.1 |
| minimap2 | 2.30 |
| samtools | 1.23 |
| bcftools| 2.21 |
| IGV | 2.19.7 |
| R | 4.3.1 |

