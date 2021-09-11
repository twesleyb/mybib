#' get_bib
#'
#' given doi, get bibtex entry with crossref
#'
#' @export get_bib
#'
#' @importFrom rcrossref cr_cn
#'
#' @examples
#' get_bib("10.1128/JVI.01939-08")

get_bib <- function(doi, gsub_key = TRUE) {
  # use rcrossref to get bibtex
  bib <- rcrossref::cr_cn(dois = doi, format = "bibentry")
  # to coerce to class bibentry, 'entry' should be 'bibtype'
  names(bib)[names(bib) == "entry"] <- "bibtype"
  if (gsub_key) {
    # rm underscore from key
    bib$key <- gsub(pattern = "_", replacement = "", bib$key)
  }
  # coerce to class bibentry
  return(do.call(bibentry, bib))
}
