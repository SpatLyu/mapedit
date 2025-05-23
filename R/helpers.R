# check for sane longitude bounds of drawn features - latitude is always -90/90
insane_longitude_warning = function() {
  if (requireNamespace("crayon", quietly = TRUE)) {
    warning(crayon::bgRed(crayon::white("\ndrawn features lie outside standard longitude bounds (-180 to 180) which is likely to cause trouble later!!")),
            call. = FALSE)
  } else {
    warning("\ndrawn features lie outside standard longitude bounds (-180 to 180) which is likely to cause trouble later!!",
            call. = FALSE)
  }
}

#' @title Pipe operator
#' @description
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @usage lhs \%>\% rhs
#' @rdname pipe
#' @keywords internal
#' @importFrom magrittr %>%
#' @return `NULL` (this is the magrittr pipe operator)
#' @export
NULL
