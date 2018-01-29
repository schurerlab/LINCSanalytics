#' Retrieve KINOMEscan assay data, percent control or kd.
#'
#' @param level string equal to "perc_ctrl" or "kd" for percent control or kd data respectively (default "perc_ctrl")
#' @param filter_perc_or_kd string expressing a threshold for specific percent inhibition or kd retrieval (default "none")
#' @param proteins vector of strings with protein names (Default "all")
#' @param perturbagens vector of strings with perturbagens IDs (Default "all")
#' @param perturbagen_dose numeric vector with perturbagen doses (Default "all")
#' @return data frame containing entity selected and the associated percent control or kd data
#' @export
#' @examples
#' get_kinomescan(level="perc_ctrl")
#' get_kinomescan(level="kd",proteins="BRAF")
#' get_kinomescan(perturbagens = "10083-101-1",filter_perc_or_kd="<10")

get_kinomescan = function(level="perc_ctrl",filter_perc_or_kd="none", proteins="all", perturbagens="all", perturbagen_dose="all")
{ startT=proc.time()[3]
message("Querying LINCS data...",appendLF=FALSE)
r <- httr::GET("http://bdapp4.ccs.miami.edu:8998/get_kinomescan",
               query = list(level=level,
                            proteins =  paste(proteins,collapse = "//"),
                            perturbagens =  paste(perturbagens,collapse = "//"),
                            perturbagen_dose =  paste(perturbagen_dose,collapse = "//"),
                            filter_perc_or_kd = filter_perc_or_kd )
)
parsed <- jsonlite::fromJSON(httr::content(r, "text",encoding = "UTF-8"))
endT=proc.time()[3]
message(paste("retrieved ",if(length(parsed)>0) dim(parsed)[1] else 0," data points in ",round(endT-startT,digits=2)," seconds.", sep=""))

return(parsed)
}
