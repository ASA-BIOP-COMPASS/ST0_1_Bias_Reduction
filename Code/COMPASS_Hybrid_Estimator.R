
rm(list = ls())

n.B.1 = 1000
n.B.2 = 1000

mu.true.vec = c(0.82, 0.95, 0.93, 1, 1.33, 1.28, 1)
sd.true.vec = c(0.55, 0.42, 0.59, 0.4, 0.67, 0.49, 0.42)
n.true.vec = c(13, 16, 20, 8, 18, 24, 10)

############################## Single Parametric bootstrap
theta.1 = function(mu.vec.in, sd.vec.in, n.B.in){
  
  mu12.boot.in = sapply(1:n.B.in, function(x.in){
  mu1.data.in = rnorm(n.true.vec[1], mu.vec.in[1], sd = sd.vec.in[1])
  mu2.data.in = rnorm(n.true.vec[2], mu.vec.in[2], sd = sd.vec.in[2])
  mu3.data.in = rnorm(n.true.vec[3], mu.vec.in[3], sd = sd.vec.in[3])
  mu4.data.in = rnorm(n.true.vec[4], mu.vec.in[4], sd = sd.vec.in[4])
  mu5.data.in = rnorm(n.true.vec[5], mu.vec.in[5], sd = sd.vec.in[5])
  mu6.data.in = rnorm(n.true.vec[6], mu.vec.in[6], sd = sd.vec.in[6])
  mu7.data.in = rnorm(n.true.vec[7], mu.vec.in[7], sd = sd.vec.in[7])
  
  mu1.sample.in = mean(mu1.data.in)
  mu2.sample.in = mean(mu2.data.in)
  mu3.sample.in = mean(mu3.data.in)
  mu4.sample.in = mean(mu4.data.in)
  mu5.sample.in = mean(mu5.data.in)
  mu6.sample.in = mean(mu6.data.in)
  mu7.sample.in = mean(mu7.data.in)
  
  return(max(c(mu1.sample.in, mu2.sample.in, 
               mu3.sample.in, mu4.sample.in,
               mu5.sample.in, mu6.sample.in,
               mu7.sample.in)))
  })
  
  return(2*max(mu.vec.in) - mean(mu12.boot.in))
}

############################## Double Parametric bootstrap
theta.2 = function(mu.vec.in.2, sd.vec.in.2, n.B.2.in){
  
  mu12.boot.in.2 = sapply(1:n.B.2.in, function(x.in.2){
    mu1.data.in.2 = rnorm(n.true.vec[1], mu.vec.in.2[1], sd = sd.vec.in.2[1])
    mu2.data.in.2 = rnorm(n.true.vec[2], mu.vec.in.2[2], sd = sd.vec.in.2[2])
    mu3.data.in.2 = rnorm(n.true.vec[3], mu.vec.in.2[3], sd = sd.vec.in.2[3])
    mu4.data.in.2 = rnorm(n.true.vec[4], mu.vec.in.2[4], sd = sd.vec.in.2[4])
    mu5.data.in.2 = rnorm(n.true.vec[5], mu.vec.in.2[5], sd = sd.vec.in.2[5])
    mu6.data.in.2 = rnorm(n.true.vec[6], mu.vec.in.2[6], sd = sd.vec.in.2[6])
    mu7.data.in.2 = rnorm(n.true.vec[7], mu.vec.in.2[7], sd = sd.vec.in.2[7])
    
    return(theta.1(c(mean(mu1.data.in.2),
                     mean(mu2.data.in.2),
                     mean(mu3.data.in.2),
                     mean(mu4.data.in.2),
                     mean(mu5.data.in.2),
                     mean(mu6.data.in.2),
                     mean(mu7.data.in.2)),
                   c(sd(mu1.data.in.2),
                     sd(mu2.data.in.2),
                     sd(mu3.data.in.2),
                     sd(mu4.data.in.2),
                     sd(mu5.data.in.2),
                     sd(mu6.data.in.2),
                     sd(mu7.data.in.2)), n.B.1
    )
      
      
    )
  })
  
  return(2*theta.1(mu.vec.in.2, sd.vec.in.2, n.B.1) - mean(mu12.boot.in.2))
}

set.seed(2)
est.2 = theta.2(mu.true.vec, sd.true.vec, n.B.2)
print(paste0("Double Bootstrap Estimator: ", est.2))

############################## Hybrid Parametric bootstrap
theta.s.2 = function(mu.vec.in.2, sd.vec.in.2, n.B.2.in){
  
  mu12.boot.in.2 = sapply(1:n.B.2.in, function(x.in.2){
    mu1.data.in.2 = rnorm(n.true.vec[1], mu.vec.in.2[1], sd = sd.vec.in.2[1])
    mu2.data.in.2 = rnorm(n.true.vec[2], mu.vec.in.2[2], sd = sd.vec.in.2[2])
    mu3.data.in.2 = rnorm(n.true.vec[3], mu.vec.in.2[3], sd = sd.vec.in.2[3])
    mu4.data.in.2 = rnorm(n.true.vec[4], mu.vec.in.2[4], sd = sd.vec.in.2[4])
    mu5.data.in.2 = rnorm(n.true.vec[5], mu.vec.in.2[5], sd = sd.vec.in.2[5])
    mu6.data.in.2 = rnorm(n.true.vec[6], mu.vec.in.2[6], sd = sd.vec.in.2[6])
    mu7.data.in.2 = rnorm(n.true.vec[7], mu.vec.in.2[7], sd = sd.vec.in.2[7])
    
    return(theta.1(c(mean(mu1.data.in.2),
                     mean(mu2.data.in.2),
                     mean(mu3.data.in.2),
                     mean(mu4.data.in.2),
                     mean(mu5.data.in.2),
                     mean(mu6.data.in.2),
                     mean(mu7.data.in.2)),
                   c(sd(mu1.data.in.2),
                     sd(mu2.data.in.2),
                     sd(mu3.data.in.2),
                     sd(mu4.data.in.2),
                     sd(mu5.data.in.2),
                     sd(mu6.data.in.2),
                     sd(mu7.data.in.2)), n.B.1
    )
    
    
    )
  })
  
  # return(2*theta.1(mu.vec.in.2, sd.vec.in.2, n.B.1) - mean(mu12.boot.in.2))
  XS.func = 2*theta.1(mu.vec.in.2, sd.vec.in.2, n.B.1) - mean(mu12.boot.in.2)
  Xbar.func = mean(mu.vec.in.2)
  sigma2.func = mean(sd.vec.in.2^2)
  C.func = max(0, 1-6*sigma2.func/((n.true.vec*sum((mu.true.vec-Xbar.func)^2)
  )))
  
  return(C.func*XS.func + (1-C.func)*Xbar.func)
  
  
}

set.seed(2)
est.s.2 = theta.s.2(mu.true.vec, sd.true.vec, n.B.2)
print(paste0("Hybrid Estimator: ", est.s.2))



