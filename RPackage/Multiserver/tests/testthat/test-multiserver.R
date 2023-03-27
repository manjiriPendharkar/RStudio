
test_that("Multiserver works", {
  expected <- Multiserver(bank$arrival_time, bank$service_time, 1)
  expect_s3_class(expected, "tbl")
  expect_equal(dim(expected), c(100,4))
  expect_named(expected, c('Arrivals','ServiceBegins','ChosenServer','ServiceEnds'))
})

