#' Predicts kinase inhibition probability for a given small molecule smiles
#'
#' @param smi string representing the small molecule smiles
#' @return named vector containing predicted kinase inhibition probability
#' @export
#' @examples
#' predict_kinase("OC(CCN1CCCCC1)(C2CC3CC2C=C3)c4ccccc4OC(CCN1CCCCC1)(C2CC3CC2C=C3)c4ccccc4")


predict_kinase=function(smi)
{
  r <- httr::POST("http://knet.ccs.miami.edu:5000/api/submit", body = list(smiles = smi))
  parsedRes=httr::content(r)
  if(parsedRes$status==2)
  { stop("Cannot compute predictions, server busy, please try later.")
  } else {
    return(unlist(parsedRes$predictions))
  }

}
