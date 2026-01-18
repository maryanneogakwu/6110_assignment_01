## 6110_assignment_01
**Maryanne Ogakwu**
**1395098**

## Summary
This repository is for my BINF 6110 assignment 1. It will contain a Markdown file detailing genome assembly and challanges in genome assembly and alignment with a reference genome.  Down the line it will be updated with the code I'll use t assemble a specified genome and the alignment.

## Introduction
#### Genome Assembly
Genome Assembly Involves reconstructing an organism's genome using fragments of sequenced DNA, called sequence reads (Biology Insights Team, 2025). Common sequencing methods include Illumina sequencing, Oxford Nanopore, PacBio sequencing and Sangers sequencing, which pioneered sequencing techniques in the 70s (Eren et.al., 2022). 
#### Whole Genome Alignment
Whole  Genome Alignment involves  aligning the entire genomes from different species or individuals within the same species (Couronne et. al., 2003). It helps give global perspective on genomic similarity and variation, providing insights into genetic diseases, evolutionary relationships and gene function (Saada et.al., 2024).  
Short read and long reads have been used based on the type of analysis being run and the desired results. 
#### Short read sequences
Short reads have been used for their high precision, but they have issues when it comes down to assembly and alignment. this is due to their propensity for multiple mapping on the same genome, leading to gaps and mismatches (Tørresen et . al., 2019).Tools like BOWTIE2 and BWA have been developed for short reads, being able to process large data and pinpont small-scale geneticc variations with high accuracy (Medina et. al., 2012).  
### Long read sequences
Long reads are thousands of base pairs and have been shown to enhance genome assembly and facilitate alignment of challanging regions. Though they have high error rates and present challanges for for alignment precision (Hotaling et. al., 2016). PacBio's SMRT Analysis, Oxford  Nanoporee MinION -based Minimap2 are designed for long reads and are good at detangling complex genomic architectures and reducing gaps in assemblies (Nakano et. al., 2017).

##   Goals of Genome Assembly  
As stated by the Biology Insights Team (2025), there are a variety of ways in which genomic research has been  applied and utilized, ranging from gene annotation to agriultural productivity
1. Genome annotaion to identify locations of genes and other functional elements like promoters, CDS, and termination sites as well as predicting the functions.  
2. Identification of gene variations and mutations like SNPs that could cause diseases, aiding in development of diagnostic tools and targeted therapies.  
3. Comparative Genomic analysis of species to understand diversity between species and determine evolutionary relationships, adaptations and unique biological features
4. Developments in Crop breeding to produce crops that have desirable characteristics like pest resistance, higher yield and greater nutritional value.

## Challanges in Genome assembly and alignment
As powerful and efficient as long read and short read assemblies are, both techniques come with their drawbacks, especially when using a reference genome to conduct the alignment, as opposed to using de novo techniques. Somedrawbacks to connsider are:  
1. Error prone refernce: construction of a reference genome from improper or incomplete sequencing can lead to errors that mislead research and affect the accuracy of genetic studies (Guo et. al., 2025).
2. DNA fragmentation: Short Read sequencing technologies often produce fragmented, incomplete assemblies, leading to misalignment (Tamang, 2025).  
3. Repeatitve DNA sequences: these make it dificult for assembly algorithms to determine and arrange the fragment reads in the correct order, leading to misassemblies and gaps (Tørresen et. al., 2019).
4. Shorter reads offer less overlap information and require higher coverage to achieve a good assembly (seqWell, 2024).
5. Computational Demands: long read and optical mapping techniques used in building robust chromosome level scaffolds are technically challenging and needs high quality data, which can be limited by computational errors and increased costs (Collins, 2018).
6. Maps with Low resolution: these may be too coarse to give accurate positioning and orientation of relatively short sequence contigs (Du et. al., 2019).
7. Dependence on data quality: Poor-quality sequencing reads or contaminated samples can lead to fragmented assemblies and unreliable downstream results (Sequencing Read Quality Control).

## Proposed Algorithms, Pros and Cons  

