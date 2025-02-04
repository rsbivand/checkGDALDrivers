\name{checkGDALDrivers}
\alias{checkGDALDrivers}

\title{Check presence of GDAL drivers using driver lists}

\description{Check presence of GDAL drivers using driver lists}

\author{Roger Bivand}

\examples{
shared <- readRDS(system.file("lists/shared25.rds", package="checkGDALDrivers"))
driver_versions <- readRDS(system.file("lists/driver_versions.rds", package="checkGDALDrivers"))
run <- FALSE
if (requireNamespace("sf", quietly=TRUE)) run <- TRUE
if (run) {
  gv <- unname(sf::sf_extSoftVersion()["GDAL"])
  now_vecs <- sf::st_drivers("vector")$name
  now_rasts <- sf::st_drivers("raster")$name
}
if (run) {
  (diffs_vecs <- setdiff(shared$vecs, now_vecs))
}
if (run) {
  (diffs_rasts <- setdiff(shared$rasts, now_rasts))
}
if (run) {
  if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) {
    o <- match(diffs_vecs, names(driver_versions$vecsx))
    vec_diff <- paste(paste(diffs_vecs, driver_versions$vecsx[o], sep=" "),
        collapse=", ")
    o <- match(diffs_rasts, names(driver_versions$rastsx))
    rast_diff <- paste(paste(diffs_rasts, driver_versions$rastsx[o], sep=" "),
        collapse=", ")
    stop("GDAL ", gv, " drivers missing:\nvector: ", vec_diff, 
        "\nraster: ", rast_diff)
  }
}
}

