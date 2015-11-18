\name{JGee2}
\alias{JGee2}
\alias{mycor_jgee2}
\alias{print.JGee2}
\alias{print.summary.JGee2}
\alias{S_H2}
\alias{summary.JGee2}

\title{Function to fit a joint generalized estimating equation model with response-specific regression coefficients}

\description{This function fits a joint generalized estimating equation model to 
multivariate longitudinal data with mono-type or mixed responses where the regression 
coefficients are response-specific.}

\usage{
JGee2(formula, id, data, nr, na.action = NULL, 
family = list(gaussian(link = "identity"), gaussian(link = "identity")), 
corstr1 = "independence", Mv = NULL, corstr2 = "independence", 
beta_int = NULL, R1 = NULL, R2 = NULL, scale.fix = FALSE, scale.value = 1, 
maxiter = 25, tol = 10^-3, silent = FALSE)
}

\arguments{
\item{formula}{A formula expression in the form of \code{cbind(res1,...,resnr)~predictors}.}
\item{id}{A vector for identifying subjects.}
\item{data}{A data frame which stores the variables in \code{formula} with \code{id} variable.}
\item{nr}{Number of multiple responses.}
\item{na.action}{A function to remove missing values from the data. Only \code{na.omit} is allowed here.}
\item{family}{A \code{family} object: a list of functions and expressions for defining \code{link} and 
\code{variance} functions. Families supported in \code{JGee2} are \code{binomial}, \code{gaussian},
\code{gamma} and \code{poisson}. The \code{links}, which are not available in \code{gee}, is not 
available here. The default family is \code{gaussian}.}
\item{corstr1}{A character string, which specifies the type of within-subject correlation structure. 
Structures supported in \code{JGee2} are \code{"AR-1"},\code{"exchangeable"}, \code{"fixed"}, 
\code{"independence"},\code{"stat_M_dep"},\code{"non_stat_M_dep"}, and \code{"unstructured"}. 
 The default \code{corstr1} type is \code{"independence"}.}
\item{Mv}{If either \code{"stat_M_dep"}, or \code{"non_stat_M_dep"} is specified in \code{corstr1}, 
then this assigns a numeric value for \code{Mv}. Otherwise, the default value is \code{NULL}.}
\item{corstr2}{A character string, which specifies the type of multivariate response correlation structure. 
Structures supported in \code{JGee2} are \code{"exchangeable"}, \code{"independence"}, and \code{"unstructured"}. 
The default \code{corstr2} type is \code{"independence"}.}
\item{beta_int}{User specified initial values for regression parameters. The default value is \code{NULL}.}
\item{R1}{If \code{corstr1="fixed"} and \code{corstr2="fixed"} are specified, then \code{R1} is a square matrix 
of dimension maximum cluster size containing the user specified correlation. Otherwise, the default 
value is \code{NULL}.}
\item{R2}{If \code{corstr1="fixed"} and \code{corstr2="fixed"} are specified, then \code{R2} is a square matrix 
of dimension \code{nr} size containing the user specified correlation. Otherwise, the default value is \code{NULL}.}
\item{scale.fix}{A logical variable; if true, the scale parameter is fixed at the value of \code{scale.value}. 
The default value is \code{FALSE}.}
\item{scale.value}{If \code{scale.fix=TRUE}, this assignes a numeric value to which the scale parameter should be fixed.}
\item{maxiter}{The number of iterations that is used in the estimation algorithm. The default value is \code{25}.}
\item{tol}{The tolerance level that is used in the estimation algorithm. The default value is \code{10^-3}.}
\item{silent}{A logical variable; if true, the regression parameter estimates at each iteration are
printed. The default value is \code{FALSE}.}
}

\value{An object class of \code{JGee2} representing the fit.}

\note{
The structures \code{"non_stat_M_dep"} and \code{"unstructured"} are valid only when the data is balanced.
}

\seealso{
\code{\link{JGee1}}
}

\examples{
\dontrun{

#check the data
data(MSCMsub)

#rename it
mydata=MSCMsub

#check the column labels for formula object
head(mydata)

#prepare formula object before model fitting
formulaj2=cbind(stress,illness)~chlth+csex+education+employed+housize+married+mhlth+race

#prepare family object before model fitting
familyj2=list(binomial(link="logit"),binomial(link="logit"))

#fit the model
fitjgee2=JGee2(formula=formulaj2,id=mydata[,1],data=mydata,nr=2,na.action=NULL, 
family=familyj2, corstr1="exchangeable", Mv=NULL, corstr2="unstructured", 
beta_int=rep(0,18), R1=NULL, R2=NULL, scale.fix=FALSE, scale.value=1, maxiter=30, 
tol=10^-3, silent=FALSE)

#check the object names returned by fitjgee2
names(fitjgee2)

#check the object names returned by summary(fitjgee2)
names(summary(fitjgee2))

#get the coefficients
summary(fitjgee2)$coefficients

#get the within-subject correlation matrix
summary(fitjgee2)$working.correlation1

#get the multivariate response correlation matrix
summary(fitjgee2)$working.correlation2

#get the overall working correlation matrix
summary(fitjgee2)$working.correlation

}
}



\keyword{joint modelling}
\keyword{marginal models}
\keyword{mixed outcomes}