### BacSeq  
The Paper "BacSeq: A User-Friendly Automated Pipeline for Whole-Genome Sequence Analysis of Bacterial Genomes" by Chukamnerd et. al. in 2023, presented an all in one package that carried out multiple funtions and was beginner friendly. It is an open source, java-based GUI that combines multiple tools to simplify bacterial whole genome sequencing. It can performing quality checks, genome assembly, evaluation, annotation, drug resistance and virulence gene detection. The BacSeq pipeline supports pan-genome analysis, SNP-based phylogenetic tree construction, and detection of CAZymes and CRISPR-Cas systems.  
####  Pros of the BacSeq package  
1. The GUI based design reduces reliance on command-line use and makes it is accessible to non-bioinformaticians.  
2. The program supports hybrid assembly, integrating short and long read sequences, further improving genome completedness.  
3.  It integrates many widelyused tools like FastQC, SPAdes, Prokka, FastTree and Roary into a single automated workflow.
4.  Supports clinical and epidemiological diagnostic tests, efficiently identifying antimicrobial resistance genes, virulence factors, SNPs, Plasmids and Phylogenetic Relationships.  
5.The program can handle multiple isolates simlutaneously, making it suitable for comparative genomics across collections of bacterial genomes.

#### Cons of the BacSeq package  
1. Despite the package having a user firndly GUI, it only supports Linux systems, which limits the access to MacOS and Windows users.
2. The package still requires sufficient computational processing power and memory, especially when being used for multi-isolate analyses.
3. The BacSeq packages is designedd  for isolated bacterial genomes and not complex metagenomic analysis.  
4. Assembly quality can be reduced if poor quality or contaminated equencing data is included, which leads to fragmented assemblies and misleading downstream results.  
5. External tools like Kraken aree required to detect or remove contaminant sequences, undermining the "one package does it all" goal.  

### Pangaea
Pangaea is a de novo metagenomic assembler introduced in the paper "Exploring high-quality microbial genomes by assembling short-reads with long-range connectivity" by Zhang et. al. in 2024. It was designed to improve genome reconstruction from short reads with physical barcodes (linked-reads) or virtual barcodes (derived from aligning short-reads to long-reads). Pangaea focuses on reducing assembly complexity and addressing the challenges posed by highly uneven microbial abundances.This program provides a scalable and reference-free solution for recovering high-quality microbial genomes, making it particularly valuable for population-scale and clinical metagenomic studies. Although this software is meant for genome assembly without use of a scaffold, an the assignment requires alignment of the assembled genome with a refernce genome, I wanted to include it in my my write up, as it I feel it is a good tool and would like to learn how to use it.  

#### Pros of Pangaea package  
1. It is a cost efficient alternative to long read sequencing, as it achieves near-complete and even circular microbial genomes using short-reads with long-range connectivity, reducing reliance on expensive deep long-read sequencing.
2. It is generalizable to hybrid assemblies, meaning it can also work with virtual barcodes derived from short–long read hybrid data, extending its usefulness beyond linked-read technologies.
3. There is a recovery of high quality genomes due to the generation of multiple near-complete and circular MAGs demonstrates the method’s ability to reconstruct biologically meaningful, high-quality genomes.
4. There is a strong performance across abundance ranges as the combination of co-barcoded read binning and multi-thresholding reassembly improves assemblies for high-, medium-, and low-abundance microbes, which is a major limitation of many existing assemblers.  

#### Cons of Pangaea package
1. Computational complexity due to the use of deep learning (VAE-based binning), multiple assembly stages, and ensemble merging increases computational cost and pipeline complexity compared to standard short-read assemblers.
2. There is more focus on gut microbiomes as most real-data benchmarking is on human gut samples so the program's performance in other complex environments like soil, marine and host-associated niches remains to be fully demonstrated.
3. The packages' performance strongly depends on barcode specificity and quality. Older linked-read technologies like 10x Genomics with high fragments-per-barcode, yield poorer results.
4. Extremely rare microbes with a low abundance of approximately <0.001% remain largely unrecoverable, highlighting a fundamental limitation of current sequencing depths.

