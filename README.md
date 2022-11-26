---
title: "README.Rmd"
author: "Camden Oathout"
date: "`r Sys.Date()`"
output: html_document
---


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# An Introduction to My R Package

This R package helps user analyze environmental DNA presence absence data. The package has functions for cleaning your data set, visualizing your data, and NMDS analyses. With this package you can create plots showing which samples and sample locations have certain species you detected. You can also begin to compare community structures using the NMDS Matrix function. 

## Installing the R Package eDNAproject

To install the R package eDNAproject enter the following code into your console. This package will include functions from vegan and tidyverse as well as functions unique to this package.

```{r}
install.packages("eDNAproject")
library(eDNAproject)
```

## Installation of other packages

```{r}
install.packages("tidyverse")
install.packages("vegan")
```


## Downloading Data for Package

To download your data for this package click on the upload button in the 'Files' tab of your R window. Select **.csv file** containing your eDNA data.  Once your data are in your 'Files' tab it's now time to make it usable in R. Insert the following code into your console. Modify it to match the name of your file. If you wish to follow this tutorial using the same data use the following link [https://github.com/Cam-Oathout/Oathout_pkg/blob/master/Data/eDNA_data.csv]

```{r}
eDNAdata <- read_csv("/cloud/project/Data/eDNA_data.csv")
```

```{r}
gs4_deauth()
eDNAdata <- read_sheet("https://docs.google.com/spreadsheets/d/1lMp2A8f9x1RYD1ukTu2qg5BzL9FkPLUELQqxUSuQghI/edit#gid=0")
```

## Function in This Package and How to Use Them

There are four functions unique to this package. This section of the tutorial will go through how to use each one of them and why you might use it.

### Data Cleaning

The first function is a data cleaning function, specifically the goal is to remove any NA values from the data set. Removing NA values manually before uploading a data set to R can be time consuming and if you don't remove all NA values any mathematical calculations you want to do later in your analysis may be disrupted by these 0 values.

In this package our data clean function is called **cleandata()**. It takes a file path argument to where you have uploaded your data set.

Enter the following code into your R console.

```{r}
cleandata("/cloud/project/Data/eDNA_data.csv")
```

If everything worked properly, R should return the cleaned data set.

### Creating New Columns

The second function adds a new column to your data set based off of data you already have. Let's say you have individual species counts for each study region and you want to know how many total species you have for that region. This function allows you to select a range of columns and create a new column based on the sum in those column ranges for each study region.

In this package, this function is known as **addcol()**. It takes the object you named your data, the name of the first column where you want your count to begin, and the name of the second column where you want your count to end.

Enter the following code into your R console.

```{r}
eDNAdata2 <- addcol(eDNAdata, "Alosa_sp", "Trinectes_maculatus")

eDNAdata2
```
If the everything worked properly R should return the data set and you should see one extra column added.

### Presence Absence Visualization

An important aspect of analyzing eDNA data is detecting where a species is present or where a species is absent. You could look through your 1's and 0's data set to find out which sample locations have different species or you can visualize it.

In this package visualizing presence/absence data is accomplished through the function **pres.abs.plot()**. This function takes similar arguments to ggplot. You will need the data object, a column name for the x-axis, a column name for the y-axis, and a species column name.

Enter the following code into your R console.

```{r}
pres.abs.plot(eDNAdata, Year, Reef_Location, Anguilla_rostrata)
```

If everything worked properly R should return a plot. Species presence is represented in light blue and species absence is represented in dark blue.

### Preparing your Data for an NMDS analysis

An NMDS is a non-metric multi-dimensional scaling. This type of analysis allows us to look at how many different variables may impact our community composition. The goal of this function is to set up your data in a way that can be used for the NMDS analysis function in the package vegan.

In this package, setting up the NMDS matrix is accomplished using the function **NMDSmatrix()**. To fulfill this function's arguments you will need the object of the data set containing total species counts, the column name of your locations of interest, the column name of a variable you want to see the effect of, and the column name of your total species counts.

Enter the following code into your R console.

```{r}
NMDSmatrix(eDNAdata2, Reef_Location, Reef_Material, n)
```

If everything worked properly you should see a data matrix with your desired locations and variables, with the species counts in each column. Anythings that popped up as a zero should be reported as NA. 


### Usage Examples (TLDR Package Tutorial)

Cleaning your data of any NA values allows you to do statistical analyses without errors. If a user wants to remove NAs they would do:
```{r}
cleandata("cloud/df.csv")
```

Adding a column to your data frame to include all the counts of unique species detected in each sample. If a user wants to add a new column of species counts they would:
```{r}
addcol(data, "col1", "col2")
```

Visualizing the presence or absence of a species based on other parameters in the data frame. If a user wants to visualize their presence absence data they would:
```{r}
pres.abs.plot(df, x, y, col)
```

Creating a matrix from your data frame to make an NMDS plot. If a user want to format portions of their data frame to conduct NMDS analyses they would:
```{r}
NMDSmatrix(data, col1, col2, col3)
```

