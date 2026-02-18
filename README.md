# A Hybrid Estimator to Reduce Selection Bias when Designing Phase 3 Studies

## 1. The Motivating Question:
Several retrospective research articles reported the phenomenon of “diminished treatment effect in Phase 3” based on many case studies. The commonly used estimator does not adjust for the selection bias of the proceeding Phase 2 study with multiple groups, and substantially overestimates the efficacy of selected group(s). Such an optimistic assumption may mislead the design of Phase 3 without sufficient power to demonstrate potential treatment effects. 

## 2. Introduction of this Computational Method:
One potential candidate to address this question is the hybrid estimator (Zhan et al., 2024). This approach leverages both double Bootstrap techniques and shrinkage estimators to balance of the reduction of both bias and mean squared error (MSE) when estimating the efficacy of the selected group. It accommodates general settings with multiple (more than two) groups based on either subject-level data or group-level summary data, as well as homogeneous or heterogeneous variance between treatment groups.

## 3.Illustration of this Computational Method:
Consider a Phase 2 study with $I$ active treatment groups and $n_i$ patients randomized to the $i$ th treatment group, for $i = 1, \cdots, I$. We assume the response $X_{i, j}$ of the treatment group $i$, for $i = 1, \cdots, I$, and the subject $j$, for $j = 1, \cdots, n_i$, follows a Normal distribution,

$$X_{i, j} \sim \mathcal{N}\left(\theta_i, \sigma_i^2\right),$$

where $\theta_i$ is the mean and $\sigma_i$ is the standard deviation of the treatment group $i$. We assume that a larger value of $X_{ij}$ corresponds to a better outcome, and $\sigma_i$ is unknown. Denote $X_i  = (X_{i, 1}, \cdots, X_{i, n_i} )$ as the vector of responses from group $i$, and $\boldsymbol{X} = (\boldsymbol{X}_1, \cdots, \boldsymbol{X}_I)$. 

After obtaining data from multiple treatment groups, the study team will usually select one or two treatment group(s) to confirm findings in Phase 3 studies. We consider a motivating scenario where all treatment groups have similar safety profiles, and the most efficacious group will be moved to Phase 3. A key question is how to accurately characterize the efficacy of this selected group for sample size calculation. 

The corresponding statistical question is to use observed data $\left( X_1, \cdots, X_I \right)$ to estimate the parameter of interest $\theta_{max}$, defined as,

$$\theta_{max} = \max(\theta_1, \cdots, \theta_I). $$

A traditional estimator $\widehat{\theta}$ is commonly used in practice to estimate $\theta_{max}$:

$$\widehat{\theta}(\boldsymbol{X}) = \max\left[\widetilde{\theta}(\boldsymbol{X}_1), \cdots, \widetilde{\theta}(\boldsymbol{X}_I)\right], $$

where $\widetilde{\theta}(x)$ is the sample mean of $x$, and $\widetilde{\theta}(X_i)$ as an unbiased estimator of $\theta_i$. However, $\widehat{\theta}(\boldsymbol{X})$ may overestimate $\theta_{max}$ in finite-samples. Even though $\widetilde{\theta}(\boldsymbol{X}_i)$ can accurately estimate $\theta_i$ with no bias for each treatment group $i$, one does not know which treatment group has the highest true response mean $\theta_i$ in (\ref{equ:theta_max}) based on observed data.




