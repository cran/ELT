\name{ValidationLevel1}
\alias{ValidationLevel1}
\title{ValidationLevel1 function}
\usage{
  ValidationLevel1(OutputMethod, MyData, ValCrit, AgeCrit,
    Plot = F, Color = MyData$Param$Color, Excel = F)
}
\arguments{
  \item{OutputMethod}{The list returned by one of these
  functions : Method1(), Method2(), Method3() or
  Method4B().}

  \item{MyData}{The list returned by the add.Reference()
  function.}

  \item{ValCrit}{Critical value for the comparison of
  adjusted mortality and observed mortality.}

  \item{AgeCrit}{Age range for the comparison of adjusted
  mortality and observed mortality.}

  \item{Plot}{If set to TRUE, a sub-directory will be
  created in the working directory. This sub-directory will
  contains png plots describing the validation analysis.}

  \item{Color}{The color that will be used for the plots
  (HTML notation).}

  \item{Excel}{If set to TRUE, a sub-directory will be
  created in the working directory. This sub-directory will
  contains excel files describing the validation analysis.}
}
\description{
  This function performs the first level of validation on
  the returned value of one of these functions : Method1(),
  Method2(), Method3() or Method4B().
}

