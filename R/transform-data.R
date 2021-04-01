transform <- function(data, trt, outcome, baseline, time_vary, time, timeId) {
  cp <- data.table::copy(data)
  data.table::setDT(cp)

  cp <- cp[, c(trt, outcome, baseline, time_vary, time, timeId), with = FALSE]
  stats::reshape(cp,
                 v.names = c(trt, time_vary),
                 direction = "wide",
                 timevar = time,
                 idvar = timeId)
}

