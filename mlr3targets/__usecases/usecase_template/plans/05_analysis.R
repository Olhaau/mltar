"_analysis" <- list(
  tar_target(bm_plot, list(
    classif = mlr3viz::autoplot(bm_agg$classif, measure = msr(measure_outer$classif)),
    regr    = mlr3viz::autoplot(bm_agg$regr, measure = msr(measure_outer$regr))
  )),


  tar_target(bm_table, list(

    classif =
      as.data.table(
        bm_agg$classif$aggregate(
          msrs(c(measure_outer$classif, "time_train", "time_predict", "time_both")))
        )[order(task_id, get(measure_outer$classif)
                ),
          -c("resample_result")],

    regr =
      as.data.table(
        bm_agg$regr$aggregate(
          msrs(c(measure_outer$regr, "time_train", "time_predict", "time_both")))
      )[order(task_id, get(measure_outer$regr)
      ),
      -c("resample_result")]

  )),
  tarchetypes::tar_render(
    report, "report.rmd"#here::here("__usecases/base_classif/report.rmd")
  )
)
