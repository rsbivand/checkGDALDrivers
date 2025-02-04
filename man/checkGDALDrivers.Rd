\name{checkGDALDrivers}
\alias{checkGDALDrivers}

\title{Check presence of GDAL drivers using driver lists}

\description{Check presence of GDAL drivers using driver lists}

\author{Roger Bivand}

\examples{
shared <- readRDS(system.file("lists/shared25.rds", package="checkGDALDrivers"))
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
  if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) 
    stop("GDAL ", gv, " drivers missing:\nvector: ",
        paste(diffs_vecs, collapse=" "), 
        "\nraster: ", paste(diffs_rasts, collapse=" "))
}
}

