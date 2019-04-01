library(plumber)
r <- plumb("api.R")
r$run(port=9000, host='0.0.0.0', swagger=TRUE)
