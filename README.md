---
title: "README.Rmd"
author: "Camden Oathout"
date: "`r Sys.Date()`"
output: html_document
---


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Introduction
  This R package helps user analyze environmental DNA presence absence data. The package has functions for linear models, ANOVA, and NMDS analyses. With this package you can create plots showing which samples and sample locations have certain species you detected. You can also compare community structures using the NMDS analysis function. 
  
## Installation

```{r}
install.packages("tidyverse")
install.packages("vegan")
```


## Usage Examples

Cleaning your data of any NA values allows you to do statistical analyses without errors. If a user wants to remove NAs they would do:
```{r}
cleandata("cloud/df.csv")
```

Adding a column to your data frame to include all the counts of unique species detected in each sample. If a user wants to add a new column of species counts they would:
```{r}
addcol(data, col1, col2)
```

Visualizing the presence or absence of a species based on other parameters in the data frame. If a user wants to visualize their presence absence data they would:
```{r}
pres.abs.plot(df, x, y, col)
```

Creating a matrix from your data frame to make an NMDS plot. If a user want to format portions of their data frame to conduct NMDS analyses they would:
```{r}
NMDSmatrix(data, col1, col2, col3)
```

