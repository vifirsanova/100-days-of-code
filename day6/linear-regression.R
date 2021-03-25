# Linear regression in R
# Dataset
data <- read.table("http://www.randomservices.org/random/data/Challenger2.txt", header=T)
data
#    T  I
#1  53 11
#2  57  4
#3  58  4
#4  63  2
#5  66  0
#6  67  0
#7  67  0
#8  67  0
#9  68  0
#10 69  0
#11 70  4
#12 70  0
#13 70  4
#14 70  0
#15 72  0
#16 73  0
#17 75  0
#18 75  4
#19 76  0
#20 76  0
#21 78  0
#22 79  0
#23 81  0
attach(data)
plot(T, I)
lines(T, fitted(table.lm))
# see img1
# linear model
table.lm <- lm(I~T)
summary(table.lm)
#Call:
#lm(formula = I ~ T)
#
#Residuals:
#    Min      1Q  Median      3Q     Max
#-2.3025 -1.4507 -0.4928  0.7397  5.5337
#
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept) 18.36508    4.43859   4.138 0.000468 ***
#T           -0.24337    0.06349  -3.833 0.000968 ***
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 2.102 on 21 degrees of freedom
#Multiple R-squared:  0.4116,	Adjusted R-squared:  0.3836
#F-statistic: 14.69 on 1 and 21 DF,  p-value: 0.0009677
# Probability interval
-0.24337 - 0.06349*qt(p=0.975, df=21)
# -0.3754047
-0.24337 + 0.06349*qt(p=0.975, df=21)
# -0.1113353
# The intervals are the same as the frequentist confidence intervals
# find y-hat at 31
18.36508-0.24337*31
# 10.82061
# get coefficients
coef(table.lm)
#(Intercept)           T
#  18.365079   -0.243373
# Compute the fitted value
coef(table.lm)[1] + coef(table.lm)[2]*31
#(Intercept)
#   10.82052
# posterior prediction interval (same as frequentist)
predict(table.lm, data.frame(T=31), interval="predict")
#       fit      lwr      upr
#1 10.82052 4.048269 17.59276
10.82052-2.102*qt(p=0.975, df=21)*sqrt(1+1/23+((31-mean(T))^2/22/var(T)))
# 4.047169
# posterior probability for y larger than zero
1-pt((0-10.82052)/(2.102*sqrt(1+1/23+((31-mean(T))^2/22/var(T)))), 21)
# 0.9983813
# Close to 1 => high
data1 <- read.table("http://www.randomservices.org/random/data/Galton.txt", header=T)
head(data1)
#  Family Father Mother Gender Height Kids
#1      1   78.5   67.0      M   73.2    4
#2      1   78.5   67.0      F   69.2    4
#3      1   78.5   67.0      F   69.0    4
#4      1   78.5   67.0      F   69.0    4
#5      2   75.5   66.5      M   73.5    4
#6      2   75.5   66.5      M   72.5    4
attach(data1)
names(data1)
# "Family" "Father" "Mother" "Gender" "Height" "Kids"
summary(lm(Height~Father+Mother+Gender+Kids))
#Call:
#lm(formula = Height ~ Father + Mother + Gender + Kids)
#
#Residuals:
#    Min      1Q  Median      3Q     Max
#-9.4748 -1.4500  0.0889  1.4716  9.1656
#
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept) 16.18771    2.79387   5.794 9.52e-09
#Father       0.39831    0.02957  13.472  < 2e-16
#Mother       0.32096    0.03126  10.269  < 2e-16
#GenderM      5.20995    0.14422  36.125  < 2e-16
#Kids        -0.04382    0.02718  -1.612    0.107
#
#(Intercept) ***
#Father      ***
#Mother      ***
#GenderM     ***
#Kids
#---
#Signif. codes:
#0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 2.152 on 893 degrees of freedom
#Multiple R-squared:  0.6407,	Adjusted R-squared:  0.6391
#F-statistic: 398.1 on 4 and 893 DF,  p-value: < 2.2e-16
summary(lm(Height~Father+Mother+Gender))
#Call:
#lm(formula = Height ~ Father + Mother + Gender)
#
#Residuals:
#   Min     1Q Median     3Q    Max
#-9.523 -1.440  0.117  1.473  9.114
#
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept) 15.34476    2.74696   5.586 3.08e-08
#Father       0.40598    0.02921  13.900  < 2e-16
#Mother       0.32150    0.03128  10.277  < 2e-16
#GenderM      5.22595    0.14401  36.289  < 2e-16
#
#(Intercept) ***
#Father      ***
#Mother      ***
#GenderM     ***
#---
#Signif. codes:
#0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 2.154 on 894 degrees of freedom
#Multiple R-squared:  0.6397,	Adjusted R-squared:  0.6385
#F-statistic:   529 on 3 and 894 DF,  p-value: < 2.2e-16
data1.lm <- lm(Height~Father+Mother+Gender)
# 95% posterior interval for the difference in height by gender
5.226 - 0.144*qt(0.975, 894)
# 4.943383
5.226 + 0.144*qt(0.975, 894)
# 5.508617
# posterior prediction intervals (same as frequentist)
predict(data1.lm, data.frame(Father=68, Mother=64, Gender="M"), interval="predict")
#       fit      lwr     upr
#1 68.75291 64.51971 72.9861
predict(data1.lm, data.frame(Father=68, Mother=64, Gender="F"), interval="predict")
#       fit      lwr      upr
#1 63.52695 59.29329 67.76062
data2 <- read.table("http://users.stat.ufl.edu/~winner/data/pgalpga2008.dat", header=T)
head(data2)
#  X243.2 X67.0 X1
#1  254.5  70.1  1
#2  253.1  59.3  1
#3  228.1  70.4  1
#4  240.8  69.5  1
#5  244.0  69.0  1
#6  257.9  66.3  1
# Separate F (1) and M (2) data
dataF <- subset(data2, X1==1, select=1:2)
head(dataF)
#  X243.2 X67.0
#1  254.5  70.1
#2  253.1  59.3
#3  228.1  70.4
#4  240.8  69.5
#5  244.0  69.0
#6  257.9  66.3
dataM <- subset(data2, X1==2, select=1:2)
head(dataM)
#    X243.2 X67.0
#157  290.3  59.5
#158  302.1  54.7
#159  287.1  62.4
#160  282.7  65.4
#161  299.1  52.8
#162  300.2  51.1
attach(dataF)
plot(x=X243.2, y=X67.0)
# see img2
attach(dataM)
plot(x=X243.2, y=X67.0)
# see img3
dataF.lm <- lm(dataF$X67.0~dataF$X243.2)
summary(dataF.lm)
#Call:
#lm(formula = dataF$X67.0 ~ dataF$X243.2)
#
#Residuals:
#     Min       1Q   Median       3Q      Max
#-23.6956  -2.6812   0.9755   3.6835  10.2227
#
#Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
#(Intercept)  130.9995    10.9663  11.946  < 2e-16 ***
#dataF$X243.2  -0.2569     0.0444  -5.786  3.9e-08 ***
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 5.262 on 154 degrees of freedom
#Multiple R-squared:  0.1786,	Adjusted R-squared:  0.1732
#F-statistic: 33.48 on 1 and 154 DF,  p-value: 3.903e-08
coef(dataF.lm)[1] + coef(dataF.lm)[2]*260
# 64.21029
predict(dataF.lm, data.frame(T=260), interval="predict")
