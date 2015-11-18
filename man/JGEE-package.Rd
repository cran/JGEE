\name{JGEE-package}
\alias{JGEE-package}
\alias{JGEE}
\docType{package}
\title{Joint Generalized Estimating Equation Solver}

\description{This package considers analysis of multivariate longitudinal data 
via two different joint generalized estimating equation (JGEE) models. While the first JGEE model assumes regression 
coefficients shared by responses, the second JGEE model assumes response-specific regression coefficients. 
Since the later model uses response-specific regression coefficients, this model is more flexible compared to 
the former model. As a result of this, the later model can be used to analyse the multivariate longitudinal data 
with mixed outcomes as well. On the other hand, the working correlation matrix in both JGEE models is decomposed 
as within-subject correlation and multivariate response correlation matrices through Kronecker product. 
a large menu for modelling these two correlation matrices are offered.}

\details{This package consists of two different functions. \code{\link{JGee1}} function fits 
a joint generalized estimating equation model to multivariate longitudinal data where 
the regression coefficients are shared by the different response types. \code{\link{JGee2}} 
function fits a joint generalized estimating equation model to multivariate longitudinal data 
where the regression coefficients are response-specific.
}

\author{
Gul Inan

Maintainer: Gul Inan
}


\keyword{joint modelling}
\keyword{marginal models}
\keyword{mixed outcomes}
\keyword{kronecker product correlation matrix}
