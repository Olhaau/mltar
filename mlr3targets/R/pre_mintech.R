#' @title Robustify a task.
#' @description Minimal technical preprocessing.
#' @export
pre_mintech = function(task, ...){
  mlr3pipelines::ppl("robustify", task = task, ...)$train(task)[[1]]
}
