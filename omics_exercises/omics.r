########################################### 20-10-2025 setup ########################################################

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ALL")

library(ALL)
data(ALL)
show(ALL)

print(summary(pData(ALL)))

hist(cvv <- apply(exprs(ALL),1,function(x)sd(x)/mean(x)))

ok <- cvv > .08 & cvv < .18
fALL <- ALL[ok,]
show(fALL)

allx2 <- data.frame(t(exprs(fALL)), class=ALL$BT)

install.packages("rpart")
install.packages("mice")
library(rpart)
rp1 <- rpart(class~.,data=allx2)
plot(rp1)
text(rp1)

####################################################### 21-10-2025 practical #########################################


NKI_clin <- read.delim("~/Downloads/Masters/Term5/Biostat2/Exercises/NKI_clin.txt")
NKI_expr <- read.delim("~/Downloads/Masters/Term5/Biostat2/Exercises/NKI_expr.txt")
boxplot(NKI_expr[25:60], outline = TRUE, las = 2)

boxplot(NKI_expr[25:60], outline = FALSE, las = 2)

# histogram of gene expression mean of each individual
hist(colMeans(NKI_expr))

# heat map of the patients to see how similar they are

d <- dist(t(NKI_expr))  # distance between samples (transpose to have samples as columns)
heatmap(as.matrix(d))


# PCA 

## PCA can help in adjusting for say, population confounder when clustering is seen within population subgroups

pca <- prcomp(t(NKI_expr), scale. = TRUE)
plot(pca$x[,1], pca$x[,2],
     xlab = "PC1", ylab = "PC2",
     main = "PCA of NKI expression data")

# shows no difference from the different sources
plot(pca$x[,1], pca$x[,2], col = as.factor(NKI_clin$Source), pch = 19)
legend("topright", legend = unique(NKI_clin$Source), col = 1:2, pch = 19)

# shows a bit clustering of ERstat + and -
plot(pca$x[,1], pca$x[,2], col = as.factor(NKI_clin$ERstat), pch = 19)
legend("topright", legend = unique(NKI_clin$ERstat), col = 1:2, pch = 19)

# too many missing data to see any relation
plot(pca$x[,1], pca$x[,2], col = as.factor(NKI_clin$BRCAmut), pch = 19)
legend("topright", legend = unique(NKI_clin$BRCAmut), col = 1:2, pch = 19)

# Hierarchical Clustering

hc <- hclust(dist(t(NKI_expr)), method = "ward.D2")
plot(hc, labels = NKI_clin$ERstat, main = "Clustering of samples")


