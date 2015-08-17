\name{JGee1}
\alias{JGee1}
\alias{mycor_jgee1}
\alias{print.JGee1}
\alias{print.summary.JGee1}
\alias{S_H1}
\alias{summary.JGee1}

\title{Function to fit a joint generalized estimating equation model with shared regression coefficients}

\description{This function fits a joint generalized estimating equation model to 
multivariate longitudinal data with mono-type responses where the regression 
coefficients are shared by the different response types.}

\usage{
JGee1(formula, id, data, nr, na.action = NULL, 
family = gaussian(link = "identity"), corstr1 = "independence", 
Mv = NULL, corstr2 = "independence", beta_int = NULL, R1 = NULL, 
R2 = NULL, scale.fix = FALSE, scale.value = 1, maxiter = 25, 
tol = 10^-3, 
silent = FALSE)
}

\arguments{
\item{formula}{A formula expression in the form of \code{response~predictors}.}
\item{id}{A vector for identifying subjects.}
\item{data}{A data frame which stores the variables in \code{formula} with \code{id} variable.}
\item{nr}{Number of multiple responses.}
\item{na.action}{A function to remove missing values from the data. Only \code{na.omit} is allowed here.}
\item{family}{A \code{family} object: a list of functions and expressions for defining \code{link} and 
\code{variance} functions. Families supported in \code{JGee1} are \code{binomial}, \code{gaussian},
\code{gamma} and \code{poisson}. The \code{links}, which are not available in \code{gee}, is not 
available here. The default family is \code{gaussian}.}
\item{corstr1}{A character string, which specifies the type of within-subject correlation structure. 
Structures supported in \code{JGee1} are \code{"AR-1"},\code{"exchangeable"}, \code{"fixed"}, 
\code{"independence"},\code{"stat_M_dep"},\code{"non_stat_M_dep"}, and \code{"unstructured"}. 
 The default \code{corstr1} type is \code{"independence"}.}
\item{Mv}{If either \code{"stat_M_dep"}, or \code{"non_stat_M_dep"} is specified in \code{corstr1}, 
then this assigns a numeric value for \code{Mv}. Otherwise, the default value is \code{NULL}.}
\item{corstr2}{A character string, which specifies the type of multivariate response correlation structure. 
Structures supported in \code{JGee1} are \code{"exchangeable"}, \code{"independence"}, and \code{"unstructured"}. 
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

\value{An object class of \code{JGee1} representing the fit.}

\note{
The structures \code{"non_stat_M_dep"} and \code{"unstructured"} are valid only when the data is balanced.
}

\seealso{
\code{\link{JGee2}}
}

\examples{
\dontrun{
data(MSCMsub)
mydata=MSCMsub

#MSCM stduy data layout requires some arrangement for model fitting.

N=167
nt=4
nr=2

yvec=matrix(0,N*nt*nr,1)
xmat=matrix(0,N*nt*nr,8)

for(i in 1:N) {
for(j in 1:nt){
yvec[j+(i-1)*nr*nt]=mydata[j+(i-1)*nt,2]
yvec[j+(i-1)*nr*nt+nt]=mydata[j+(i-1)*nt,3]
}
}

for(i in 1:N) {
for(j in 1:nt){
for(k in 4:11){
xmat[j+(i-1)*nr*nt,(k-3)]=mydata[j+(i-1)*nt,k]
xmat[j+(i-1)*nr*nt+nt,(k-3)]=mydata[j+(i-1)*nt,k]
}
}
}

id=rep(1:N, each=(nt*nr))
mydatanew=data.frame(id,yvec,xmat)
head(mydatanew)
colnames(mydatanew)=c("id","resp","chlth","csex","education","employed",
"housize","married","mhlth","race")
head(mydatanew)

formulaj1=resp~chlth+csex+education+employed+housize+married+
mhlth+race

fitjgee1=JGee1(formula=formulaj1,id=mydatanew[,1],data=mydatanew, nr=2, 
na.action=NULL, family=binomial(link="logit"), corstr1="exchangeable", 
Mv=NULL, corstr2="independence", beta_int=NULL, R1=NULL, R2=NULL, 
scale.fix= FALSE, scale.value=1, maxiter=25, tol=10^-3, 
silent=FALSE)

summary(fitjgee1)

names(summary(fitjgee1))

summary(fitjgee1)$working.correlation1
}
}


\keyword{joint modelling}
\keyword{marginal models}