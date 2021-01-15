# Protrusionproteome <img src="man/figures/protrusionproteome_hex.png" align="right" height="150"/>

<!-- badges: start -->
[![R-CMD-check](https://github.com/demar01/protrusionproteome/workflows/R-CMD-check/badge.svg)](https://github.com/demar01/protrusionproteome/actions)
[![codecov](https://codecov.io/gh/demar01/protrusionproteome/branch/master/graph/badge.svg?token=ij1MeWsszd)](https://codecov.io/gh/demar01/protrusionproteome)
[![Lifecycle:stable](https://img.shields.io/badge/lifecycle-stable-green.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- badges: end -->
  
`protrusionproteome` is a package that contains a number of functions to  perform basic
analysis of TMT-labelled samples (cell bodies and protrusions) for proteomic experiments
published by [Dermit et al 2020](https://www.sciencedirect.com/science/article/pii/S1534580720307966).
Protein, peptide and evidence data output of [MaxQuant](http://www.nature.com/nbt/journal/v26/n12/full/nbt.1511.html) is 
contained within the package. Data is handled as SummarizedExperiment object and
functions for filtering, log2 transformations, calculating TMT ratios and median 
substation are included. Vizualization tools for QC checks of protrusion purification efficiency, protease efficiency and TMT incorporation are provided. It is also 
includes tools for statistical testing of significantly enriched protein 
categories in cell protrusions.

### Install

Once installed, load the package by writing in the console

``` r
library(protrusionproteome)
```

### Datasets for analysis

Mass-spectrometry derived TMT-datasets available in `protrusionproteome` are:

| Data  	|   Description	|
|:---	|:---	|
|  prot.raw 	|  TMT quantitative __proteomics__ analysis of protrusions and cells bodies of MDA-MB231 cells collected after 0.5, 1, 2, 4, & 8 hrs post protrusion induction (proteinGroups.txt) 	|
|  peptides.raw	|  TMT quantitative __peptide__ analysis of protrusions and cells bodies of MDA-MB231 cells collected after 0.5, 1, 2, 4, & 8 hrs post protrusion induction (peptides.txt)
|  evidence.raw	| __Information__ about the identified peptides for TMT quantitative peptide analysis of protrusions and cells bodies of MDA-MB231 cells collected after 0.5, 1, 2, 4, & 8 hrs post protrusion induction (evidence.txt)	|


### Additional information 

Please see the vignette for complete workflow description.
