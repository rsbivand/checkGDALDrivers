\name{check_drivers}
\alias{check_drivers}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Check presence of GDAL drivers using sample files
}
\description{
Check presence of GDAL drivers using sample files
}
\usage{
check_drivers(x)
}

\arguments{
  \item{x}{File name in inst/samples}
}
\value{
Either exits on error or reports success.
}
\author{
Roger Bivand
}
\examples{
#check_drivers("L7_ETMs.tif")
#check_drivers("L7_ETMs.jp2")
}

