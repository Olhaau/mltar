"_resamplings" <- list(
  tar_target(
    resampling,
    list(
      inner = rsmp("cv", folds = 2),
      outer = rsmp("cv", folds = 2))
  )
)
