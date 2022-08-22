"_benchmark" = list(

  tar_target(bm,

    create_single_bm(
     learner      = paste0(tasks[[1]]$task_type, ".",learners$key),
     learner_id   = learners$id,
     task         = tasks,
     measure      = measure[[tasks[[1]]$task_type]],
     search_space = param_sets[[1]],
     resampling_inner = resampling$inner,
     resampling_outer = resampling$outer,
     term_evals   = tuning$term_evals,
     term_time    = tuning$term_time,
     method       = tuning$method,
     fallback     = paste0(tasks[[1]]$task_type, ".featureless")
    ),

    pattern = cross(tasks, map(learners, param_sets)),
    iteration = "list"
  ),

  # combine single benchmark results (all)
  tar_target(bm_agg, {
    task_types = lapply(bm, function(m) m$task_type)

    list(
      classif = do.call(c,bm[which(task_types == "classif")]),
      regr    = do.call(c,bm[which(task_types == "regr")])
    )
  })
)



