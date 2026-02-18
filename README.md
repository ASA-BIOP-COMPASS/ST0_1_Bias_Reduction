# A Hybrid Estimator to Reduce Selection Bias when Designing Phase 3 Studies

## 1. The Motivating Question:
Several retrospective research articles reported the phenomenon of “diminished treatment effect in Phase 3” based on many case studies. The commonly used estimator does not adjust for the selection bias of the proceeding Phase 2 study with multiple groups, and substantially overestimates the efficacy of selected group(s). Such an optimistic assumption may mislead the design of Phase 3 without sufficient power to demonstrate potential treatment effects. 

## 2. Introduction of this Computational Method:
One potential candidate to address this question is the hybrid estimator (Zhan et al., 2024). This approach leverages both double Bootstrap techniques and shrinkage estimators to balance of the reduction of both bias and mean squared error (MSE) when estimating the efficacy of the selected group. It accommodates general settings with multiple (more than two) groups based on either subject-level data or group-level summary data, as well as homogeneous or heterogeneous variance between treatment groups.

## 3.Illustration of this Computational Method:
Consider a previous study with $I$ active treatment groups and $n_i$ patients randomized to the $i$th treatment group, for $i = 1, \cdots, I$. We consider the response $X_{i, j}$ of the treatment group $i$, for $i = 1, \cdots, I$, and the subject $j$, for $j = 1, \cdots, n_i$, follows a Normal distribution,



