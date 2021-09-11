#' new_bib
#' 
#' create new bib with just R citation
#'
#' @export new_bib

new_bib <- function() {
		# save objects inside an environment created with LazyLoadDB
		package_data <- file.path(system.file(package="mybib"),"data")
		ref <- citation(package="base")
		ref$key <- paste0("R",R.version$year)
		bib_env <- new.env(parent = emptyenv())
		mybib <- list()
		mybib[[ref$key]] <- ref
		bib_env$mybib <- mybib
		# NOTE: three ::: !
		tools:::makeLazyLoadDB(bib_env, file.path(package_data,"Rdata"))
		#invisible(old)
		return(mybib)
}
