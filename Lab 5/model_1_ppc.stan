generated quantities{
    real alpha = normal_rng(0.7, 0.25);
    real<lower=0> theta = normal_rng(0.0005, 0.00005);
    real n = normal_rng(5500, 1000);
    real<lower=0> lambda =  exp(alpha + theta*n);
    int y_i = poisson_rng(lambda);
}