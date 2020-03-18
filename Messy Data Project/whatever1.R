rm(list=ls())
load("C:/Users/User/Documents/Messy Data Project/DSP1.Rdata")

DSP_Dataset_v1 <- subset(DSP_Dataset_v1, select=c(country_name, country_text_id, country_id, year, 
                                                  v2smgovdom, v2smgovdom, v2smgovsmmon, v2smregcon, v2smonper, v2smmefra, v2smhargr_0, v2smhargr_1, v2smhargr_2, v2smhargr_6, v2smarrest_ord, v2smpolsoc, v2smpolhate_ord))
DSP_Dataset_v1$country_name <- as.factor(DSP_Dataset_v1$country_name)
DSP_Dataset_v1$v2smgovdom.1 <- NULL
DSP_Dataset_v1$v2smpolsoc <- DSP_Dataset_v1$v2smpolsoc*(-1)

save(DSP_Dataset_v1, file="DSP2.Rdata")


hist(DSP_Dataset_v1$v2smonper)
hist(DSP_Dataset_v1$v2smgovsmmon)
hist(DSP_Dataset_v1$v2smregcon)

plot(y=DSP_Dataset_v1$v2smgovdom, x=DSP_Dataset_v1$v2smregcon)

fit <- lm(v2smgovdom ~ v2smregcon, data=DSP_Dataset_v1)
summary(fit)
