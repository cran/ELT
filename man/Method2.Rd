\name{Method2}
\alias{Method2}
\title{Method2 function}
\usage{
  Method2(MyData, AgeRange, Plot = F,
    Color = MyData$Param$Color)
}
\arguments{
  \item{MyData}{The list returned by the add.Reference()
  function.}

  \item{AgeRange}{Age range used for the calculation of the
  parameters.}

  \item{Plot}{If set to TRUE, a sub-directory will be
  created in the working directory. This sub-directory will
  contains png plots corresponding to the smoothed
  surface.}

  \item{Color}{The color that will be used for the plots
  (HTML notation).}
}
\description{
  This function fits the Qxt using method 2 (two parameters
  relational method, see reference).
}

