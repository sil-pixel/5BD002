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
trait as in the simulated data. For any follow-up bioinformatic analysis like
gene-set enrichment, the real summary data should give more sensible results
than the association results from your simulated genotypes.

Simulated data was generated using HAPNEST software
https://academic.oup.com/bioinformatics/article/39/9/btad535/7255913


ICAM2: ICAM2 plasma protein levels
    - publication: https://www.nature.com/articles/s41586-023-06592-6
    - summary statistics source: https://metabolomips.org/ukbbpgwas/
