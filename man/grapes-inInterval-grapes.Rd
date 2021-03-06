% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/utils.R
\name{\%inInterval\%}
\alias{\%inInterval\%}
\title{Test if a Value is in an Interval}
\usage{
e1 \%inInterval\% e2
}
\arguments{
\item{e1}{numeric value}

\item{e2}{numeric interval}
}
\value{
TRUE if the interval includes the value, FALSE otherwise
}
\description{
This function tests if values are part of a closed interval.
}
\examples{
\dontrun{3 \%inInterval\% c(1, 4)}
}

