% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/core.R
\name{RblUpload}
\alias{RblUpload}
\title{Upload a request file to Bloomberg}
\usage{
RblUpload(
  RblRequest,
  filename = format(Sys.time(), "\%m\%d\%H\%M\%S"),
  verbose = TRUE
)
}
\arguments{
\item{RblRequest}{character string representing the request file according to Bloomberg Datalicense documentation. Can be generated with the \code{\link{RblRequestBuilder}} function}

\item{filename}{name assigned to the remote file. Only alphanumeric characters and underscores are allowed. Invalid characters are removed.}

\item{verbose}{logical. Should R report extra information on progress?}
}
\value{
A list with components
\describe{
 \item{req}{the request filename}
 \item{out}{the response filename}
}
}
\description{
Upload a request file to query Bloomberg. A response file will be generated by Bloomberg. 
The request file can be user-defined following the Bloomberg Data License documentation or generated with the \code{\link{RblRequestBuilder}} function.
The response file needs to be downloaded (see \code{\link{RblDownload}}) and parsed (see \code{\link{RblParse}}) to import the data in R.
}
\examples{
\dontrun{
# Run RblConnect first

# Build a request file to download the daily closing prices of 
#  EURO STOXX Index from 2005-01-01 to 2015-12-31.
RblRequest <- 
     RblRequestBuilder(
          header = c(FIRMNAME = RblUser(), 
                     PROGRAMNAME = 'gethistory', 
                     DATERANGE = '20050101|20151231'),
          fields = c('PX_LAST'), 
          identifiers = c('SXXE Index')
     )
                                
# Upload the request file
req <- RblUpload(RblRequest)
req
}

}
