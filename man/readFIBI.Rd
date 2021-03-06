% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/utils.R
\name{readFIBI}
\alias{readFIBI}
\title{Read Freshwater Inflow Biotic Index File}
\usage{
readFIBI(filename)
}
\arguments{
\item{filename}{name of the FIBI file (character)}
}
\description{
Read Freshwater Inflow Biotic Index File
}
\details{
The function performs the following tasks:
	\itemize{
		\item{checks the existence of \code{filename};}
 	\item{checks availablitity of required columns (case insensitive);}
 	\item{removes redundant spaces;}
 	\item{removes duplicated records.}
     \item{checks if all FIBI classes are I, II, III, or IV}
 }
}

