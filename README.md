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
```


## Usage Examples

Cleaning your data of any NA values allows you to do statistical analyses without errors. If a user wants to remove NAs they would do:
```{r}
cleandata("cloud/df.csv")
```

