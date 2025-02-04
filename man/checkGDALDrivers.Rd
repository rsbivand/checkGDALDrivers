\name{checkGDALDrivers}
\alias{checkGDALDrivers}

\title{Check presence of GDAL drivers using driver lists}

\description{Check presence of GDAL drivers using driver lists}

\author{Roger Bivand}

\examples{
shared <- readRDS(system.file("lists/shared25.rds", package="checkGDALDrivers"))
if (requireNamespace("sf", quietly=TRUE)) {
(now_vecs <- sf::st_drivers("vector")$name)
(diffs_vecs <- setdiff(shared$vecs, now_vecs))
(now_rasts <- sf::st_drivers("raster")$name)
(diffs_rasts <- setdiff(shared$rasts, now_rasts))
if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) stop("sf expected drivers missing:\nvector: ", paste(diffs_vecs, collapse=" "), "\nraster: ", paste(diffs_rasts, collapse=" "))
}
if (requireNamespace("terra", quietly=TRUE)) {
tmp <- terra::gdal(drivers=TRUE)
(now_vecs <- tmp$name[tmp$vector])
(diffs_vecs <- setdiff(shared$vecs, now_vecs))
(now_rasts <- tmp$name[tmp$raster])
(diffs_rasts <- setdiff(shared$rasts, now_rasts))
if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) stop("terra required drivers missing:\nvector: ", paste(diffs_vecs, collapse=" "), "\nraster: ", paste(diffs_rasts, collapse=" "))
}
if (requireNamespace("gdalraster", quietly=TRUE)) {
tmp1 <- gdalraster::gdal_formats()
(now_vecs <- tmp1$short_name[tmp1$vector])
(diffs_vecs <- setdiff(shared$vecs, now_vecs))
(now_rasts <- tmp1$short_name[tmp1$raster])
(diffs_rasts <- setdiff(shared$rasts, now_rasts))
if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) stop("gdalraster required drivers missing:\nvector: ", paste(diffs_vecs, collapse=" "), "\nraster: ", paste(diffs_rasts, collapse=" "))
}
}

