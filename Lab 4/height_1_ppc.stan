generated quantities {
    real mu = normal_rng(170, 8);
    real sigma = normal_rng(15, 2); // Exponential
    real<lower=20, upper=270> height = normal_rng(mu, sigma);
}