\name{readITI}
\alias{readITI}
\title{Read Infaunal Trophic Index File}
\usage{
readITI(filename)
}
\arguments{
  \item{filename}{name of the ITI file (character)}
}
\description{
This function reads and checks files containing Infaunal
trophic index data (Gittenberger et al., 2011)
}
\details{
The function performs the following tasks: \itemize{
\item{checks the existence of \code{filename};}
\item{checks availablitity of required columns (case
insensitive);} \item{removes redundant spaces;}
\item{removes duplicated records.} \item{checks if all ITI
classes are I, II, III, or IV} }
}

