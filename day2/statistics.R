# X ∼ Binomial(5, 0.6)
# F(1) = P(X ≤ 1) ≈ 0.087
pbinom(q=1, size=5, prob=0.6)
qbinom(p=0.087, size=5, prob=0.6)

# Y ∼ Exp(1)
# 80% of probability mass is between 0.1 and 0.9 quantiles
a <- c(0.1, 0.9)
qexp(p=a, rate=1)
# P(0.105 < Y ≤ 2.303) = 0.8.

# X ∼ Pois(3)
# P(X = 1)
dpois(x=1, lambda=3)

# X ∼ Pois(3)
# P(X ≤ 1)
ppois(q=1, lambda=3)

# X ∼ Pois(3)
# P(X > 1)
1 - ppois(q=1, lambda=3)

# Y ∼ Gamma(2, 1/3)
# P(0.5 < Y < 1.5)
y <- c(0.5, 1.5)
dgamma(1, shape=2, rate=1/3)

# Z ∼ N(0, 1)
# P(Z < z) = 0.975
qnorm(0.975, mean=0, sd=1)

# Z ∼ N(0, 1)
# P(−1.96 < Z < 1.96)
pnorm(1.96, mean=0, sd=1) - pnorm(-1.96, mean=0, sd=1)

# Z ∼ N(0, 1)
# P(−z < Z < z) = 0.95
qnorm(c(0.05, 0.95), mean=0, sd=1)

# Evaluate the PDF at x (mean = µ and sd = √σ**2).
# d function evaluates the density/mass
dnorm(x, mean, sd)
# Evaluate the CDF at q.
# p function evaluates the CDF
pnorm(q, mean, sd)
# Evaluate the quantile function at p.
# q function evaluates the quantile
qnorm(p, mean, sd)
# Generate n pseudo-random samples from the normal distribution.
# r function generates a sample
rnorm(n, mean, sd)
# Binomial(n, p)
# size = n, prob = p
dbinom(x, size, prob)
# Exp(λ)
# rate = λ
dexp(x, rate)
# Uniform(a, b)
# min = a, max = b
dunif(x, min, max)
# Beta(α, β)
# shape1 = α, shape2 = β
dbeta(x, shape1, shape2)
# N(µ, σ**2)
# mean = µ, sd = √σ**2
dnorm(x, mean, sd)
# tν
# df = ν
dt(x, df)
