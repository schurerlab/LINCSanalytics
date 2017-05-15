#' Retrieve MEMA assay data, for different staining sets.
#'
#' @param ligands vector of strings with ligand names (Default "all")
#' @param ecmps vector of strings with extracellular matrix proteins (Default "all")
#' @param cells vector of strings with cell names (Default "all")
#' @param staining_set integer for the different staining sets (1 to 4 for staining set 1, 2, 3 or 2noH3 respectively)
#' @return data frame containing combination of perturbations and a set of measured features
#' @export
#' @examples
#' get_mema(staining_set=2)
#' get_mema(cells="PC3")
#' get_mema(staining_set=3, ligands="BMP3_P12645")

get_mema = function(ligands="all", ecmps="all", cells="all",staining_set=1,limits=100)
{ startT=proc.time()[3]
message("Querying LINCS data...",appendLF=FALSE)
r <- httr::GET("http://lincsanalytics.ccs.miami.edu:8081/get_mema",
               query = list(ligands = paste(ligands,collapse = "//"),
                            ecmps =  paste(ecmps,collapse = "//"),
                            cells =  paste(cells,collapse = "//"),
                            staining_set = staining_set,
                            limits = limits )
)
parsed <- jsonlite::fromJSON(httr::content(r, "text",encoding = "UTF-8"))
endT=proc.time()[3]
message(paste("retrieved ",if(length(parsed)>0) dim(parsed)[1] else 0," data points in ",round(endT-startT,digits=2)," seconds.", sep=""))

return(parsed)
}
