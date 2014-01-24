\name{Dispersion}
\alias{Dispersion}
\title{Dispersion function}
\usage{
  Dispersion(FinalMethod, MyData, Plot = F,
    Color = MyData$Param$Color, NbSim)
}
\arguments{
  \item{FinalMethod}{The list returned by the CompletionB()
  function.}

  \item{MyData}{The list returned by the add.Reference()
  function.}

  \item{Plot}{If set to TRUE, a sub-directory will be
  created in the working directory. This sub-directory will
  contains png plots describing the validation analysis.}

  \item{Color}{The color that will be used for the plots
  (HTML notation).}

  \item{NbSim}{The number of simulations for the
  Dispersion.}
}
\description{
  This function allows to calculate confidence intervals
  for period life expectancies.
}

