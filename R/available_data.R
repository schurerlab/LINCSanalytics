#' Retrieve the available LINCS datasets and the corresponding assay type.
#'
#' @return data frame with 2 columns, LDS-ID and assay name.
#' @export
#' @examples
#' available_data()

available_data=function()
{
  r <- httr::GET("http://bdapp4.ccs.miami.edu:8998/available_data")
  parsed <- jsonlite::fromJSON(httr::content(r, "text",encoding = "UTF-8"))
  return(parsed)
}
