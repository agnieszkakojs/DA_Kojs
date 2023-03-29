data {
    int<lower=0> N; // number of data points
    int y; // data to model, number of successes
}

parameters {
   real<lower=0, upper=1> p; // probability of allergic reaction
}

model {
    // Prior model
    p ~ normal(0.2, 0.02);

    // Binomial likelihood
    y ~ binomial(N, p);
}

generated quantities {
    // simulate data using a binomial distribution
   int y_pred = binomial_rng(N, p);
}