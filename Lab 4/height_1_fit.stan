data {
    int<lower=0> N; // number of data points
    vector[N] heights; // data to model
}

parameters {
    real mu;
    real<lower = 0> sigma;
}

model {
    // Prior model
    mu ~ normal(170, 8);
    sigma ~ normal(15, 2);

    // Normal likelihood
    heights ~ normal(mu, sigma);
}

generated quantities {
    // simulate data using a normal distribution
   real<lower=20, upper=270> height_pred = normal_rng(mu, sigma);
}