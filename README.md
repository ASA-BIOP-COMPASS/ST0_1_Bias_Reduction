# A Hybrid Estimator to Reduce Selection Bias when Designing Phase 3 Studies

## 1. The Motivating Question:
Several retrospective research articles reported the phenomenon of “diminished treatment effect in Phase 3” based on many case studies. The commonly used estimator does not adjust for the selection bias of the proceeding Phase 2 study with multiple groups, and substantially overestimates the efficacy of selected group(s). Such an optimistic assumption may mislead the design of Phase 3 without sufficient power to demonstrate potential treatment effects. 

## 2. Introduction of this Computational Method:
One potential candidate to address this question is the hybrid estimator (Zhan et al., 2024). This approach leverages both double Bootstrap techniques and shrinkage estimators to balance of the reduction of both bias and mean squared error (MSE) when estimating the efficacy of the selected group. It accommodates general settings with multiple (more than two) groups based on either subject-level data or group-level summary data, as well as homogeneous or heterogeneous variance between treatment groups.

## 3. Illustration of this Computational Method:

### 3.1. Problem Setup:
Consider a Phase 2 study with $I$ active treatment groups and $n_i$ patients randomized to the $i$ th treatment group, for $i = 1, \cdots, I$. We assume the response $X_{i, j}$ of the treatment group $i$, for $i = 1, \cdots, I$, and the subject $j$, for $j = 1, \cdots, n_i$, follows a Normal distribution,

$$X_{i, j} \sim \mathcal{N}\left(\theta_i, \sigma_i^2\right),$$

where $\theta_i$ is the mean and $\sigma_i$ is the standard deviation of the treatment group $i$. We assume that a larger value of $X_{ij}$ corresponds to a better outcome, and $\sigma_i$ is unknown. Denote $X_i  = (X_{i, 1}, \cdots, X_{i, n_i} )$ as the vector of responses from group $i$, and $\boldsymbol{X} = (\boldsymbol{X}_1, \cdots, \boldsymbol{X}_I)$. 

After obtaining data from multiple treatment groups, the study team will usually select one or two treatment group(s) to confirm findings in Phase 3 studies. We consider a motivating scenario where all treatment groups have similar safety profiles, and the most efficacious group will be moved to Phase 3. A key question is how to accurately characterize the efficacy of this selected group for sample size calculation. 

The corresponding statistical question is to use observed data $\left( X_1, \cdots, X_I \right)$ to estimate the parameter of interest $\theta_{max}$, defined as,

$$\theta_{max} = \max(\theta_1, \cdots, \theta_I). $$

### 3.2. A Traditional Estimator $\widehat{\theta}$:
A traditional estimator $\widehat{\theta}$ is commonly used in practice to estimate $\theta_{max}$:

$$\widehat{\theta}(\boldsymbol{X}) = \max\left[\widetilde{\theta}(\boldsymbol{X}_1), \cdots, \widetilde{\theta}(\boldsymbol{X}_I)\right], $$

where $\widetilde{\theta}(x)$ is the sample mean of $x$, and $\widetilde{\theta}(X_i)$ as an unbiased estimator of $\theta_i$. However, $\widehat{\theta}(\boldsymbol{X})$ may overestimate $\theta_{max}$ in finite-samples. Even though $\widetilde{\theta}(\boldsymbol{X}_i)$ can accurately estimate $\theta_i$ with no bias for each treatment group $i$, one does not know which treatment group has the highest true response mean $\theta_i$ in (\ref{equ:theta_max}) based on observed data.

### 3.3. The Double Bootstrap Estimator $\widehat{\theta}^{(2)}(X)$:
Suppose that we have $\widehat{\theta}(X)$ as an initial estimator of $\theta_{max}$. Its bias at $\theta_0$ is denoted as $A(\theta_0)$,

$$A(\theta_0) = E\left[\widehat{\theta}(\boldsymbol{X}) \right] - \theta_0.$$

