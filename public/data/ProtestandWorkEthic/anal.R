setwd("C:/Users/simon/OneDrive/Dokumente/IPIP/ProtestandWorkEthic")
library(psych)
library(lavaan)
library(mirt)
library(dplyr)

dat_raw <- read.table("data.csv", sep = "\t", head = TRUE)

dat <- dat_raw %>%
  select(starts_with("Q")) %>%
  select(ends_with("A")) %>%
  select(-"Q14A", -"Q7A") #%>%
  # mutate(Q9Ar = 6-Q9A,
		 # Q13Ar = 6-Q13A, 
		 # Q15Ar = 6-Q15A
		 # ) %>%
   # select(-"Q15A", -"Q13A", -"Q9A")

fa.parallel(dat)
omega(dat, 3)

# Q1 Most people spend too much time in unprofitable amusements. 
# Q3 Money acquired easily (e.g. through gambling or speculation) is usually spent unwisely. 
# Q5 The most difficult college courses usually turn out to be the most rewarding. 
		# Q7 The self-made person is likely to be more ethical than someone who is born to wealth.  
# Q8 I often feel I would be more successful if I sacrificed certain pleasures. 
# Q11 People who fail at a job have usually not tried hard enough. 
# Q12 Life would have very little meaning if we never had to suffer. 
# Q14 The credit card is a ticket to careless spending. 
# Q16 The person who can approach an unpleasant task with enthusiasm is the one who gets ahead. 
# Q19 A distaste for hard work usually reflects a weakness of character.


# Q6 Most people who don’t succeed in life are just plain lazy. 
# Q4 There are few satisfactions equal to the realization that one has done one&apos;s best at a job. 
# Q18 I feel uneasy when there is little work for me to do. 

# Q10 Anyone who is able and willing to work hard has a good chance of succeeding. 
# Q13 Hard work offers little guarantee of success. 
# Q17 If one works hard enough they are likely to make a good life for themselves. 

# Q2 Our society would have fewer problems if people had less leisure time. 
# Q9 People should have more leisure time to spend in relaxation.  
# Q15 Life would be more meaningful if we had more leisure time. 

# ggummodel <- gmodel1
omega(dat,1)
gmodel1 <- mirt(dat, 1, "graded", TOL = .001)
coef(gmodel1, simplify = T)
summary(gmodel1)
(m2.gmodel1<-M2(gmodel1, type = "C2"))
itemfit(gmodel1)
itemfit(gmodel1, empirical.plot = 3)
itemfit(gmodel1, empirical.plot = 5)
itemfit(gmodel1, empirical.plot = 7)

thetgm1 <- fscores(gmodel1, full.scores.SE = TRUE, method = "EAP")
empirical_rxx(thetgm1)
hist(thetgm1, breaks = 40)
describe(thetgm1)

plot(gmodel1, type = "rxx", theta_lim = c(-2,2) )
plot(gmodel1, type = "score", theta_lim = c(-2,2))
plot(gmodel1, type = "trace", theta_lim = c(-2,2))


itemfit(gmodel1, empirical.plot = 1)
itemfit(gmodel1, empirical.plot = 2)

itemfit(gmodel1, empirical.plot = 4)
itemfit(gmodel1, empirical.plot = 5)
itemfit(gmodel1, empirical.plot = 6)
itemfit(gmodel1, empirical.plot = 7)
itemfit(gmodel1, empirical.plot = 8)
itemfit(gmodel1, empirical.plot = 9)
itemfit(gmodel1, empirical.plot = 10)
itemfit(gmodel1, empirical.plot = 11)
itemfit(gmodel1, empirical.plot = 12)
itemfit(gmodel1, empirical.plot = 13)
itemfit(gmodel1, empirical.plot = 14)
itemfit(gmodel1, empirical.plot = 15)
itemfit(gmodel1, empirical.plot = 16)
itemfit(gmodel1, empirical.plot = 17)
itemfit(gmodel1, empirical.plot = 18)

gmodel2 <- mirt(dat, 2, "grsm")
summary(gmodel2, suppress = .25)
(m2.gmodel2<-M2(gmodel2, type = "C2"))


gmodel3 <- mirt(dat, 3, "grsm", method = "QMCEM")
summary(gmodel3, suppress = .25)
(m2.gmodel3<-M2(gmodel3, type = "C2", QMC = T))


spec1 <- rep(NA, 18)
# spec1[c(6,4,17)] <- 1
spec1[c(10,16,13)] <- 1
spec1[c(9,14,2)] <- 2
# spec1[c(9,15,2)] <- 3
bf1 <- bfactor(dat, spec1, TOL = .001)
summary(bf1)

theta_bf1 <- fscores(bf1, full.scores.SE = TRUE)
hist(theta_bf1[,"F1"])
hist(theta_bf1[,"F2"])
hist(theta_bf1[,"F3"])
empirical_rxx(theta_bf1)

spec2 <- rep(NA, 18)
spec2[c(6,4,17)] <- 1
spec2[c(10,16,13)] <- 2
spec2[c(9,14,2)] <- 3
# spec2[c(9,15,2)] <- 3
bf2 <- bfactor(dat, spec2, TOL = .001)
summary(bf2)

theta_bf2 <- fscores(bf2, full.scores.SE = TRUE)
hist(theta_bf2[,"F1"], breaks = 18)
hist(theta_bf2[,"F2"])
hist(theta_bf2[,"F3"])

empirical_rxx(theta_bf2)

anova(bf1, bf2)
( m2.bf1 <- M2(bf1, type = "C2", QMC = TRUE) )
( m2.bf2 <- M2(bf2, type = "C2", QMC = TRUE) )



mod_bflav1 <- '
	G =~ Q1A + Q2A + Q3A + Q4A + Q5A + Q6A + Q7A + Q8A + Q9A + Q10A + Q11A + Q12A + Q13A + Q15A + Q16A + Q17A + Q18A + Q19A
	s1 =~ Q4A + Q18A
	s2 =~ Q10A + Q17A + Q13A 
	s3 =~ Q9A + Q15A + Q2A
	
	G =~ 0*s1
	s2 =~ 0*s1
	s3 =~ 0*s1
	s2 =~ 0*s3
'
fit_bflav1 <- cfa(mod_bflav1, dat)
summary(fit_bflav1, fit.measures = TRUE, standardized = TRUE)