### Ragout  
This is a reference assisted scoffolding tool introduced in the paper "Ragout—a reference-assisted assembly tool for bacterial genomes" by Kolmogorov et. al. in 2014. Ragout is an open-source bioinformatics tool designed to improve draft bacterial genome assemblies by ordering and orienting contigs using multiple complete reference genomes. Ragout is its use of multi-scale synteny blocks combined with iterative scaffolding and assembly graph refinement, allowing it to incorporate both large and small contigs while minimizing misassemblies. It uses multiple related bacterial genomes for assembly, rather than using just a single refernce genome, incorporating evolutionary relationships among references through a phylogenetic tree and uses a genome rearrangement framework to infer the correct ordering of contigs, even in the presence of structural variations such as inversions and translocations. According to the authors "Benchmarking on simulated and real bacterial datasets shows that Ragout consistently produces fewer misordered contigs, higher genome coverage, and fewer scaffolds compared to existing reference-assisted tools such as Mauve Contig Mover, OSLay, and RACA."    

#### Pros of Ragout
1. The use of multiple refernce genomes reduces errors caused by reliance on a single refernce, ultimately improving robustness in the presence of genome arrangements.  
2. It provides an improved assembly quality, producing high coverage, fewer scaffolds, less misordered contigs, and near chromosome level assemblies.  
3. Ragout enables high-quality assemblies from short-read data without requiring expensive long read sequencing, making it a cost effective option.  
4. It handles structural variation efficiently, performing well when refernce and target genomes differ by inversions, translocations or indels.  
5. It incorporates evolutionary relationships to make accurate biologically informed contig orders.  

#### Cons of Ragout  
1. Performance of the program reduces when there are only few or distantly related refernce genomes available. This makes it more difficult to accurately assemble rarer bacterial genomes.
2. This program is limited to bacterial genomes because it relies on Sibelia for synteny block construction, which works best for closely related microbial species.
3. There is a risk of refernce bias, making novel genomic structures or strain-specific arrangements in the target genome misassembled.
4. The use of the breakpoint graph and matching algoryms increase computational complexty campared to simpler scaffolding tools.
5. It is less effective with highly divergent refernces, resulting in an accuracy decrease when refernces contain extensive rearrangements or break point reuse.

## Planned workflow
1. Data acquisition: obtaining raw reads as well as the reference genome.  
2. Raw read Quality Control: carried out with NanoPlot and FastQC, to assess read length and quality to ensure it is suitable for assembly.
3. De novo Genome Assembly: generating a draft assembly of contigs using the Flye tool.
4. Assembly Polishing: improving base-level accuracy and producingg a high-quality consensus genome.  
5. Reference-Assisted Scaffolding with Ragout: order and orient contigs using one or more closely related Salmonella reference genomes to Produce a more complete and biologically accurate genome assembly.
6. Assembly Evaluation: confirmation of assembly quality, completedness and contiguity.
7. Variant Calling: alignment to detect genetic differences between your isolate and the reference genome using Minimap2.
8. Visualization: Visualize genome alignment and structural differences and interpret results to support biological conclusions using IGV for variants and Bandage for an assembly graph  

