check_drivers <- function(x) {
    res <- NULL
    if (requireNamespace("terra", quietly=TRUE)){
        o <- try(terra::rast(x))
        if (inherits(o, "try-error")) {
            res <- o
            stop("Failure opening ", x)
        } else {
            res <- paste0("Success opening ", x)
        }
    } else {
        warning("terra not available")
    }
    res
}
