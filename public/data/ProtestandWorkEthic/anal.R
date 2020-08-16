setwd("C:/Users/simon/OneDrive/Dokumente/IPIP/ProtestandWorkEthic")
library(psych)
library(lavaan)
library(mirt)
library(dplyr)
library(ggstatsplot)

dat_raw <- read.table("data.csv", sep = "\t", head = TRUE)
head(dat_raw)
table(dat_raw$religion)

dat_wrel <- dat_raw %>%
  filter (religion %in% c(1,2,4,6,7,12), engnat == 1, gender != 3 ) %>% 
  select( starts_with("Q"), religion, education, gender ) %>%
  select(ends_with("A"), religion, education, gender) %>%
  select(-"Q14A", -"Q7A") %>% 
  mutate(
	religion = factor(religion, 
				labels = c("Agnostic","Atheist","Catholic","Protestant",
							"Christ_Rest", "Other")
	education = factor(education, 
				labels = c("<Highschool","High School","University","Graduate"),
	gender = factor(gender, 
				labels = c("Male","Female"))					
	Q9A = 6-Q9A,
	Q13A = 6-Q13A, 
	Q15A = 6-Q15A )#%>%
   # select(-"Q15A", -"Q13A", -"Q9A")
dat <- dat_wrel %>% select(-religion, -education,-gender)

table(dat_wrel$religion)
dim(dat_wrel)

colnames(dat)
dim(dat)

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
# Q4 There are few satisfactions equal to the realization that one has done one's best at a job. 
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
marginal_rxx(gmodel1)
summary(gmodel1)
(m2.gmodel1<-M2(gmodel1, type = "C2"))
itemfit(gmodel1)
itemfit(gmodel1, empirical.plot = 4)
itemfit(gmodel1, empirical.plot = 2)
itemfit(gmodel1, empirical.plot = 15)

thetgm1 <- fscores(gmodel1, full.scores.SE = TRUE, method = "EAP")
hist(thetgm1[,"F1"], breaks = 40, main = "Histogram der Theta Scores")
describe(thetgm1)

plot(gmodel1, type = "rxx", theta_lim = c(-2,2) )
plot(gmodel1, type = "score", theta_lim = c(-2,2))
plot(gmodel1, type = "trace", theta_lim = c(-2,2))

## results from Omega
# 1 Q1A  0.56        0.26       # Q1 Most people spend too much time in unprofitable amusements. 
# 2 Q2A  0.51              0.46 # Q2 Our society would have fewer problems if people had less leisure time. 
# 3 Q3A  0.40        0.28       # Q3 Money acquired easily (e.g. through gambling or speculation) is usually spent unwisely. 
# 4 Q4A  0.54        0.37       # Q4 There are few satisfactions equal to the realization that one has done one's best at a job. 
# 5 Q5A  0.35        0.28       # Q5 The most difficult college courses usually turn out to be the most rewarding. 
# 6 Q6A  0.57  0.24        0.23 # Q6 Most people who don’t succeed in life are just plain lazy. 
# 7 Q8A  0.34                   # Q8 I often feel I would be more successful if I sacrificed certain pleasures. 
# 8 Q9A  0.58              0.64 # Q9 People should have more leisure time to spend in relaxation.  
# 9 Q10A 0.61  0.52             # Q10 Anyone who is able and willing to work hard has a good chance of succeeding. 
# 10 Q11A 0.57  0.23             # Q11 People who fail at a job have usually not tried hard enough. 
# 11 Q12A 0.39        0.24       # Q12 Life would have very little meaning if we never had to suffer. 
# 12 Q13A 0.56  0.44             # Q13 Hard work offers little guarantee of success. 
# 13 Q15A 0.53              0.49 # Q15 Life would be more meaningful if we had more leisure time. 
# 14 Q16A 0.50  0.21  0.23       # Q16 The person who can approach an unpleasant task with enthusiasm is the one who gets ahead. 
# 15 Q17A 0.67  0.53             # Q17 If one works hard enough they are likely to make a good life for themselves. 
# 16 Q18A 0.37        0.31       # Q18 I feel uneasy when there is little work for me to do. 
# 17 Q19A 0.65        0.34       # Q19 A distaste for hard work usually reflects a weakness of character.

# Q6 Most people who don’t succeed in life are just plain lazy. 
!!# Q10 Anyone who is able and willing to work hard has a good chance of succeeding. 
# Q11 People who fail at a job have usually not tried hard enough. 
!!# Q13 Hard work offers little guarantee of success. 
# Q16 The person who can approach an unpleasant task with enthusiasm is the one who gets ahead. 
!!# Q17 If one works hard enough they are likely to make a good life for themselves. 

# Q1 Most people spend too much time in unprofitable amusements. 
# Q3 Money acquired easily (e.g. through gambling or speculation) is usually spent unwisely. 
!!# Q4 There are few satisfactions equal to the realization that one has done one's best at a job. 
# Q5 The most difficult college courses usually turn out to be the most rewarding. 
# Q12 Life would have very little meaning if we never had to suffer. 
!!# Q18 I feel uneasy when there is little work for me to do. 
# Q19 A distaste for hard work usually reflects a weakness of character.

!# Q2 Our society would have fewer problems if people had less leisure time. 
!!# Q9 People should have more leisure time to spend in relaxation.  
!!# Q15 Life would be more meaningful if we had more leisure time. 


Q1	Most people spend too much time in unprofitable amusements. 
Q2	Our society would have fewer problems if people had less leisure time. 
Q3	Money acquired easily (e.g. through gambling or speculation) is usually spent unwisely. 
Q4	There are few satisfactions equal to the realization that one has done one''s best at a job. 
Q5	The most difficult college courses usually turn out to be the most rewarding. 
Q6	Most people who don’t succeed in life are just plain lazy. 
Q7	The self-made person is likely to be more ethical than someone who is born to wealth.  
!!Q8	I often feel I would be more successful if I sacrificed certain pleasures. 
Q9	People should have more leisure time to spend in relaxation.  
Q10	Anyone who is able and willing to work hard has a good chance of succeeding. 
!!Q11	People who fail at a job have usually not tried hard enough. 
Q12	Life would have very little meaning if we never had to suffer. 
Q13	Hard work offers little guarantee of success. 
Q14	The credit card is a ticket to careless spending. 
Q15	Life would be more meaningful if we had more leisure time. 
Q16	The person who can approach an unpleasant task with enthusiasm is the one who gets ahead. 
Q17	If one works hard enough they are likely to make a good life for themselves. 
Q18	I feel uneasy when there is little work for me to do. 
Q19	A distaste for hard work usually reflects a weakness of character.



## 9, 13, 15
spec1 <- rep(NA, 17)
spec1[c(6,9,12,14,15)] <- 1
spec1[c(1,3:5,11,16:17)] <- 2
spec1[c(2,8,13)] <- 3
bf1 <- bfactor(dat, spec1, TOL = .001)
summary(bf1)

theta_bf1 <- fscores(bf1, full.scores.SE = TRUE, QMC = TRUE, method = "MAP")
bf_scores <- theta_bf1 %>% as.data.frame %>% select(G,S1,S2,S3) %>% 
	rename(Protestantische_Ethik = G, 
			HarteArbeit_bringt_Erfolg = S1,
			HarteArbeit_verleiht_Sinn = S2,
			Freizeit_ist_schlecht = S3
			)
empirical_rxx(theta_bf1)

( m2_bf1 <- M2(bf1, type = "C2", QMC = TRUE) )

dat_wrel_wscores <- cbind.data.frame(dat_wrel, bf_scores) 

dat_wrel_wscores$SumSc__Protestantische_Ethik <- rowSums(dat)
dat_wrel_wscores$SumSc__HarteArbeit_bringt_Erfolg <- rowSums(dat[,c(6,9,12,14,15)])
dat_wrel_wscores$SumSc__HarteArbeit_gibt_Sinn <- rowSums(dat[,c(1,3:5,11,16:17)])
dat_wrel_wscores$SumSc__Freizeit_ist_schlecht <- rowSums(dat[,c(2,8,13)])
dat_wrel_wscores$G <- thetgm1[,"F1"]

dat_wrel_wscores %>% select(Protestantische_Ethik:SumSc__Freizeit_ist_schlecht) %>% 
	pairs.panels(., hist.col = "darkgrey", breaks = 50, stars = T)

table(dat_wrel_wscores$religion)

dat_wrel_wscores %>% filter(religion != "Other") %>% group_by(religion) %>%
						select(Protestantische_Ethik:Freizeit_ist_schlecht) %>%
						summarise_all( list(mean = mean) )

cath_prot <- dat_wrel_wscores %>% filter(religion %in% c("Catholic","Protestant") )%>%
										mutate(religion = factor(religion) )
effsize::cohen.d(cath_prot$Protestantische_Ethik,cath_prot$religion)
psych::cohen.d(cath_prot$Protestantische_Ethik,cath_prot$religion)
t.test(
		cath_prot$Protestantische_Ethik[cath_prot$religion == "Catholic"],
		cath_prot$Protestantische_Ethik[cath_prot$religion != "Catholic"]
		)

dat_wrel_wscores %>% filter(religion != "Other") %>%
	ggstatsplot::ggbetweenstats(., x = religion, y = Protestantische_Ethik,
								p.adjust.method = "none", pairwise.comparison = T)

dat_wrel_wscores %>% filter(religion != "Other") %>%
	ggstatsplot::ggbetweenstats(., x = religion, y = G,
								p.adjust.method = "none", pairwise.comparison = T)



# dat_wrel_wscores %>% filter(religion != "Other") %>%
	# ggstatsplot::ggbetweenstats(., x = religion, y = HarteArbeit_bringt_Erfolg,
								# p.adjust.method = "n", pairwise.comparison = T)

# dat_wrel_wscores %>% filter(religion != "Other") %>%
	# ggstatsplot::ggbetweenstats(., x = religion, y = HarteArbeit_verleiht_Sinn,
								# p.adjust.method = "n", pairwise.comparison = T)

# dat_wrel_wscores %>% filter(religion != "Other") %>%
	# ggstatsplot::ggbetweenstats(., x = religion, y = Freizeit_ist_schlecht,
								# p.adjust.method = "n", pairwise.comparison = T)








