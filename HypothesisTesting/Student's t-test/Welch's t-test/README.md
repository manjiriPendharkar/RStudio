## Welsh t-test

#### The Welsh t-test is used to determine if the means of two sets of data are significantly different from each other or not. However, Welch’s t-test is designed for unequal population variances, i.e. used when the assumption that the two populations have equal variances seems unreasonable.
When the two samples do not assume same variance like in two-sample t-test, we use Welsh t-test.

We will use the same above example for illustration purposes where A1 and A2 are the weights of screws that were produced by two different machines.

A1 = {30.02, 29.99, 30.11, 29.97, 30.01, 29.99} and A2 = {29.89, 29.93, 29.97, 29.98, 30.02, 29.98}

Hypothesis
- Null hypothesis: There is no difference between the average weights of screws produced by two different
machines A1 and A2.
H0 : µA1 = µA2
-  Alternate hypothesis, Ha: There is a difference between the average weights of screws produced by two
different machines A1 and A2
Ha : µA1 ̸= µA2


##### Assumptions
For Welsh t-test, the following assumption should be met:
- The sample means being compared for two populations follow normal distribution.

##### Decision
- Reject null hypothesis if p value < 0.05
- Do not Reject null hypothesis if p value > 0.05
