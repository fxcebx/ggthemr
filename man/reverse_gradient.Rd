% Generated by roxygen2 (4.0.1): do not edit by hand
\name{reverse_gradient}
\alias{reverse_gradient}
\title{Reverse ggplot2 gradient colours}
\usage{
reverse_gradient(themr, static = FALSE)
}
\arguments{
\item{themr}{ggthemr object.}

\item{static}{TRUE will return the new ggthemr object. FALSE will apply the changes and not return anything.}
}
\description{
Reverse ggplot2 gradient colours
}
\examples{
themr <- ggthemr('pale')
reverse_gradient(themr)
}
\author{
Ciaran Tobin
}

