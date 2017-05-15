#' Retrieve KiNativ assay data, percent inhibition or ic50.
#'
#' @param level string equal to "perc_inhib" or "ic50" for percent inhibition or ic50 data respectively (default "perc_inhib")
#' @param proteins vector of strings with protein names (Default "all")
#' @param perturbagens vector of strings with perturbagens IDs (Default "all")
#' @param perturbagen_dose numeric vector with perturbagen doses (Default "all")
#' @return data frame containing entity selected and the associated percent inhibition or ic50 data
#' @export
#' @examples
#' get_kinativ(level="perc_inhib")
#' get_kinativ(level="ic50",proteins="BRAF")
#' get_kinativ(perturbagens = "10231-101-1")

get_kinativ = function(level="perc_inhib", cells="all",proteins="all", perturbagens="all", perturbagen_dose="all")
{ startT=proc.time()[3]
message("Querying LINCS data...",appendLF=FALSE)
r <- httr::GET("http://lincsanalytics.ccs.miami.edu:8081/get_kinativ",
               query = list(level=level,
                            cells =  paste(cells,collapse = "//"),
                            proteins =  paste(proteins,collapse = "//"),
                            perturbagens =  paste(perturbagens,collapse = "//"),
                            perturbagen_dose =  paste(perturbagen_dose,collapse = "//")  )
)
parsed <- jsonlite::fromJSON(httr::content(r, "text",encoding = "UTF-8"))
endT=proc.time()[3]
message(paste("retrieved ",if(length(parsed)>0) dim(parsed)[1] else 0," data points in ",round(endT-startT,digits=2)," seconds.", sep=""))

return(parsed)
}
