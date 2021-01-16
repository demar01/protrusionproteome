#' 1D enrichment analysis calculated with enrichR
#'
#' \code{enrich_1D} tests for deferentially enriched proteins (1D enrichment).
#'
#' @param se SummarizedExperiment,
#' Data object containing processed proteomics data
#' @param timepoint integer
#' Timepoint to do enrichment analysis
#' @param dbs Character
#' Character vector of databases to search
#' @param number_dbs integer
#' @examples
#' if(interactive()){
#' enrichment_table <- enrich_1D(se,timepoint= 5, dbs ="GO_Molecular_Function_2018",number_dbs=1)
#' }
#' @return A tibble
#' with enrichment terms, p-values etc
#' @import enrichR
#' @importFrom utils installed.packages
#' @export
enrich_1D <- function (se,
                       timepoint= 5,
                       dbs = "GO_Molecular_Function_2018",
                       number_dbs=1) {

  assertthat::assert_that(inherits(se, "SummarizedExperiment"),
                          is.character(dbs))


  # Check whether 'enrichR' is installed
  if(!"enrichR" %in% rownames(installed.packages())) {
    stop("test_enrichR() requires the 'enrichR' package",
         "\nTo install the package run: install.packages('enrichR')")
  }

  # Check for valid databases
 libraries <- enrichR::listEnrichrDbs()$libraryName
 # if(all(!dbs %in% libraries)) {
 #   stop("Please run `enrich_1D()` with valid databases as argument",
 #        "\nSee http://amp.pharm.mssm.edu/Enrichr/ for available databases")
 #  }
  if(any(!dbs %in% libraries)) {
    dbs <- dbs[dbs %in% libraries]
    message("Not all dbs found",
            "\nSearching the following databases: '",
            paste0(dbs, collapse = "', '"), "'")
  }

  df<-as.data.frame(assay(se))
  df<-data.frame(rownames(df),df[,timepoint])
  enriched <- enrichr(as.character(df$rownames.df.), dbs)
  enriched <- enriched[[number_dbs]] %>% as_tibble()
  return(enriched)
}
