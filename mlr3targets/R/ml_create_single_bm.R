#' @title Create a single mlr3 benchmark run including tuning
#' @description Creates an mlr3 learner which performs hyperparameter tuning in nested resampling
#' @export
create_single_bm = function(learner,
  learner_id,
  task,
  measure,
  resampling_inner,
  resampling_outer,
  search_space,
  term_evals,
  term_time = 7 * 24 * 60 * 60,
  method,
  fallback = NULL,
  store_models = TRUE) {

  learner = lrn(learner)
  learner$id = learner_id

  measure = msr(measure)
  terminator = trm(
    "combo", list(
      trm("evals", n_evals = term_evals),
      trm("run_time", secs = term_time)
    ), any = TRUE
  )

  # tuning
  at = AutoTuner$new(
    learner = learner,
    resampling = resampling_inner,
    measure = measure,
    terminator = terminator,
    tuner = tnr(method),
    search_space = search_space
  )
  # at = auto_tuner(
  #   learner = learner,
  #   resampling = resampling_inner,
  #   measure = measure, #msr("classif.acc"), # hard coded in this example
  #   search_space = search_space,
  #   term_evals = term_evals,
  #   method = method
  # )
  if(!is.null(fallback)) at$fallback = lrn(fallback)

  resampling_outer = resampling_outer

  design = benchmark_grid(
    tasks = task, learners = list(at),
    resamplings = resampling_outer
  )
  bm = mlr3::benchmark(design, store_models = store_models)
  return(bm)
}
