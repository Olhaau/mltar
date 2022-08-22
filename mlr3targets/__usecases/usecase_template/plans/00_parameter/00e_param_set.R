param_set_svm1 = paradox::ParamSet$new(params = list(
  paradox::ParamFct$new("type", "C-classification"),
  paradox::ParamFct$new("kernel", "radial"),
  paradox::ParamDbl$new("cost", lower = 0, upper = 100),
  paradox::ParamDbl$new("gamma", lower = 0, upper = 100)
))
param_set_svm2 = paradox::ParamSet$new(params = list(
  paradox::ParamFct$new("type", "C-classification"),
  paradox::ParamFct$new("kernel", "radial"),
  paradox::ParamDbl$new("cost", lower = -5, upper = 5),
  paradox::ParamDbl$new("gamma", lower = -5, upper = 3)
  ))
param_set_svm2$trafo <- function(x, param_set) {
    x$cost <- 2^x$cost
    x$gamma <- 2^x$gamma
    return(x)
  }
param_set_knn1 = paradox::ParamSet$new(params = list(
  paradox::ParamInt$new("k", lower = 1, upper = 50),
  paradox::ParamDbl$new("distance", lower = 1, upper = 50)
  ))
param_set_knn2 = paradox::ParamSet$new(params = list(
  paradox::ParamInt$new("k", lower = 1, upper = 30)
  ))
param_set_ranger_def = paradox::ParamSet$new(params = list(
  paradox::ParamDbl$new("mtry.ratio", lower = 0.0, upper = 1),
  paradox::ParamDbl$new("sample.fraction", lower = 0.1, upper = 1),
  paradox::ParamInt$new("num.trees", lower = 1, upper = 2000)
  ))
# s. mlr3tuningspaces::lts("classif.ranger.default")

"_param_set" <- list(
  tar_target(param_sets, list(
    param_set_knn1,
    param_set_ranger_def,
    param_set_svm1
  ))
  #,

  # tar_target(
  #   param_set_svm1,
  #   ParamSet$new(params = list(
  #     ParamFct$new("type", "C-classification"),
  #     ParamFct$new("kernel", "radial"),
  #     ParamDbl$new("cost", lower = 0, upper = 100),
  #     ParamDbl$new("gamma", lower = 0, upper = 100)
  #   ))
  #),
  # tar_target(param_set_svm2, {
  #   foo <- ParamSet$new(params = list(
  #     ParamFct$new("type", "C-classification"),
  #     ParamFct$new("kernel", "radial"),
  #     ParamDbl$new("cost", lower = -5, upper = 5),
  #     ParamDbl$new("gamma", lower = -5, upper = 3)
  #   ))
  #
  #   foo$trafo <- function(x, param_set) {
  #     x$cost <- 2^x$cost
  #     x$gamma <- 2^x$gamma
  #     return(x)
  #   }
  #   return(foo)
  # }),
  # tar_target(param_set_knn1, {
  #   ParamSet$new(params = list(
  #     ParamInt$new("k", lower = 1, upper = 50),
  #     ParamDbl$new("distance", lower = 1, upper = 50)
  #   ))
  # }),
  # tar_target(param_set_knn2, {
  #   ParamSet$new(params = list(
  #     ParamInt$new("k", lower = 1, upper = 30)
  #   ))
  # }),
  # tar_target(param_set_ranger_def, {
  #   ParamSet$new(params = list(
  #     ParamDbl$new("mtry.ratio", lower = 0.0, upper = 1),
  #     ParamDbl$new("sample.fraction", lower = 0.1, upper = 1),
  #     ParamInt$new("num.trees", lower = 1, upper = 2000)
  #   ))
  #   # s. mlr3tuningspaces::lts("classif.ranger.default")
  # })
)
