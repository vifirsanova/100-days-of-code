# Plotting the prior probabilities
theta <- seq(from = 0, to = 1, by = 0.01)
# [1] 0.00 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.11 0.12 0.13 0.14
# [16] 0.15 0.16 0.17 0.18 0.19 0.20 0.21 0.22 0.23 0.24 0.25 0.26 0.27 0.28 0.29
# [31] 0.30 0.31 0.32 0.33 0.34 0.35 0.36 0.37 0.38 0.39 0.40 0.41 0.42 0.43 0.44
# [46] 0.45 0.46 0.47 0.48 0.49 0.50 0.51 0.52 0.53 0.54 0.55 0.56 0.57 0.58 0.59
# [61] 0.60 0.61 0.62 0.63 0.64 0.65 0.66 0.67 0.68 0.69 0.70 0.71 0.72 0.73 0.74
# [76] 0.75 0.76 0.77 0.78 0.79 0.80 0.81 0.82 0.83 0.84 0.85 0.86 0.87 0.88 0.89
# [91] 0.90 0.91 0.92 0.93 0.94 0.95 0.96 0.97 0.98 0.99 1.00
plot(theta, dbeta(theta, 1, 1), type = 'l')
# Default Uniform prior as Beta(1, 1)
# See img1
plot(theta, dbeta(theta, 4, 2), type = 'l')
# See img2
# We'd like to try get the prior mean of 2/3
plot(theta, dbeta(theta, 8, 4), type = 'l')
# See img3
# Pbeta gives us the cumulative dist. func. for the Beta dist., it's <= val.
1-pbeta(0.25, 8, 4)
# 0.9988117
1-pbeta(0.5, 8, 4)
# 0.8867188
1-pbeta(0.8, 8, 4)
# 0.1611392
# ^ Those are the priors.
41/(41 + 11)
# 0.7884615
# posterior mean
33/40
# 0.825
# MLE
# We can add the posterior dist. to the plot.
plot(theta, dbeta(theta, 41, 11), type = 'l')
lines(theta, dbeta(theta, 8, 4), lty = 2)
lines(theta, 44 * dbinom(33, size = 40, p = theta), lty = 3)
# See img4
# Now we'll compute the posterior probability.
1-pbeta(0.25, 41, 11)
# 1
1-pbeta(0.5, 41,11)
# 0.9999926
1-pbeta(0.8, 41, 11)
# 0.4444044
# Quantiles from the beta dist.:
qbeta(0.025, 41, 11)
# 0.6688426
qbeta(0.975, 41, 11)
# 0.8871094
# This consists with the plot.
32/(32 + 20)
# 0.6153846
# posterior mean
24/40
# MLE
# 0.6
plot(theta, dbeta(theta, 32, 20), type = 'l')
lines(theta, dbeta(theta, 8, 4), lty = 2)
lines(theta, 44 * dbinom(24, size = 40, p = theta), lty = 3)
# See img5
1-pbeta(0.25, 32, 20)
# 1
1-pbeta(0.5, 32,20)
# 0.9540427
1-pbeta(0.8, 32, 20)
# 0.00124819
qbeta(0.025, 32, 20)
# 0.4808022
qbeta(0.975, 32, 20)
# 0.7415564
# We can now estimate the similarity
theta1 <- rbeta(1000, 41, 11)
theta2 <- rbeta(1000, 32, 20)
mean(theta1 > theta2)
# 0.976
