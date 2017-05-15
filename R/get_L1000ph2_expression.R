#' Retrieve Broad L1000 data from LINCS Phase 2, weighted average of replicates z-scores
#'
#' @param filter_zscores string expressing a threshold for specific z-scores retrieval (default "all", admissible ">value" or "<value")
#' @param genes vector of strings with gene names (Default "all")
#' @param cells vector of strings with cell names (Default "all")
#' @param perturbagens vector of strings with perturbagens IDs (Default "all")
#' @param perturbagen_type vector of strings with perturbagen types (Default "all")
#' @param perturbagen_dose numeric vector with perturbagen doses (Default "all")
#' @param perturbagen_time numeric vector with perturbagen times (Default "all")
#' @param limits numeric value, return only the specified number of rows (Default 1000)
#' @return data frame containing entity selected and the associated wegthted average z-scores
#' @export
#' @examples
#' get_L1000ph2_expression(genes = c("EGF","RHEB"))
#' get_L1000ph2_expression(cells = c("MCF7","PC3"),filter_zscores=">2")
#' get_L1000ph2_expression(cells = c("MCF7","PC3"),filter_zscores=">2")
#' get_L1000ph2_expression(perturbagens = "BRD-K60230970-001-10-0")

get_L1000ph2_expression = function(sig_ids="all",filter_zscores="none", genes="all", cells="all", perturbagens="all", perturbagen_type="all",perturbagen_dose="all",perturbagen_time="all",limits=1000)
{ startT=proc.time()[3]
  message("Querying LINCS data...",appendLF=FALSE)
  r <- httr::GET("http://204.68.92.133:8081/get_L1000ph2",
                 query = list(sig_ids = paste(sig_ids,collapse = "//"),
                              cells =  paste(cells,collapse = "//"),
                              genes =  paste(genes,collapse = "//"),
                              perturbagen_type =  paste(perturbagen_type,collapse = "//"),
                              perturbagens =  paste(perturbagens,collapse = "//"),
                              perturbagen_dose =  paste(perturbagen_dose,collapse = "//"),
                              perturbagen_time =  paste(perturbagen_time,collapse = "//"),
                              limits = limits,
                              filter_zscores = filter_zscores )
  )
  parsed <- jsonlite::fromJSON(httr::content(r, "text",encoding = "UTF-8"))
  endT=proc.time()[3]
  message(paste("retrieved ",if(length(parsed)>0) dim(parsed)[1] else 0," data points in ",round(endT-startT,digits=2)," seconds.", sep=""))

  return(parsed)
}
