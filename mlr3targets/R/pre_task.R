#' @title Creates a task from data.
#' @description ...
#' @export
pre_task = function(dat, target = NULL, type = NULL,rm.misstarget = TRUE, ...){

  if(is.null(target)) target = names(dat)[1]

  if(is.null(type)){
    if(class(dat[[target]]) %in% c("character", "factor", "logical")){
      type = "classif"
    } else {type = "regr"}
  }

  if(rm.misstarget) dat = dat[!is.na(dat[[target]]),]

  if(type == "classif"){
    task = mlr3::as_task_classif(dat, target = target, ...)
  } else if(type == "regr"){
    task = mlr3::as_task_regr(dat, target = target, ...)
  }

  return(task)
}
