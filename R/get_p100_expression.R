#' Retrieve Broad P100 data, plate normalized log2 fold change.
#'
#' @param filter_foldchange string expressing a threshold for specific log2 fold change retrieval (default "all", admissible ">value" or "<value")
#' @param proteins vector of strings with protein names (Default "all")
#' @param uniprot_ids vector of strings with protein uniprot IDs (Default "all")
#' @param cells vector of strings with cell names (Default "all")
#' @param perturbagens vector of strings with perturbagens IDs (Default "all")
#' @param perturbagen_dose numeric vector with perturbagen doses (Default "all")
#' @param perturbagen_time numeric vector with perturbagen times (Default "all")
#' @param limits numeric value, return only the specified number of rows (Default 1000)
#' @param replicates string, return each replicate separately (Default "all") or aggregated as averge value (using replicates = "mean")
#' @return data frame containing entity selected and the associated plate normalized log2 fold change
#' @export
#' @examples
#' get_p100_expression(cells = c("MCF7","PC3"))
#' get_p100_expression(genes = c("EGF","RHEB"))
#' get_p100_expression(cells = c("MCF7","PC3"),filter_zscores=">2")
#' get_p100_expression(cells = c("MCF7","PC3"),filter_zscores=">2")
#' get_p100_expression(perturbagens = "BRD-K60230970-001-10-0")

get_p100_expression = function(filter_foldchange="none", proteins="all", uniprot_ids="all", cells="all", perturbagens="all", perturbagen_dose="all",perturbagen_time= "all",replicates="all",limits=1000)
{ startT=proc.time()[3]
message("Querying LINCS data...",appendLF=FALSE)
r <- httr::GET("http://204.68.92.133:8081/get_p100",
               query = list(proteins =  paste(proteins,collapse = "//"),
                            uniprot_ids =  paste(uniprot_ids,collapse = "//"),
                            cells =  paste(cells,collapse = "//"),
                            perturbagens =  paste(perturbagens,collapse = "//"),
                            perturbagen_dose =  paste(perturbagen_dose,collapse = "//"),
                            perturbagen_time =  paste(perturbagen_time,collapse = "//"),
                            replicates =  replicates,
                            limits = limits,
                            filter_foldchange = filter_foldchange )
)
parsed <- jsonlite::fromJSON(httr::content(r, "text",encoding = "UTF-8"))
endT=proc.time()[3]
message(paste("retrieved ",if(length(parsed)>0) dim(parsed)[1] else 0," data points in ",round(endT-startT,digits=2)," seconds.", sep=""))

return(parsed)
}
