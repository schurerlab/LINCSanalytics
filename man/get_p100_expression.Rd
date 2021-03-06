% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_p100_expression.R
\name{get_p100_expression}
\alias{get_p100_expression}
\title{Retrieve Broad P100 data, plate normalized log2 fold change.}
\usage{
get_p100_expression(filter_foldchange = "none", proteins = "all",
  uniprot_ids = "all", cells = "all", perturbagens = "all",
  perturbagen_dose = "all", perturbagen_time = "all", replicates = "all",
  limits = 1000)
}
\arguments{
\item{filter_foldchange}{string expressing a threshold for specific log2 fold change retrieval (default "all", admissible ">value" or "<value")}

\item{proteins}{vector of strings with protein names (Default "all")}

\item{uniprot_ids}{vector of strings with protein uniprot IDs (Default "all")}

\item{cells}{vector of strings with cell names (Default "all")}

\item{perturbagens}{vector of strings with perturbagens IDs (Default "all")}

\item{perturbagen_dose}{numeric vector with perturbagen doses (Default "all")}

\item{perturbagen_time}{numeric vector with perturbagen times (Default "all")}

\item{replicates}{string, return each replicate separately (Default "all") or aggregated as averge value (using replicates = "mean")}

\item{limits}{numeric value, return only the specified number of rows (Default 1000)}
}
\value{
data frame containing entity selected and the associated plate normalized log2 fold change
}
\description{
Retrieve Broad P100 data, plate normalized log2 fold change.
}
\examples{
get_p100_expression(cells = c("MCF7","PC3"))
get_p100_expression(genes = c("EGF","RHEB"))
get_p100_expression(cells = c("MCF7","PC3"),filter_zscores=">2")
get_p100_expression(cells = c("MCF7","PC3"),filter_zscores=">2")
get_p100_expression(perturbagens = "BRD-K60230970-001-10-0")
}
