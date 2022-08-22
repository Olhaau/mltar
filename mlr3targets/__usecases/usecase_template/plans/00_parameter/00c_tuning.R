"_tuning" = list(
  tar_target(
    tuning, list(
      method = "random_search",
      term_evals = 2,
      term_time  = 1 * 60 #secs
    )
  )
)
