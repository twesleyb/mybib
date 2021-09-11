get_a <- function() {
		my_env$a
}

set_a <- function(value) {
		old <- my_env$a
		# set new value
		my_env$a <- value
		# return
		invisible(old)
}
