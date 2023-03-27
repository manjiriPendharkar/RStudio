## Multiserver package

`Multiserver` is a toy project and is still under development. You can install the latest version from [GitHub](https://github.com/manjiriPendharkar/RStudio/edit/main/RPackage/Multiserver) with:

```{r, install, results = "hide", eval = FALSE}
# install.packages("remotes")
remotes::install_github("https://github.com/manjiriPendharkar/RStudio/edit/main/RPackage/Multiserver/")
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

