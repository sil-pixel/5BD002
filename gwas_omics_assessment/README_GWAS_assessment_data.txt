This folder contains individual-level genotype and phenotype data from a
simulated genome-wide association study (GWAS), for the Karolinska Institutet
course 5BD002 HT25.

The genotypes are in plink binary format (.bed/.bim/.fam) as described at
https://www.cog-genomics.org/plink/1.9/formats#bed

Coordinates in the genotype files follow reference genome build GRCh38.

Phenotype data is included in the sixth column of the .fam file. See
https://www.cog-genomics.org/plink/1.9/formats#fam for phenotype coding
conventions.

Included is also a file with summary statistics from a real GWAS on the same
trait as in the simulated data. These files are not required for any task in the
assessment, but are provided mostly for comparison. However, should you decide
to do any follow-up bioinformatic analysis like gene-set enrichment, the real
summary data should give more sensible results than the association results from
your simulated genotypes.

Simulated data was generated using HAPNEST software
https://academic.oup.com/bioinformatics/article/39/9/btad535/7255913

Dataset names correspond to phenotypes as follows:

ALZ: Alzheimer's disease
    - publication: https://www.nature.com/articles/s41588-021-00921-z
    - summary statistics source: https://cncr.nl/research/summary_statistics/

BIP: Bipolar disorder
    - publication: https://www.nature.com/articles/s41586-024-08468-9
    - summary statistics source: https://figshare.com/articles/dataset/bip2024/27216117

BMI: Body mass index
    - publication: https://academic.oup.com/hmg/article/27/20/3641/5067845
    - summary statistics source: https://giant-consortium.web.broadinstitute.org/index.php/GIANT_consortium_data_files#BMI_and_Height_GIANT_and_UK_BioBank_Meta-analysis_Summary_Statistics


CPD: Smoking (cigarettes per day)
    - publication: https://www.nature.com/articles/s41588-018-0307-5
    - summary statistics source: https://conservancy.umn.edu/handle/11299/201564


DPW: Alcohol consumption (drinks per week)
    - publication: https://www.nature.com/articles/s41588-018-0307-5
    - summary statistics source: https://conservancy.umn.edu/handle/11299/201564


SCZ: Schizophrenia
    - publication: https://www.nature.com/articles/s41586-022-04434-5
    - summary statistics source: https://figshare.com/articles/dataset/scz2022/19426775
