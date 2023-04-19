data {
    int N;
    vector[N] n;
    int y[N];
}

parameters {
    real alpha;
    real theta;
}

transformed parameters {
   vector[N] lambda;
   for (i in 1:N) {
        lambda[i] = exp(alpha + theta*n[i]);
   }
}

model {
    // Prior model
    alpha ~ normal(1.5, 0.8);
    theta ~ normal(0.0007, 0.0003);

    // Poisson likelihood
    for (i in 1:N) {
        y[i] ~ poisson(lambda);
   }
    // y ~ poisson(lambda);
}

generated quantities {
    vector[N] y_pred;
    for (i in 1:N){
        // y_pred[i] = poisson_lpmf(y[i]|lambda[i]);
        y_pred[i] = poisson_rng(lambda[i]);
    }
}