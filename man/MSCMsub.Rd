\name{MSCMsub}
\alias{MSCMsub}
\docType{data}
\title{Mother's Stress and Children's Morbidity (MSCM) study data}

\description{
In Mother's Stress and Children's Morbidity (MSCM) study, Alexander and Markowitz (1986) investigated 
the relationship between maternal employment and paediatric health care utilization due to 
considerable changes in social and demographic characteristics in the US since 1950. A total of 
167 mothers and their preschool children (ages of between 18 months and 5 years) were enrolled 
in the MSCM study. At the beginning of the study, mothers were asked to provide demographic 
and domestic information about them such as education level, employment and marriage status, 
children's gender and race, maternal and child's health status at baseline and the household 
size, which are all categorical and time-invariant variables. Afterwards, the mothers were asked 
to record their maternal stress and child's illness status, whether present or not, in a health 
diary over a 28-day follow-up period. Information on these variables along with two binary 
responses, namely, mother's stress status and child's illness status for the days from 25 
to 28 are presented here.}

\usage{data("MSCMsub")}
\format{
   A data frame with 668 observations on the following 11 variables.
  \describe{
    \item{\code{id}}{A vector for classifying subjects.}
    \item{\code{stress}}{Mother's stress status at day t: 0=absence, 1=presence.}
    \item{\code{illness}}{Child's illness status at day t: 0=absence, 1=presence.}
    \item{\code{chlth}}{Child's health status at baseline: 0=very poor/poor, 1=fair, 2=good, 3=very good.}
    \item{\code{csex}}{Child's gender: 0=male, 1=female.}
    \item{\code{education}}{Mother's education level: 0=high school or less, 1=high school graduate.}
    \item{\code{employed}}{Mother's employment status: 0=unemployed, 1=employed.}
    \item{\code{housize}}{Size of the household: 0=2-3 people, 1=more than 3 people.}
    \item{\code{married}}{Marriage status of the mother: 0=other, 1=married.}
    \item{\code{mhlth}}{Mother's health status at baseline: 0=very poor/poor, 1=fair, 2=good, 3=very good.}
    \item{\code{race}}{Child's race: 0=white, 1=non-white.}
    
  }
}


\source{
\url{http://faculty.washington.edu/heagerty/Books/AnalysisLongitudinal/datasets.html}
}

\references{
Alexander, C.S. and Markowitz, R. (1986). Maternal employment and use of pediatric clinic services.
\emph{Medical Care}, \bold{24(2)}, 13--22.
}


\keyword{bivariate longitudinal binary data}
