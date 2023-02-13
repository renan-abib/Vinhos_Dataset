library(tidyverse)

# Importe o arquivo
wine_dataset<- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", header = FALSE, sep=",")

# Verifique as dimensões do dataset
nrow(wine_dataset)
ncol(wine_dataset)

# Verifique se existem dados sem preenchimento. Caso existam, elimine as linhas

wine_dataset_sem_NA<- wine_dataset[complete.cases(wine_dataset), ]

print(wine_dataset_sem_NA)


# Renomeando colunas (headers)

names(wine_dataset_sem_NA)[1] <- "Class" 
names(wine_dataset_sem_NA)[2] <- "Alcohol" 
names(wine_dataset_sem_NA)[3] <- "Malic acid" 
names(wine_dataset_sem_NA)[4] <- "Ash" 
names(wine_dataset_sem_NA)[5] <- "Alcalinity of ash" 
names(wine_dataset_sem_NA)[6] <- "Magnesium" 
names(wine_dataset_sem_NA)[7] <- "Total phenols" 
names(wine_dataset_sem_NA)[8] <- "Flavanoids" 
names(wine_dataset_sem_NA)[9] <- "Nonflavanoid phenols"
names(wine_dataset_sem_NA)[10] <- "Proanthocyanins"
names(wine_dataset_sem_NA)[11] <- "Color intensity" 
names(wine_dataset_sem_NA)[12] <- "Hue" 
names(wine_dataset_sem_NA)[13] <- "OD280/OD315 of diluted wines" 
names(wine_dataset_sem_NA)[14] <- "Proline" 



# Para cada uma das colunas:
  # calcule os valores médios dos exemplares (rowmeans(df))

for (i in 2:14) {
  
  wine_with_mean[i-1]<- mean(wine_dataset_sem_NA[,i])
}

print(wine_with_mean)

# Para cada uma das colunas:
# - plote um histograma dos valores. Entenda o comportamento da coluna.

for (i in 2:14){
  hist(wine_dataset_sem_NA[,i], xlab = names(wine_dataset_sem_NA)[i], main = paste("Histogram of", names(wine_dataset_sem_NA)[i]))
}


# SOLUCAO DO DANILO
# namecol <- c("Alcohol", "Malic","acid", "Ash", "Alcalinity of ash", "Magnesium", "Total phenols", "Flavanoids", "Nonflavanoid phenols", "Proanthocyanins", "Color intensity", "Hue", "OD280/OD315 of diluted wines", "Proline")
# df <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", header = FALSE, sep = ",", col.names = namecol)


# Para cada uma das colunas:
# - plote um bloxplot de cada coluna, considerando as classes. Verifique se existem exemplares que apresentem valores muito diferentes dos demais.

for(i in 2:14){
  boxplot(wine_dataset_sem_NA[,i]~wine_dataset_sem_NA[,1], xlab = "Classes", ylab = names(wine_dataset_sem_NA)[i], main = paste("Boxplot of", names(wine_dataset_sem_NA)[i]))
}

boxplot

# - plote gráficos das colunas, duas a duas.
plot(wine_dataset_sem_NA)
