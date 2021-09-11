#' add_bib
#'
#' add bibliography entry
#'
#' @export add_bib

add_bib <- function(ref){ 
		# load current bibliograhy
		data(mybib)
		old <- mybib
		# save objects inside an environment created with LazyLoadDB
		package_root <- system.file(package="mybib")
		package_data <- file.path(package_root,"data")
		# new env
		bib_env <- new.env(parent = emptyenv())
		# add ref
		mybib[[ref$key]] <- ref
		bib_env$mybib <- mybib
		# NOTE: three ::: !
		tools:::makeLazyLoadDB(bib_env, file.path(package_data,"Rdata"))
		#invisible(old)
		return(mybib)
}
