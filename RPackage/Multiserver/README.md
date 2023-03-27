# assignment2-questione3-manjiri2077

## Multiserver package

`Multiserver` is a toy project and is still under development. You can install the latest version from [GitHub](https://github.com/MQ-STAT1378/assignment2-questione3-manjiri2077) with:

```{r, install, results = "hide", eval = FALSE}
# install.packages("remotes")
remotes::install_github("https://github.com/MQ-STAT1378/assignment2-questione3-manjiri2077")
```

`Multiserver` contains one function only. Multiserver feed customers through a multiserver queuing system to determine each customer's service transition times.

The multiserver function takes
- Arrivals that denotes the time at which the customer arrives
- ServiceTimes that denotes the customer's service duration
- NumServers that denotes the total number of servers available for the shift

The multiserver function returns
a tibble that displays the customer's arrival time, the chosen server, service starting and ending time


```{r example}
library(Multiserver)
 
Multiserver(bank$arrival_time, bank$service_time, 3)
Multiserver(bank$arrival_time, bank$service_time, 2)
Multiserver(bank$arrival_time, bank$service_time, 1)
```

### Attempted

- Had the correct R package structure; files were put in appropriate locations; the package can be installed
- Had all the appropriate documentation for the package = Multiserver.R
- Added the provided data set with proper documentation to the package = bank.R
- Implemented testthat correctly =test/testhat.test-multiserver.R 
- Had used Git & Github correctly
- Implemented tibble 
