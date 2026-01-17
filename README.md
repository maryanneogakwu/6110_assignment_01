### 6110_assignment_01
**Maryanne Ogakwu**
**1395098**

### Summary
This repository is for my BINF 6110 assignment 1. It will contain a Markdown file detailing genome assembly and challanges in genome assembly and alignment with a reference genome.  Down the line it will be updated with the code I'll use t assemble a specified genome and the alignment.

### Introduction
Genome Assembly Involves reconstructing an organism's genome using fragments of sequenced DNA, called sequence reads (Biology Insights Team, 2025). Common sequencing methods include Illumina sequencing, Oxford Nanopore, PacBio sequencing and Sangers sequencing, which pioneered sequencing techniques in the 70s (Eren et.al. 2022).  
Whole  Genome Alignment involves  aligning the entire genomes from different species or individuals within the same species (Couronne et. al. 2003). It helps give global perspective on genomic similarity and variation, providing insights into genetic diseases, evolutionary relationships and gene function (Saada et.al. 2024).  
Short read and long reads have been used based on the type of analysis being run and the desired results. Short reads have been used for their high precision, but they have issues when it comes down to assembly and alignment. this is due to their propensity for multiple mapping on the same genome, leading to gaps and mismatches (Tørresen et . al. 2019).Tools like BOWTIE2 and BWA have been developed for short reads, being able to process large data and pinpont small-scale geneticc variations with high accuracy (Medina et. al. 2012).  
Long reads arethousands of base pairs and have been shown to enhance genome assembly and facilitate alignment of challanging regions. Though they have high error rates and present challanges for for alignment precision (Hotaling et. al. 2016). PacBio's SMRT Analysis, Oxford  Nanoporee MinION -based Minimap2 are designed for long reads and are good at detangling complex genomic architectures and reducing gaps in assemblies (Nakano et. al. 2017).

###   Goals of Genome Assembly  
As stated by the Biology Insights Team (2025), there are a variety of ways in which genomic research has been  applied and utilized, ranging from gene annotation to agriultural productivity
1. Genome annotaion to identify locations of genes and other functional elements like promoters, CDS, and termination sites as well as predicting the functions.  
2. Identification of gene variations and mutations like SNPs that could cause diseases, aiding in development of diagnostic tools and targeted therapies.  
3. Comparative Genomic analysis of species to understand diversity between species and determine evolutionary relationships, adaptations and unique biological features
4. Developments in Crop breeding to produce crops that have desirable characteristics like pest resistance, higher yield and greater nutritional value.  




### References
1. BiologyInsights Team. (2025, July 25). *Genome Assembly: How It Works and Why It Matters - Biology Insights*. Biology Insights. https://biologyinsights.com/genome-assembly-how-it-works-and-why-it-matters/
2. BiologyInsights Team. (2025b, August 4). 5 Major Genomics Applications Changing Modern Science - Biology Insights. Biology Insights. https://biologyinsights.com/5-major-genomics-applications-changing-modern-science/  
3. Couronne, O., Poliakov, A., Bray, N., Ishkhanov, T., Ryaboy, D., Rubin, E., Pachter, L., & Dubchak, I. (2003). Strategies and tools for whole-genome alignments. Genome research, 13(1), 73–80. https://doi.org/10.1101/gr.762503  
4. Eren, K., Taktakoğlu, N., & Pirim, I. (2022). DNA Sequencing Methods: From Past to Present. The Eurasian journal of medicine, 54(Suppl1), 47–56. https://doi.org/10.5152/eurasianjmed.2022.22280  
5. Hotaling, S., Wilcox, E. R., Heckenhauer, J., Stewart, R. J., & Frandsen, P. B. (2023). Highly accurate long reads are crucial for realizing the potential of biodiversity genomics. BMC genomics, 24(1), 117. https://doi.org/10.1186/s12864-023-09193-9
6. Medina-Medina, N.; Broka, A.; Lacey, S.; Lin, H.; Klings, E.; Baldwin, C.; Steinberg, M.; Sebastiani, P. Comparing Bowtie and BWA to align short reads from a RNA-Seq experiment. In Proceedings of the 6th International Conference on Practical Applications of Computational Biology & Bioinformatics, Salamanca, Spain, 28–30 March 2012; Springer: Berlin/Heidelberg, Germany, 2012.
7. Nakano, K.; Shiroma, A.; Shimoji, M.; Tamotsu, H.; Ashimine, N.; Ohki, S.; Shinzato, M.; Minami, M.; Nakanishi, T.; Teruya, K. Advantages of genome sequencing by long-read sequencer using SMRT technology in medical area. *Hum. Cell* **2017**, *30*, 149–161.  
8. Saada, B., Zhang, T., Siga, E., Zhang, J., & Magalhães Muniz, M. M. (2024). Whole-Genome Alignment: Methods, Challenges, and Future Directions. Applied Sciences, 14(11), 4837. https://doi.org/10.3390/app14114837  
9. Tørresen, O.K.; Star, B.; Mier, P.; Andrade-Navarro, M.A.; Bateman, A.; Jarnot, P.; Gruca, A.; Grynberg, M.; Kajava, A.V.; Promponas, V.J. Tandem repeats lead to sequence assembly errors and impose multi-level challenges for genome and protein databases. *Nucleic Acids Res.* **2019**, *47*, 10994–11006.  
