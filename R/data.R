#' proteinGroups file from MaxQuant of a TMT experiment of MDA-MB231 cell
#' protrusions and bodies during a timecourse experiment.
#' The dataset contains the proteinGroup.txt output file from
#' \href{http://www.maxquant.org}{MaxQuant}.
#' @format A dataframe with 5905 rows and 107 variables.
#' The important variables are as follows:
#' \describe{
#'   \item{Protein.IDs}{Uniprot IDs}
#'   \item{Majority.protein.IDs}{Uniprot IDs of major protein(s) in the protein group}
#'   \item{Razor...unique.peptides}{Number of peptides used for the quantification of this protein group}
#'   \item{Unique.peptides}{Number of peptides identified which are unique for this protein group}
#'   \item{Reporter.intensity.corrected. (10)}{TMT-MS3 quantitative relative abundance metrics.Reporter intensity correct x where x ranges from 0 to 9. Reporter intensity correct 0 corresponds to the TMT 126C TMT tag, Reporter intensity correct 1 corresponds to the TMT 127N TMT tag, and so on. Reporter intensity correct 9 corresponds to the TMT 131N tag}
#'   \item{Protein.names}{Full protein names}
#'   \item{Gene.names}{Gene name}
#'   \item{Fasta.headers}{Header as present in the Uniprot fasta file}
#'   \item{Only.identified.by.site}{The protein is only identified by a modification site if marked ('+').}
#'   \item{Reverse}{The protein is identified in the decoy database if marked ('+')}
#'   \item{Potential.contaminant}{The protein is a known contaminant if marked ('+')}
#' }
#' @return A data.frame
#' @source Dermit et al 2020.
#' Subcellular mRNA Localization Regulates Ribosome Biogenesis in Migrating Cells
#' Developmental Cell Volume 55, Issue 3, 9 November 2020, Pages 298-313.e10.
#' \href{https://www.cell.com/developmental-cell/pdfExtended/S1534-5807(20)30796-6}.
#' @examples
#' head(prot.raw)
"prot.raw"
#' peptides file from MaxQuant of a TMT experiment of MDA-MB231 cell
#' protrusions and bodies during a timecourse experiment.
#' The dataset contains the peptides.txt output file from
#' \href{http://www.maxquant.org}{MaxQuant}.
#' @format A dataframe with 5905 rows and 107 variables.
#' The important variables are as follows:
#' \describe{
#'   \item{Protein.IDs}{Uniprot IDs}
#'   \item{Majority.protein.IDs}{Uniprot IDs of major protein(s) in the protein group}
#'   \item{Razor...unique.peptides}{Number of peptides used for the quantification of this protein group}
#'   \item{Unique.peptides}{Number of peptides identified which are unique for this protein group}
#'   \item{Reporter.intensity.corrected. (10)}{TMT-MS3 quantitative relative abundance metrics.Reporter intensity correct x where x ranges from 0 to 9. Reporter intensity correct 0 corresponds to the TMT 126C TMT tag, Reporter intensity correct 1 corresponds to the TMT 127N TMT tag, and so on. Reporter intensity correct 9 corresponds to the TMT 131N tag}
#'   \item{Protein.names}{Full protein names}
#'   \item{Gene.names}{Gene name}
#'   \item{Fasta.headers}{Header as present in the Uniprot fasta file}
#'   \item{Only.identified.by.site}{The protein is only identified by a modification site if marked +.}
#'   \item{Reverse}{The protein is identified in the decoy database if marked +}
#'   \item{Potential.contaminant}{The protein is a known contaminant if marked +}
#' }
#' @return A data.frame
#' @source Dermit et al 2020.
#' Subcellular mRNA Localization Regulates Ribosome Biogenesis in Migrating Cells
#' Developmental Cell Volume 55, Issue 3, 9 November 2020, Pages 298-313.e10.
#' \href{https://www.cell.com/developmental-cell/pdfExtended/S1534-5807(20)30796-6}.
#' @examples
#' head(peptides.raw)
"peptides.raw"
#' evidence file from MaxQuant of a TMT experiment of MDA-MB231 cell
#' protrusions and bodies during a timecourse experiment.
#' The dataset contains the proteinGroup.txt output file from
#' \href{http://www.maxquant.org}{MaxQuant}.
#' @format A dataframe with 5905 rows and 107 variables.
#' The important variables are as follows:
#' \itemize{
#'   \item{Sequence}{The identified AA sequence of the peptide.}
#'   \item{Length}{The length of the sequence stored in the column 'Sequence'.}
#'   \item{Modifications}{Post-translational modifications contained within the
#'   identified peptide sequence.}
#'   \item{Raw.file}{The name of the RAW-file the mass spectral data was derived from.}
#'   \item{Score}{Andromeda score for the best associated MS/MS spectrum.}
#' }
#' @return A data.frame
#' @source Dermit et al 2020.
#' Subcellular mRNA Localization Regulates Ribosome Biogenesis in Migrating Cells
#' Developmental Cell Volume 55, Issue 3, 9 November 2020, Pages 298-313.e10.
#' \href{https://www.cell.com/developmental-cell/pdfExtended/S1534-5807(20)30796-6}.
#' @examples
#' head(evidence.raw)
"evidence.raw"