## References
1. BiologyInsights Team. (2025, July 25). *Genome Assembly: How It Works and Why It Matters - Biology Insights*. Biology Insights. https://biologyinsights.com/genome-assembly-how-it-works-and-why-it-matters/
2. BiologyInsights Team. (2025b, August 4). 5 Major Genomics Applications Changing Modern Science - Biology Insights. Biology Insights. https://biologyinsights.com/5-major-genomics-applications-changing-modern-science/  
3. Chukamnerd, A., Jeenkeawpiam, K., Chusri, S., Pomwised, R., Singkhamanan, K., & Surachat, K. (2023). BacSeq: A User-Friendly Automated Pipeline for Whole-Genome Sequence Analysis of Bacterial Genomes. Microorganisms, 11(7), 1769. https://doi.org/10.3390/microorganisms11071769  
4. Collins, A. (2018). The challenge of genome sequence assembly. The Open Bioinformatics Journal, 11(1), 231–239. https://doi.org/10.2174/1875036201811010231  
5. Couronne, O., Poliakov, A., Bray, N., Ishkhanov, T., Ryaboy, D., Rubin, E., Pachter, L., & Dubchak, I. (2003). Strategies and tools for whole-genome alignments. Genome research, 13(1), 73–80. https://doi.org/10.1101/gr.762503
6. Du, H., Liang, C. Assembly of chromosome-scale contigs by efficiently resolving repetitive sequences with long reads. Nat Commun 10, 5360 (2019). https://doi.org/10.1038/s41467-019-13355-3  
7. Eren, K., Taktakoğlu, N., & Pirim, I. (2022). DNA Sequencing Methods: From Past to Present. The Eurasian journal of medicine, 54(Suppl1), 47–56. https://doi.org/10.5152/eurasianjmed.2022.22280
8. Guo, Y., Song, Y., Jiang, L. et al. A detailed guide to assessing genome assembly based on long-read sequencing data using Inspector. Nat Protoc 20, 2845–2864 (2025). https://doi.org/10.1038/s41596-025-01149-5  
9. Hotaling, S., Wilcox, E. R., Heckenhauer, J., Stewart, R. J., & Frandsen, P. B. (2023). Highly accurate long reads are crucial for realizing the potential of biodiversity genomics. BMC genomics, 24(1), 117. https://doi.org/10.1186/s12864-023-09193-9
10. Medina-Medina, N.; Broka, A.; Lacey, S.; Lin, H.; Klings, E.; Baldwin, C.; Steinberg, M.; Sebastiani, P. Comparing Bowtie and BWA to align short reads from a RNA-Seq experiment. In Proceedings of the 6th International Conference on Practical Applications of Computational Biology & Bioinformatics, Salamanca, Spain, 28–30 March 2012; Springer: Berlin/Heidelberg, Germany, 2012.  
11. Mikhail Kolmogorov, Brian Raney, Benedict Paten, Son Pham, Ragout—a reference-assisted assembly tool for bacterial genomes, *Bioinformatics*, Volume 30, Issue 12, June 2014, Pages i302–i309, [https://doi.org/10.1093/bioinformatics/btu280](https://doi.org/10.1093/bioinformatics/btu280)  
12. Nakano, K.; Shiroma, A.; Shimoji, M.; Tamotsu, H.; Ashimine, N.; Ohki, S.; Shinzato, M.; Minami, M.; Nakanishi, T.; Teruya, K. Advantages of genome sequencing by long-read sequencer using SMRT technology in medical area. *Hum. Cell* **2017**, *30*, 149–161.  
13. Saada, B., Zhang, T., Siga, E., Zhang, J., & Magalhães Muniz, M. M. (2024). Whole-Genome Alignment: Methods, Challenges, and Future Directions. Applied Sciences, 14(11), 4837. https://doi.org/10.3390/app14114837  
14. seqWell. (2024, December 11). Short-Read Sequencing vs. Long-Read Sequencing: Which Technology is Right for Your Research? seqWell, Inc. https://seqwell.com/short-read-sequencing-vs-long-read-sequencing-which-technology-is-right-for-your-research/  
15. Sequencing Read Quality Control – Microbial Genome Assembly with Short Reads. (n.d.). https://genomicsaotearoa.github.io/microbial_genomics_short_reads/2.sequencing-read-qc.html  
16. Tamang, S. (2025, April 24). Short-Read Sequencing: Principle, process, examples, uses. Microbe Notes. https://microbenotes.com/short-read-sequencing/  
17. Tørresen, O.K.; Star, B.; Mier, P.; Andrade-Navarro, M.A.; Bateman, A.; Jarnot, P.; Gruca, A.; Grynberg, M.; Kajava, A.V.; Promponas, V.J. Tandem repeats lead to sequence assembly errors and impose multi-level challenges for genome and protein databases. *Nucleic Acids Res.* **2019**, *47*, 10994–11006.
18. Zhang, Z., Xiao, J., Wang, H. et al. Exploring high-quality microbial genomes by assembling short-reads with long-range connectivity. Nat Commun 15, 4631 (2024). https://doi.org/10.1038/s41467-024-49060-z   
