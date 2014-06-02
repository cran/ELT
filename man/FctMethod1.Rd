\name{FctMethod1}
\alias{FctMethod1}
\title{FctMethod1 function}
\usage{
  FctMethod1(d, e, qref, x1, x2, t1, t2)
}
\arguments{
  \item{d}{Number of deaths.}

  \item{e}{Number of individuals under risk.}

  \item{qref}{Mortality rates in Reference Table.}

  \item{x1}{Age range used for calculation.}

  \item{x2}{Age range of reference table.}

  \item{t1}{Calendar years used for the calculation. It
  corresponds to the common years among observations and
  the reference table.}

  \item{t2}{Calendar years of the reference.}
}
\description{
  FctMethod1() is an alternative to Method1(). It allows to
  process the smoothing without using a "Data" object and
  by defining all the needed parameters independently.
}

