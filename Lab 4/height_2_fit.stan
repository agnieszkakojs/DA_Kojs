data {
    int<lower=0> N; // number of data points
    vector[N] heights; // data to model
    vector[N] weight;
}

parameters {
    real alpha;
    real<lower = 0> sigma;
    real beta;
}

transformed parameters {
    vector[N] mu;
    for (n in 1:N){
        mu[n] = alpha + beta * weight[n];
    }
}

model {
    // Prior model
    alpha ~ normal(170, 8);
    sigma ~ normal(15, 1);
    beta ~ lognormal(0, 0.25);

    // Normal likelihood
    for (n in 1:N) {
        heights[n] ~ normal(mu[n], sigma);
    }
}

generated quantities {
    // simulate data using a normal distribution
    vector[N] height_pred;
    for (n in 1:N) {
        height_pred[n] = normal_rng(mu[n], sigma);
    }
}