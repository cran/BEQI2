\name{harmonize}
\alias{harmonize}
\title{Harmonize Case}
\usage{
harmonize(x)
}
\arguments{
  \item{x}{character vector}
}
\value{
character vector with harmonized names
}
\description{
Convert text to the most occuring case. In case of ties,
the first occurence in sorted order will be taken.
}
\examples{
x <- c("FOO", "Foo", "bar", "FOO", "bar", "FOO", "Bar")
 y <- BEQI2:::harmonize(x)
 stopifnot(all.equal(y, c("FOO", "FOO", "bar", "FOO", "bar", "FOO", "bar")))
}

