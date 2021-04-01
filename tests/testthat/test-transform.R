data("iptwExLong")
test <- cbind(iptwExLong$covariates, y = iptwExLong$outcome)

out <- transform(test, "tx", "y", c("gender", "age"), c("use"), "time", "ID")
data.table::setDF(out)

a <- paste0("tx.", 1:3)
baseline <- c("gender", "age")
tv <- list(c("use.1"), c("use.2"), c("use.3"))
lmtp_tmle(out, a, "y", baseline = baseline, time_vary = tv,
          shift = static_binary_on, outcome_type = "continuous",
          folds = 2, .SL_folds = 2)
