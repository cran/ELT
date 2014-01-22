\name{ReadHistory}
\alias{ReadHistory}
\title{readHistory function}
\usage{
  ReadHistory(MyPortfolio, DateBegObs, DateEndObs,
    DateFormat, Plot = F, Color = "#A4072E", Excel = F)
}
\arguments{
  \item{MyPortfolio}{MyPortfolio is a data.frame of 6
  columns as follows : -Id : Id for the line ; -Gender :
  Male or Female ; -DateOfBirth : aaaa/mm/jj ; -DateIn :
  aaaa/mm/jj ; -DateOut : aaaa/mm/jj ; -Status : "other" or
  "deceased".}

  \item{DateBegObs}{Date for the beginning of the
  observations.}

  \item{DateEndObs}{Date for the end of the observations.}

  \item{DateFormat}{Date format as expected by the as.Date
  R function.}

  \item{Plot}{If set to TRUE, a sub-directory will be
  created in the working directory. This sub-directory will
  contains png plots corresponding to the smoothed
  surface.}

  \item{Color}{The color that will be used for the plots
  (HTML notation).}

  \item{Excel}{If set to TRUE, a sub-directory will be
  created in the working directory. This sub-directory will
  contains excel files corresponding to the smoothed
  surface.}
}
\description{
  This function reads a data.frame and calculates exposure
  and number of deaths. This is the first function the user
  must call to build a mortality table.
}

