% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/utils.R
\name{rename}
\alias{rename}
\title{Renaming Taxon Names}
\usage{
rename(x, from, to)
}
\arguments{
\item{x}{character vector with names}

\item{from}{character vector of old names}

\item{to}{character vector of new names}
}
\value{
character vector of \code{length(x)} with converted names
}
\description{
Convert taxon name \code{x} to taxon name \code{to} by looking it up in
 \code{from}. Look-up is case insensitive.
}

