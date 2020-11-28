check_drivers <- function(x) {
    x <- system.file(file.path("samples", x), package="checkGDALDrivers")
    o <- try(GDAL.open(x))
    if (inherits(o, "try-error")) {
      res <- o
      stop("Failure opening ", x)
    } else {
      res <- paste0("Success opening ", x)
      GDAL.close(o)
    }
    res
}
