data {
    int<lower=0> N; // number of data points
    vector[N] weight; // data to model
}

generated quantities {
    real alpha = normal_rng(170, 8);
    real beta = lognormal_rng(0, 0.25);
    real sigma = normal_rng(15, 2);
    vector[N] height;
    for (n in 1:N){
        height[n] = normal_rng(alpha + beta * weight[n], sigma);
    }
}