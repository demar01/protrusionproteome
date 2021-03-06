#' proteinGroups file from MaxQuant of a TMT experiment of MDA-MB231 cell
#' protrusions and bodies during a timecourse experiment.
#'
#' The dataset contains the proteinGroup.txt output file for protrusions
#' and bodies deposited in PRIDE identifier PXD021239,
#' generated by Dermit et al 2020.
#' The dataset contains the proteingroups output file from
#' \href{http://www.maxquant.org}{MaxQuant}.
#'
#' @format A dataframe with 5905 rows and 107 variables:
#' \describe{
#'   \item{Protein.IDs}{Uniprot IDs}
#'   \item{Majority.protein.IDs}{Uniprot IDs of major protein(s) in the protein group}
#'   \item{Razor...unique.peptides}{Number of peptides used for the quantification of this protein group}
#'   \item{Unique.peptides}{Number of peptides identified which are unique for this protein group}
#'   \item{Reporter.intensity.corrected. (10)}{TMT-MS3 quantitative relative abundance metrics.Reporter intensity correct x where x ranges from 0 to 9. Reporter intensity correct 0 corresponds to the TMT 126C TMT tag, Reporter intensity correct 1 corresponds to the TMT 127N TMT tag, and so on. Reporter intensity correct 9 corresponds to the TMT 131N tag}
#'   \item{Protein.names}{Full protein names}
#'   \item{Gene.names}{Gene name}
#'   \item{Fasta.headers}{Header as present in the Uniprot fasta file}
#'   \item{Only.identified.by.site}{The protein is only identified by a modification site if marked ('+')}
#'   \item{Reverse}{The protein is identified in the decoy database if marked ('+')}
#'   \item{Potential.contaminant}{The protein is a known contaminant if marked ('+')}
#' }
#' @return A data.frame.
#' @source Dermit et al 2020.
#' Subcellular mRNA Localization Regulates Ribosome Biogenesis in Migrating Cells.
#' Developmental Cell Volume 55, Issue 3, 9 November 2020, Pages 298-313.e10.
#' \href{https://www.cell.com/developmental-cell/pdfExtended/S1534-5807(20)30796-6}{doi.org/10.1016/j.devcel.2020.10.006}.
#'
"prot.raw"

#' peptides file from MaxQuant of a TMT experiment of MDA-MB231 cell
#' protrusions and bodies during a timecourse experiment.
#'
#' The dataset contains the peptides.txt  output file from
#' \href{http://www.maxquant.org}{MaxQuant}.
#'
#' @format A data.frame with 50603 observations and 12 variables:
#' \describe{
#'   \item{Sequence}{The identified AA sequence of the peptide}
#'   \item{Amino.acid.before}{The amino acid in the sequence before the peptide}
#'   \item{Missed.cleavages}{Number of missed enzymatic cleavages}
#'   \item{Mass}{Monoisotopic mass of the peptide}
#'   \item{Proteins}{Identifiers of proteins this peptide is associated with}
#' }
#' @return A data.frame.
#' @source Dermit et al 2020.
#' Subcellular mRNA Localization Regulates Ribosome Biogenesis in Migrating Cells.
#' Developmental Cell Volume 55, Issue 3, 9 November 2020, Pages 298-313.e10.
#' \href{https://www.cell.com/developmental-cell/pdfExtended/S1534-5807(20)30796-6}{doi.org/10.1016/j.devcel.2020.10.006}.
#'
"peptides.raw"

#' evidence file from MaxQuant of a TMT experiment of MDA-MB231 cell
#' protrusions and bodies during a timecourse experiment.
#'
#' The dataset contains the evidence.txt  output file from
#' \href{http://www.maxquant.org}{MaxQuant}.
#'
#' @format A data.frame with 170661 observations and 15 variables:
#' \describe{
#'   \item{Sequence}{The identified AA sequence of the peptide}
#'   \item{Length}{The length of the sequence stored in the column Sequence}
#'   \item{Modifications}{Post-translational modifications contained within the identified peptide sequence}
#' }
#' @return A data.frame.
#' @source Dermit et al 2020.
#' Subcellular mRNA Localization Regulates Ribosome Biogenesis in Migrating Cells.
#' Developmental Cell Volume 55, Issue 3, 9 November 2020, Pages 298-313.e10.
#' \href{https://www.cell.com/developmental-cell/pdfExtended/S1534-5807(20)30796-6}{doi.org/10.1016/j.devcel.2020.10.006}.
#'
"evidence.raw"
