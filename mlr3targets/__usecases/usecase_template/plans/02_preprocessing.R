`_preprocessing` <- list(
  tar_target(tasks,
    lapply(1:length(dats), function(i) preprocs[[i]](dats[[i]]))
  ),

  tar_target(preprocs, list(
    . %>% pre_task(target = dats_meta$target[[1]], id = dats_meta$id[[1]]) %>%
      pre_mintech,
    . %>% pre_task(target = dats_meta$target[[2]], id = dats_meta$id[[2]]),
    pre_mintech

    ,pre_mintech, pre_mintech
    )
  )
)
