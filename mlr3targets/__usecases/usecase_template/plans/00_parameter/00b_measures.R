`_measures` <- list(tar_target(
  measure, list(
    classif  = "classif.ce",
    regr = "regr.mse"
  )),

  tar_target(
    measure_outer, list(
      classif = "classif.ce",
      regr = "regr.rmse"
  ))
)
