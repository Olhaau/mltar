# read_csv o.ae.
"_getdata" <- list(
  tar_target(dats, list(
    mtcars,
    iris,
    tsk("penguins"),
    tsk("boston_housing")
  )),

  tar_target(dats_meta, list(
      target = list(
        "mpg",
        "Species"
      ),

      id = list(
        "mtcars",
        "iris"
      )
    )
  )
)

