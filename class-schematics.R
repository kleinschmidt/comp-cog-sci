library(knitr)
library(reshape2)
library(mvtnorm)
opts_chunk$set(cache=FALSE, dev='pdf')

#' Coffee cup size example
#' 
#' 
#+ cue-combo-setup
mean.v <- 4
mean.t <- 6
sd.v <- 1
sd.t <- 0.5
precis <- 1 / c(sd.v, sd.t)^2
weights <- precis / sum(precis)
mean.vt <- sum(c(mean.v,mean.t) * weights)
sd.vt <- sqrt(1 / sum(precis))

#+ cue-combo-dists, fig.width=4, fig.height=2.5
par(mar=c(3,0,0,0))
curve(dnorm(x, mean.vt, sd.vt), from=0, to=8, frame=F, type='n')
curve(dnorm(x, mean.t, sd.t), add=T)
curve(dnorm(x, mean.v, sd.v), add=T)

curve(dnorm(x, mean.vt, sd.vt), from=0, to=8, frame=F)
curve(dnorm(x, mean.t, sd.t) ,add=T, col='gray')
curve(dnorm(x, mean.v, sd.v), add=T, col='gray')

