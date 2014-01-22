\name{Method4A}
\alias{Method4A}
\title{Method4A function}
\usage{
  Method4A(MyData, AgeRange, AgeCrit, ShowPlot = F)
}
\arguments{
  \item{MyData}{The list returned by the add.Reference()
  function.}

  \item{AgeRange}{Age range used for the construction of
  the life table.}

  \item{AgeCrit}{Age range for the comparison of adjusted
  mortality and observed mortality.}

  \item{ShowPlot}{AIC plots and plots allowing to judge
  about the fit.}
}
\description{
  This function fits the Qxt using method 4 (first step)
  (non-parametric smoothing, see reference).
}

