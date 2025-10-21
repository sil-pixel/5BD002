Example data for Biostat 2/Omics practicals 2025-10-21
======================================================

This is a pre-processed version of the NKI data on gene expression in breast 
cancer patients available from Bioconductor. 

This includes two data sets:

NKI_expr.txt contains the expression data for 337 patients and 8,580 genes

NKI_clin.txt contains the corresponding clinical data in eight variables:

  * ID: unique patient identifier
  * Age: age at diagnosis
  * Size: primary tumor size in cm
  * Grade: tumor grade 1-3 (higher is worse)
  * LN: affected lymph nodes, 0=no, 1=yes 
  * ERstat: estrogen receptor status of tumor, -/+ (- is worse)
  * BCRAmut: patient carries BRCA mutation yes/no (yes is worse)
  * Source: batch variable indicating source of material (NKI, NKI2)
  

Alexander.Ploner@ki.se    2025-10-17
  