#' make_TMT_se
#' Data.frame to SummarizedExperiment object
#' conversion using file information and user input
#' @param proteins_unique Data.frame,
#' Protein table with unique names annotated in the 'name' column
#' (output from \code{\link{make_unique}()}).
#' @param columns_positions Integer,
#' position of columns that contain experiment quantitative data
#' @param intensities  Character,
#' names of columns that contain experiment quantitative data
#' @param time_unit Integer,
#' unit of time in that defines the experiment
#' @param time_span Integer,
#' number of times that the time_unit is repeated at the experimental timepoint
#' @param numerator Character,
#' condition of interest (prot)
#' @param denominator character,
#' condition to make relative (body)
#' @param sep Character,
#' The separator used to parse the column header
#' @return A SummarizedExperiment object
#' with log2-transformed values, normalised to control and median subtracted
#' (by column).
#' @examples
#' if(interactive()){
#' # Load example
#' data <- prot.raw
#' data <- data[data$Reverse != "+" & data$Potential.contaminant != "+" &
#' data$Reverse != "+" ,]
#' data_unique <- make_unique(data, "Gene.names", "Protein.IDs", delim = ";")
#'
#' columns_positions<-str_which(colnames(data_unique),
#' "Reporter.intensity.corrected.(\\d)+.(\\d)")
#' intensities <- colnames(data_unique)[str_which(colnames(data_unique),
#' "Reporter.intensity.corrected.(\\d)+.(\\d)")]
#' # Make SummarizedExperiment
#' se <- make_TMT_se(data_unique,columns_positions,intensities,
#' time_unit=30,
#' time_span=c(1,2,4,8,16),
#' numerator= "prot",
#' denominator= "body",
#' sep = "_")
#'}
#' @import SummarizedExperiment
#' @import stringr
#' @import dplyr
#' @importFrom tidyr unite
#' @importFrom stats median
#' @importFrom stringr str_remove
#' @importFrom lubridate minute
#' @importFrom lubridate minutes
#' @export
make_TMT_se <- function (proteins_unique,
                                columns_positions,
                                intensities,
                                time_unit=30,
                                time_span=c(1,2,4,8,16),
                                numerator= "prot",
                                denominator= "body",
                                sep = "_"){

  assertthat::assert_that(is.data.frame(proteins_unique),
                          is.integer(columns_positions),
                          is.character(intensities),
                          is.numeric(time_unit),
                          length(time_unit) == 1,
                          is.numeric(time_span),
                          is.character(numerator),
                          length(numerator) == 1,
                          is.character(denominator),
                          length(denominator) == 1,
                          is.character(sep),
                          length(sep) == 1)

  if (any(!c("name") %in% colnames(proteins_unique))) {
    stop("'name' and/or columns are not present in '",
         deparse(substitute(proteins_unique)), "
         '.\nRun make_unique() to obtain the required columns",
         call. = FALSE)    }
  if (any(!apply(proteins_unique[, columns_positions], 2, is.numeric))) {
    stop("specified 'columns' should be numeric",
         "\nRun make_se_parse() with the appropriate columns as argument",
         call. = FALSE)    }

  # If input is a tibble, convert to data.frame
  if (tibble::is_tibble(proteins_unique))
    proteins_unique <- as.data.frame(proteins_unique)

  ########
  # Select the assay data
  rownames(proteins_unique) <- proteins_unique$name
  raw <- proteins_unique[, columns_positions]
  raw[raw == 0] <- NA
  raw <- log2(raw)

  #rename
  colnames(raw) <- str_c(minute(rep(minutes(x = time_unit) *time_span,each=2)),c("body","prot"),sep=sep)

  #combine
  raw2<-raw[,str_detect(colnames(raw),str_c(numerator, collapse="|"))]-
    raw[,str_detect(colnames(raw),str_c(denominator, collapse="|"))]
  #substract median
  raw2 <- raw2 %>%
    mutate_all(funs(.- median(.,na.rm = TRUE)))
  rownames(raw2) <-rownames(raw)

  #####
 # colnames(raw2) <- colnames(raw2) %>% make.names()
  row_data <- proteins_unique[, -columns_positions]
  rownames(row_data) <- row_data$name
  col_data <- data.frame(label = colnames(raw2), stringsAsFactors = FALSE) %>%
    mutate(condition = str_extract(label,"(\\d)+"),
           replicate = 1) %>%
    tidyr::unite(ID, condition, replicate, remove = FALSE)
  rownames(col_data) <- col_data$ID
  colnames(raw2)[match(col_data$label, colnames(raw2))] <- col_data$ID
  raw2 <- raw2[, !is.na(colnames(raw2))]
  se <- SummarizedExperiment::SummarizedExperiment(assays = as.matrix(raw2), colData = col_data, rowData = row_data)
  return(se)
}


