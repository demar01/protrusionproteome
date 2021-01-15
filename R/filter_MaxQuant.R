#' filter_MaxQuant
#' @param proteins Data.frame,
#' Protein table originating from MaxQuant.
#' @param tofilter Character,
#' Name of the column(s) containing features to be filtered on.
#' @examples
#' if(interactive()){
#' proteins_filtered <- filter_MaxQuant(prot.raw,
#' tofilter= c("Reverse" , "Potential.contaminant" ,"Only.identified.by.site"))
#'
#' }
#' @return dataframe
#' @export
filter_MaxQuant <- function(proteins, tofilter) {
  assertthat::assert_that(is.data.frame(proteins),
                          is.character(tofilter))


  # Get columns
  cols_filt <- match(tofilter, colnames(proteins))

  # Check columns
  if(all(is.na(cols_filt))) {
    warning("No filtering applied\nSpecified tofilter ('",
            paste0(tofilter, collapse = "' and '"),
            "') do not indicate any column",
            call. = FALSE)
  }
  if(any(is.na(cols_filt))) {
    cols_filt <- cols_filt[!is.na(cols_filt)]
  }

  # Filter proteins based on 'tofilter' columns
  message("Filtering based on '", paste(tofilter, collapse = "', '"), "' column(s)")
  if (!is.null(cols_filt)) {
    NAs <- is.na(proteins[,cols_filt])
    proteins[,cols_filt][NAs] <- ""
    if (length(cols_filt) == 1) {
      proteins <- filter(proteins, proteins[,cols_filt] != "+")
    } else if(length(cols_filt) > 1) {
      proteins <-  dplyr::filter(proteins, !apply(proteins[,cols_filt] == "+", 1, any))
    }
  }

  return(proteins)
}

