"_learners" <- list(
  tar_target(learners, tibble(
    key = c(
    "kknn",
    "ranger",
    "svm"
    ),
    id = c(
      "knn_def",
      "ranger_def",
      "svm_def"
    )
  )
))
