\name{ELT-package}
\alias{ELT-package}
\alias{ELT}
\docType{package}
\title{
ELT - A package to build Experience Life Tables
}
\description{
Collection of functions that can be used following a pre-established procedure to build and validate actuarial life tables. 
}
\details{
\tabular{ll}{
Package: \tab ELT\cr
Type: \tab Package\cr
Version: \tab 1.4\cr
Date: \tab 2015-09-03\cr
License: \tab GNU\cr
Depends: \tab locfit,lattice,latticeExtra,xlsx\cr
}

The package is meant to be used following a pre-established procedure.

See the reference for more info.



Please notice that the package includes the following internal functions:

.BeforeAfterCompletion(); .ComparisonFitsMethods(); .ComparisonFitsMethodsLog(); .ComparisonResidualsMethods(); .ComparisonResidualsMethods(); .ComparisonTrendsMethods(); .CompletionDG2005(); .CompLevel1(); .CompLevel2(); .CompLevel3(); .DevFct(); .ExportHistoryInExcel(); .ExportPeriodicLifeExpinExcel(); .ExportSingleIndiciesinExcel(); .ExportValidationL1inExcel(); .ExportValidationL2inExcel(); .FctCohortLifeExp5(); .FctPerLifeExp(); .FctSingleIndices(); .FitPopsAfterCompletionLog(); .FittedDxtAndConfInt(); .GetCritLevel1(); .GetCritLevel2(); .GetCV(); .GetFitSim(); .GetHistory(); .GetQtiles(); .GetRelDisp(); .GetSimExp(); .PlotCrit(); .PlotCritChoice(); .PlotDIntConf(); .PlotExpQtle(); .PlotFittedYear(); .PlotFittedYearLog(); .PlotMethod(); .PlotParamCompletion(); .PlotPerExp(); .PlotRelDisp(); .PlotRes(); .ResFct(); .SimDxt(); .ValidationLevel3(); .WarningInvalidAge() .

These functions can be accessed with the prefix ELT::: using the following syntax: ELT:::[name of the function] . For example : ELT:::.GetHistory(). See technical note II1291-15 (http://www.ressources-actuarielles.net/gtmortalite) for the arguments and examples of the functions.


}

\keyword{ package }

\references{

\cite{Tomas, J. , Planchet, F. , Prospective mortality tables and portfolio experience, Chapter 9 in \emph{Computational Actuarial Science}, with R ; Arthur Charpentier Editor, Chapman, 2014}


\cite{Tomas, J. , Planchet, F. , Constructing entity specific prospective mortality table : adjustment to a reference, \emph{Les cahiers de recherche de l'ISFA}, 2013(13), pp.1-31, 2013.}


\cite{Tomas, J. , Planchet, F. , Construction d'une table de mortalite par positionnement : Mode d'emploi, \emph{Institut des Actuaires, Rapport technique II1291-15}, pp. 1-27, 2013}


\cite{Tomas, J. , Planchet, F. , Criteres de Validation : Aspects Methodologiques, \emph{Institut des Actuaires, Rapport technique II1291-14}, pp. 1-31, 2013}


\cite{Tomas, J. , Planchet, F. , Methodes de positionnement : Aspects Methodologiques, \emph{Institut des Actuaires, Rapport technique II1291-12}, pp. 1-12, 2013}

\cite{Denuit, M. and Goderniaux, A. C. (2005). Closing and projecting life tables using log-linear models. \emph{Bulletin of the Swiss Association of Actuaries}, (1), 29-48}

\cite{\url{http://www.ressources-actuarielles.net/gtmortalite} for data and exemple codes.}

}




\examples{
\dontrun{
data(MyPortfolio)
data(ReferenceMale)
data(ReferenceFemale)

## ------------------------------------------------------------------------ ##
##  Initialize Age variables                                                ##
## ------------------------------------------------------------------------ ##

AgeRange <- 30:90
AgeCrit <- 30:90
AgeRef <- 30:95

History <- ReadHistory(MyPortfolio = MyPortfolio, DateBegObs = "1996/01/01",
DateEndObs = "2007/12/31", DateFormat = "%Y/%m/%d", Plot = T, Excel = T)

MyData <- AddReference(History = History, ReferenceMale = ReferenceMale,
ReferenceFemale = ReferenceFemale)

## ######################################################################## ##
## METHOD 1 ############################################################### ##
## ######################################################################## ##

## ------------------------------------------------------------------------ ##
##  Execute method 1                                                        ##
## ------------------------------------------------------------------------ ##

OutputMethod1 <- Method1(MyData = MyData, AgeRange = AgeRange,  Plot = T)

## ------------------------------------------------------------------------ ##
##  Validate method 1 by the 1st level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 1st level citeria.

ValidationLevel1Method1 <- ValidationLevel1(OutputMethod = OutputMethod1, MyData = MyData,
 AgeCrit = AgeCrit, ValCrit = 0.05, Plot = T, Excel = T)

## ---------- If the criterions corresponding to the 1st level are not 
## ---------- satisfied, we can modify the age range used to compute the SMR
## ---------- and reexecute
## ---------- OutputMethod1 <- Method1(...)
## ---------- and
## ---------- ValidationLevel1Method1 <- ValidationLevel1(...).
## ---------- If the criterions corresponding to the 1st level are still not 
## ---------- satisfied, we turn to the method 2, and it is useless to
## ---------- pursue the completion of the table and the validation.
## ---------- If the criterions are satisfied, we continue the validation with
## ---------- the criterions corresponding to the 2nd level.
## ---------- We can also turn to method 3 or 4 to improve the fit at a cost 
## ---------- of a somewhat greeter complexity.

## ------------------------------------------------------------------------ ##
##  Validate method 1 by the 2nd level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 2nd level criterions

ValidationLevel2Method1 <- ValidationLevel2(OutputMethod = OutputMethod1, MyData = MyData,
 AgeCrit = AgeCrit, ValCrit = 0.05, Excel = T)

## ---------- If the criterions corresponding to the 2nd level are not satisfied
## ---------- we turn to the method 2 and it is useless to pursue the 
## ---------- completion of the table and the validation.
## ---------- If the criterions are satisfied, we continue the validation with
## ---------- the completion of the table and the criterions corresponding to
## ---------- the 3rd level.

## ------------------------------------------------------------------------ ##
##  Completion Method 1                                                     ##
## ------------------------------------------------------------------------ ##

## ---------- Age range for the selection of the optimal starting age.

AgeRangeOptMale <- AgeRangeOptFemale <-  c(80, 80)

## ---------- In theory, we could select the optimal starting age, however 
## ---------- the optimal starting age can vary a lot with the calendar years
## ---------- leading to a relatively irregular surface. In practice, we
## ---------- select then a fixed age for the whole years.

## ---------- Starting age for which the fitted probabilities of the death are
## ---------- replaced by the values obtained from the completion model.

BegAgeCompMale <- BegAgeCompFemale <- 85

## ---------- We check if the completion is smoothed with graphical
## ---------- diagnostics.

CompletionMethod1 <- CompletionA(OutputMethod = OutputMethod1, MyData = MyData,
 AgeRangeOptMale = AgeRangeOptMale, AgeRangeOptFemale = AgeRangeOptFemale,
 BegAgeCompMale = BegAgeCompMale, BegAgeCompFemale = BegAgeCompFemale, ShowPlot = T)

## ---------- If the completion is not satisfying, we modify the values
## ---------- AgeRangeOpt and BegAgeComp, and we repeat the previous script
## ---------- CompletionA()
## ---------- If the completion is satisfying, we execute

FinalMethod1 <- CompletionB(ModCompletion = CompletionMethod1, OutputMethod = OutputMethod1,
 MyData = MyData, Plot = T, Excel = T)

## ------------------------------------------------------------------------ ##
##  Validate method 1 by the 3rd level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 3rd level criterions

ValidationLevel3Method1 <- ValidationLevel3(FinalMethod = FinalMethod1, MyData = MyData,
 Plot = T, Excel = T)

## ------------------------------------------------------------------------ ##
##  Coef Varition, Conf int. and rel. disp. of fitted per. life exp.        ##
## ------------------------------------------------------------------------ ##

## ---------- Compute the coefficient of variation, confidence intervals and
## ---------- relative dispersion of the fitted perdiodic life expectancies

DispersionMethod1 <- Dispersion(FinalMethod = FinalMethod1, MyData = MyData, Plot = T,NbSim = 10)

## ######################################################################## ##
## METHOD 2 ############################################################### ##
## ######################################################################## ##

## ------------------------------------------------------------------------ ##
##  Execute method 2                                                        ##
## ------------------------------------------------------------------------ ##

OutputMethod2 <- Method2(MyData = MyData, AgeRange = AgeRange, Plot = T)

## ------------------------------------------------------------------------ ##
##  Validate method 2 by the 1st level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 1st level citeria.

ValidationLevel1Method2 <- ValidationLevel1(OutputMethod = OutputMethod2, MyData = MyData,
 AgeCrit = AgeCrit, ValCrit = 0.05, Plot = T, Excel = T)

## ---------- If the criterions corresponding to the 1st level are not 
## ---------- satisfied, we turn to the method 3, and it is useless to
## ---------- pursue the completion of the table and the validation.
## ---------- If the criterions are satisfied, we continue the validation with
## ---------- the criterions corresponding to the 2nd level.
## ---------- We can also turn to method 4 to improve the fit at a cost 
## ---------- of a somewhat greeter complexity.

## ------------------------------------------------------------------------ ##
##  Validate method 2 by the 2nd level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 2nd level criterions

ValidationLevel2Method2 <- ValidationLevel2(OutputMethod = OutputMethod2, AgeCrit = AgeCrit,
 ValCrit = 0.05, MyData = MyData, Excel = T)

## ---------- If the criterions corresponding to the 2nd level are not satisfied
## ---------- we turn to the method 3 and it is useless to pursue the 
## ---------- completion of the table and the validation.
## ---------- If the criterions are satisfied, we continue the validation with
## ---------- the completion of the table and the criterions corresponding to
## ---------- the 3rd level.

## ------------------------------------------------------------------------ ##
##  Completion Method 2                                                     ##
## ------------------------------------------------------------------------ ##

## ---------- We check if the completion is smoothed with graphical
## ---------- diqgnostics.

CompletionMethod2 <- CompletionA(OutputMethod = OutputMethod2, MyData = MyData,
 AgeRangeOptMale = AgeRangeOptMale, AgeRangeOptFemale = AgeRangeOptFemale, 
BegAgeCompMale = BegAgeCompMale, BegAgeCompFemale = BegAgeCompFemale, ShowPlot = T)

## ---------- If the completion is not satisfying, we modify the values
## ---------- AgeRangeOpt and BegAgeComp, and we repeat the previous script
## ---------- CompletionA()
## ---------- If the completion is satisfying, we execute

FinalMethod2 <- CompletionB(ModCompletion = CompletionMethod2, OutputMethod = OutputMethod2,
 MyData = MyData, Plot = T, Excel = T)

## ------------------------------------------------------------------------ ##
##  Validate method 2 by the 3rd level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 3rd level criterions

ValidationLevel3Method2 <- ValidationLevel3(FinalMethod = FinalMethod2, MyData = MyData,
 Plot = T, Excel = T)

## ------------------------------------------------------------------------ ##
##  Coef Varition, Conf int. and rel. disp. of fitted per. life exp.        ##
## ------------------------------------------------------------------------ ##

## ---------- Compute the coefficient of variation, confidence intervals and
## ---------- relative dispersion of the fitted perdiodic life expectancies

DispersionMethod2 <- Dispersion(FinalMethod = FinalMethod2, MyData = MyData, Plot = T, NbSim = 10)

## ######################################################################## ##
## METHOD 3 ############################################################### ##
## ######################################################################## ##

## ------------------------------------------------------------------------ ##
##  Execute method 3                                                        ##
## ------------------------------------------------------------------------ ##

OutputMethod3 <- Method3(MyData = MyData, AgeRange = AgeRange, Plot = T)

## ------------------------------------------------------------------------ ##
##  Validate method 3 by the 1st level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 1st level citeria.

ValidationLevel1Method3 <- ValidationLevel1(OutputMethod = OutputMethod3, MyData = MyData,
 AgeCrit = AgeCrit, ValCrit = 0.05, Plot = T, Excel = T)

## ---------- If the criterions corresponding to the 1st level are not 
## ---------- satisfied, we turn to the method 4, and it is useless to
## ---------- pursue the completion of the table and the validation.
## ---------- If the criterions are satisfied, we continue the validation with
## ---------- the criterions corresponding to the 2nd level.

## ------------------------------------------------------------------------ ##
##  Validate method 3 by the 2nd level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 2nd level criterions

ValidationLevel2Method3 <- ValidationLevel2(OutputMethod = OutputMethod3, MyData = MyData,
 AgeCrit = AgeCrit, ValCrit = 0.05, Excel = T)

## ---------- If the criterions corresponding to the 2nd level are not satisfied
## ---------- we turn to the method 4 and it is useless to pursue the 
## ---------- completion of the table and the validation.
## ---------- If the criterions are satisfied, we continue the validation with
## ---------- the completion of the table and the criterions corresponding to
## ---------- the 3rd level.

## ------------------------------------------------------------------------ ##
##  Completion Method 3                                                     ##
## ------------------------------------------------------------------------ ##

## ---------- We check if the completion is smoothed with graphical
## ---------- diqgnostics.

CompletionMethod3 <- CompletionA(OutputMethod = OutputMethod3, MyData = MyData, 
AgeRangeOptMale = AgeRangeOptMale, AgeRangeOptFemale = AgeRangeOptFemale,
 BegAgeCompMale = BegAgeCompMale, BegAgeCompFemale = BegAgeCompFemale, ShowPlot = T)

## ---------- If the completion is not satisfying, we modify the values
## ---------- AgeRangeOpt and BegAgeComp, and we repeat the previous script
## ---------- CompletionA()
## ---------- If the completion is satisfying, we execute

FinalMethod3 <- CompletionB(ModCompletion = CompletionMethod3, OutputMethod = OutputMethod3,
MyData = MyData, Plot = T, Excel = T)

## ------------------------------------------------------------------------ ##
##  Validate method 3 by the 3rd level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 3rd level criterions

ValidationLevel3Method3 <- ValidationLevel3(FinalMethod = FinalMethod3, MyData = MyData,
 Plot = T, Excel = T)

## ------------------------------------------------------------------------ ##
##  Coef Varition, Conf int. and rel. disp. of fitted per. life exp.        ##
## ------------------------------------------------------------------------ ##

## ---------- Compute the coefficient of variation, confidence intervals and
## ---------- relative dispersion of the fitted perdiodic life expectancies

DispersionMethod3 <- Dispersion(FinalMethod = FinalMethod3, MyData = MyData, Plot = T, NbSim = 10)

## ######################################################################## ##
## METHOD 4 ############################################################### ##
## ######################################################################## ##

## ------------------------------------------------------------------------ ##
##  Execute method 4                                                        ##
## ------------------------------------------------------------------------ ##

## ---------- Execute method 4 first part.

OutputMethod4PartOne <- Method4A(MyData = MyData, AgeRange = AgeRange, AgeCrit = AgeCrit,
 ShowPlot = T)

## ---------- Select the optimal smoothing parameters.

## ---------- Execute method 4 second part.

OutputMethod4 <- Method4B(PartOne, MyData = MyData, OptMale = c(1, 16),
 OptFemale = c(1, 14), Plot = T)

## ------------------------------------------------------------------------ ##
##  Validate method 4 by the 1st level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 1st level citeria.

ValidationLevel1Method4 <- ValidationLevel1(OutputMethod = OutputMethod4, MyData = MyData,
 AgeCrit = AgeCrit, ValCrit = 0.05, Plot = T, Excel = T)

## ---------- If the criterions corresponding to the 1st level are not 
## ---------- satisfied, we turn to the method 4, and it is useless to
## ---------- pursue the completion of the table and the validation.
## ---------- If the criterions are satisfied, we continue the validation with
## ---------- the criterions corresponding to the 2nd level.

## ------------------------------------------------------------------------ ##
##  Validate method 4 by the 2nd level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 2nd level criterions

ValidationLevel2Method4 <- ValidationLevel2(OutputMethod = OutputMethod4, MyData = MyData,
 AgeCrit = AgeCrit, ValCrit = 0.05, Excel = T)

## ---------- If the criterions corresponding to the 2nd level are not satisfied
## ---------- we turn to the method 4 and it is useless to pursue the 
## ---------- completion of the table and the validation.
## ---------- If the criterions are satisfied, we continue the validation with
## ---------- the completion of the table and the criterions corresponding to
## ---------- the 3rd level.

## ------------------------------------------------------------------------ ##
##  Completion Method 4                                                     ##
## ------------------------------------------------------------------------ ##

## ---------- We check if the completion is smoothed with graphical
## ---------- diqgnostics.

CompletionMethod4 <- CompletionA(OutputMethod = OutputMethod4, MyData = MyData,
 AgeRangeOptMale = AgeRangeOptMale, AgeRangeOptFemale = AgeRangeOptFemale, 
BegAgeCompMale = BegAgeCompMale, BegAgeCompFemale = BegAgeCompFemale, ShowPlot = T)

## ---------- If the completion is not satisfying, we modify the values
## ---------- AgeRangeOpt and BegAgeComp, and we repeat the previous script
## ---------- CompletionA()
## ---------- If the completion is satisfying, we execute

FinalMethod4 <- CompletionB(ModCompletion = CompletionMethod4, OutputMethod = OutputMethod4,
 MyData = MyData, Plot = T, Excel = T)

## ------------------------------------------------------------------------ ##
##  Validate method 4 by the 3rd level citeria                              ##
## ------------------------------------------------------------------------ ##

## ---------- Execute 3rd level criterions

ValidationLevel3Method4 <- ValidationLevel3(FinalMethod = FinalMethod4, MyData = MyData,
Plot = T, Excel = T)

## ------------------------------------------------------------------------ ##
##  Coef Varition, Conf int. and rel. disp. of fitted per. life exp.        ##
## ------------------------------------------------------------------------ ##

## ---------- Set the number of simulations

## ---------- Compute the coefficient of variation, confidence intervals and
## ---------- relative dispersion of the fitted perdiodic life expectancies

DispersionMethod4 <- Dispersion(FinalMethod = FinalMethod4, MyData = MyData, Plot = T, NbSim = 10)

## ######################################################################## ##
## COMPARISON OF THE METHODS ############################################## ##
## ######################################################################## ##

## ---------- Once we have fitted the data with a number of methods, we can
## ---------- compare them. In the following, we compare the fitted
## ---------- probabilities of death in original and log scale, the
## ---------- residuals, the fitted deaths as well as the coherence of the
## ---------- extrapolated mortality trends

## ---------- You can change the color vector for comparison, color need to
## ---------- be in html format

## ---------- Store the output into a list

ListOutputs <- list(OutputMethod1, OutputMethod2, OutputMethod3, OutputMethod4)
ListValidationLevel1 <- list(ValidationLevel1Method1, ValidationLevel1Method2,
 ValidationLevel1Method3, ValidationLevel1Method4)
ListValidationLevel2 <- list(ValidationLevel2Method1, ValidationLevel2Method2,
 ValidationLevel2Method3, ValidationLevel2Method4)
ListValidationLevel3 <- list(ValidationLevel3Method1, ValidationLevel3Method2,
 ValidationLevel3Method3, ValidationLevel3Method4)

ComparisonsMethodsLevels123 <- ComparisonMethods(ListOutputs, ListValidationLevel1,
 ListValidationLevel2, ListValidationLevel3, MyData = MyData, Plot = T, AgeCrit = AgeCrit)

}
}	
