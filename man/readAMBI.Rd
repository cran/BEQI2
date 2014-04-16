\name{readAMBI}
\alias{readAMBI}
\title{Read AMBI Sensitivity Data}
\usage{
readAMBI(filename = NULL)
}
\arguments{
  \item{filename}{name of the AMBI sensitivity file
  (character)}
}
\description{
This function reads and checks files with AMBI sensitivity
data. If \code{filename = NULL} Borja's data will be read
}
\details{
The function performs the following tasks: \itemize{
\item{checks the existence of \code{filename};}
\item{checks availablitity of required columns (case
insensitive);} \item{removes redundant spaces;}
\item{removes duplicated records.} }
}