Since the true value $\theta_0$ of $\theta_{max}$ is to be estimated and the functional form of $A(\cdot)$ is usually unknown, one can use $\widehat{A}\left[\widehat{\theta}(X) \right]$ to approximate $A(\theta_0)$,

$$\widehat{A}\left[\widehat{\theta}(\boldsymbol{X}) \right] = \widehat{E}\left[\widehat{\theta}(\boldsymbol{X}_B) \right] - \widehat{\theta}(\boldsymbol{X}), $$

where $\widehat{E}$ is the empirical expectation based on Monte Carlo Bootstrap data $\boldsymbol{X}_B$ with size $B$. The single Bootstrap estimator $\widehat{\theta}^{(1)}(X)$ can then be constructed as,

$$\widehat{\theta}^{(1)}(\boldsymbol{X}) = \widehat{\theta}(\boldsymbol{X}) - \widehat{A}\left[\widehat{\theta}(\boldsymbol{X}) \right]. $$

To further reduce bias, we can iteratively apply the above approach with $\widehat{\theta}^{(1)}(X)$ as the initial estimator to obtain the double Bootstrap estimator $\widehat{\theta}^{(2)}(X)$.

### 3.4. The Hybrid Estimator $\widehat{\theta}^{(2)}_{H}$:
The following shrinkage estimator is commonly used to reduce MSE when estimating $\theta_{max}$.

$$\widehat{\theta}_{S}(X) = C_{+} \widehat{\theta}(X) + \left(1-C_{+}\right) \widetilde{\theta}(X) $$

$$ C_{+} = \max(0, C) $$

$$ C = 1- \frac{(I-1)\sigma^2}{\sum_{i=1}^I n_i\left[\widetilde{\theta}(X_i) - \widetilde{\theta}(X)\right]^2} $$

The $\sigma^2$ in $C$ is the average of empirical variance estimators from all $I$ groups. The proposed hybrid estimators $\widehat{\theta}^{(2)}_{H}$ substitute $\widehat{\theta}$ in by $\widehat{\theta}^{(2)}$.

## 4. A Case Study:

### 4.1. Data:

Data are based on group-level summary statisticis from AWARD-5, which was an adaptive, dose-finding, seamless Phase 2/3 study of dulaglutide for the treatment of type 2 diabetes mellitus (Geiger et al., 2012). For illustration purposes, we consider a simplified problem of treating Stage 1 as a previous Phase 2 study, while Stage 2 as the new Phase 3 study. Our goal is to accurately estimate the response mean of the selected group dulaglutide 1.5 mg to plan its sample size for Stage 2 based on results in Stage 1. The dosing regimen dulaglutide 1.5 mg was selected as the most efficacious group for further testing in Stage 2 during the actual trial conduct of AWARD-5. 

Assessments are based on the primary efficacy endpoint of change from Baseline (CHG) of glycosylated hemoglobin (HbA1c) at Week 52. For notation consistency, we use the negative of CHG (decrease in HbA1c) with a larger value denoting a better response. The table below summarizes the response mean (based on Bayesian posterior mean), the sample size, and the standard deviation (based on Normal approximation of Bayesian 95\% credible intervals) for each of the 7 active treatment groups in Stage 1 of dose selection. 

| Group | -CHG of HbA1c at Week 52 | n | SD |
| --- | --- | --- | --- |
  | Dulaglutide 0.25 mg | 0.82 | 13 | 0.55 |
  | Dulaglutide 0.5	mg | 0.95 | 16 | 0.42 |
  | Dulaglutide 0.75 mg | 0.93 | 20 | 0.59 |
  | Dulaglutide 1 mg | 1.00 | 8 | 0.40 |
  | Dulaglutide 1.5 mg | 1.33 | 18 | 0.67 |
  | Dulaglutide 2 mg | 1.28 | 24 | 0.49 |
  | Dulaglutide 3 mg | 1.00 | 10 | 0.42 |

### 4.2. Data:

