\name{checkGDALDrivers}
\alias{checkGDALDrivers}

\title{Check presence of GDAL drivers using driver lists}

\description{Check presence of GDAL drivers using driver lists}

\author{Roger Bivand}

\examples{
rgdal_extSoftVersion()
shared <- readRDS(system.file("lists/shared.rds", package="checkGDALDrivers"))
now_vecs <- ogrDrivers()$name
(diffs_vecs <- setdiff(shared$vecs, now_vecs))
now_rasts <- gdalDrivers()$name
(diffs_rasts <- setdiff(shared$rasts, now_rasts))
if (length(diffs_vecs) > 0L || length(diffs_rasts) > 0L) stop("required drivers missing")
}

