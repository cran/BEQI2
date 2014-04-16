\name{readTWN}
\alias{readTWN}
\title{Read TWN Data}
\usage{
readTWN(filename)
}
\arguments{
  \item{filename}{name of TWN listBEQI input file
  (\code{character})}
}
\value{
a \code{data.frame} with four columns: taxonname,
taxongroup, taxonlevel, taxon
}
\description{
This function reads files in the Taxa Waterbeheer Nederland
(TWN) format.
}
\details{
The function adds a new column \code{taxon}. Its contents
depending on TWN-status: \itemize{ \item{status = 10}
{taxonname} \item{status = 20} {prefername} \item{status =
80} {parentname} }
}
\references{
\url{sofus.ecosys.nl/taxabase.htm}

\url{www.aquo.nl/faq/faq-twn}
}

