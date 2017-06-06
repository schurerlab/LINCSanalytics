#' Retrieve RPPA assays data
#'
#' @param lds_id string equal to a dataset id, no default
#' @param cells vector of strings with protein names (Default "all")
#' @param perturbagens vector of strings with perturbagens IDs (Default "all")
#' @return data frame containing RPPA data from the specified LDS-ID
#' @export
#' @examples
#' get_rppa(lds_id="LDS-1209")
#' get_rppa(lds_id="LDS-1209",cells="C32")

get_rppa = function(lds_id=NULL, cells="all",perturbagens="all")
{ if(is.null(lds_id))
    { stop("lds_id must be a string with a valid LDS-ID, e.g. 'LDS-1209'") }
  startT=proc.time()[3]
message("Querying LINCS data...",appendLF=FALSE)
r <- httr::GET("http://lincsanalytics.ccs.miami.edu:8081/get_rppa",
               query = list(lds_id = lds_id,
                            cells =  paste(cells,collapse = "//"),
                            perturbagens =  paste(perturbagens,collapse = "//")
                            )
)
parsed <- jsonlite::fromJSON(httr::content(r, "text",encoding = "UTF-8"))
endT=proc.time()[3]
message(paste("retrieved ",if(length(parsed)>0) dim(parsed)[1] else 0," data points in ",round(endT-startT,digits=2)," seconds.", sep=""))

return(parsed)
}
