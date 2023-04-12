data {
    int<lower=0> N; // number of data points
    vector[N] heights; // data to model
    vector[N] weight;
}

parameters {
    real alpha;
    real<lower = 0> sigma;
    real beta1;
    real beta2;
}

transformed parameters {
    vector[N] mu;
    for (n in 1:N){
        mu[n] = alpha + beta1 * weight[n] + beta2 * (weight[n]*weight[n]);
    }
}

model {
    // Prior model
    alpha ~ normal(170, 8);
    sigma ~ normal(15, 2);
    beta1 ~ lognormal(0, 1);
    beta2 ~ lognormal(0, 0.5);

    // Normal likelihood
    heights ~ normal(mu, sigma);
}

generated quantities {
    // simulate data using a normal distribution
    vector[N] height_pred;
    for (n in 1:N) {
        height_pred[n] = normal_rng(mu[n], sigma);
    }
}