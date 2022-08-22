`_eda` <- list(
  tar_target(eda_assoc_plot,
    lapply(
    tasks, function(task){
      lapply(2:task$ncol, function(ind){
          GGally::ggduo(task$data(), columnsX = 1, columnsY = ind)
      })
    }
  )


))

# tsk("iris")$data() %>%
#   ggduo(., columnsX = 1, columnsY = 2, aes(color = .data[[names(.)[1]]]))

#  tar_target(eda_assoc_grid, tibble::tibble(task = dats_pro) %>%
#               dplyr::mutate(feature = sapply(task, function(t)t$feature_names)) %>%
#               tidyr::unnest_longer(col = feature)),
#
# tar_target(
#   eda_assoc_plot,
#   {
#     print(eda_assoc_grid$task[[1]])
#     print(eda_assoc_grid$feature)
#     mlr3viz::autoplot(eda_assoc_grid$task[[1]]$clone()$select(eda_assoc_grid$feature), type = "duo")
#   },
#   pattern = map(eda_assoc_grid),
#   iteration = "list"
# )

#?mlr3viz::autoplot
#mlr3viz::autoplot(eda_assoc_grid$task[[1]]$clone()$select(eda_assoc_grid$feature[1]), type = "duo")
#
# autoplot(tsk("iris")$clone()$select("Sepal.Length"), type = "duo")
