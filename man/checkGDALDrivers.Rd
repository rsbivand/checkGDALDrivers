\name{checkGDALDrivers}
\alias{checkGDALDrivers}

\title{Check presence of GDAL drivers using driver lists}

\description{Check presence of GDAL drivers using driver lists}

\author{Roger Bivand}

\examples{
shared <- readRDS(system.file("lists/shared.rds", package="checkGDALDrivers"))
if (requireNamespace("sf", quietly=TRUE)) {
(now_vecs <- sf::st_drivers("vector")$name)
(diffs_vecs <- unique(c(setdiff(shared$vecs, now_vecs), setdiff(now_vecs, shared$vecs))))
(now_rasts <- sf::st_drivers("raster")$name)
(diffs_rasts <- unique(c(setdiff(shared$rasts, now_rasts), setdiff(now_rasts, shared$rasts))))
if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) message("sf expected drivers missing:\nvector: ", paste(diffs_vecs, collapse=" "), "\nvector: ", paste(diffs_rasts, collapse=" "))
}
if (requireNamespace("terra", quietly=TRUE)) {
tmp <- terra::gdal(drivers=TRUE)
(now_vecs <- tmp$name[tmp$vector])
(diffs_vecs <- unique(c(setdiff(shared$vecs, now_vecs), setdiff(now_vecs, shared$vecs))))
(now_rasts <- tmp$name[tmp$raster])
(diffs_rasts <- unique(c(setdiff(shared$rasts, now_rasts), setdiff(now_rasts, shared$rasts))))
if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) message("terra required drivers missing:\nvector: ", paste(diffs_vecs, collapse=" "), "\nvector: ", paste(diffs_rasts, collapse=" "))
}
if (requireNamespace("gdalraster", quietly=TRUE)) {
tmp1 <- gdalraster::gdal_formats()
(now_vecs <- tmp1$short_name[tmp1$vector])
(diffs_vecs <- unique(c(setdiff(shared$vecs, now_vecs), setdiff(now_vecs, shared$vecs))))
(now_rasts <- tmp1$short_name[tmp1$raster])
(diffs_rasts <- unique(c(setdiff(shared$rasts, now_rasts), setdiff(now_rasts, shared$rasts))))
if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) message("gdalraster required drivers missing:\nvector: ", paste(diffs_vecs, collapse=" "), "\nvector: ", paste(diffs_rasts, collapse=" "))
}
}

