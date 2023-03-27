### To create a package

library(devtools)

usethis::create_package("queuing")
usethis::use_r("praise") # to create r

devtools::check()
devtools::document() # help file
usethis::use_mit_license("Jane Doe")
usethis::use_package("glue")


usethis::use_data_raw()
usethis::use_tibble()

usethis::use_testthat()
usethis::use_test("praise")
devtools::test()


