# Load packages ---------------------------------------------------------------#
library(targets)
source(here::here("packages.R"))
import::from(dplyr, `%>%`)


# Set target options ----------------------------------------------------------#
tar_option_set(
  format = "qs" # see ?tar_target
)

# Source R functions-----------------------------------------------------------#
R.utils::sourceDirectory(here::here("R"))

# Set mlr3 options ------------------------------------------------------------#
# set mlr3 options globally: suppress progress output of `benchmark()`
# lgr::get_logger("mlr3")$set_threshold("warn") # nolint
options(clustermq.scheduler = "multicore") # for `tar_make_clustermq()`

# Define plans ----------------------------------------------------------------#
R.utils::sourceDirectory("plans")

list(
  # parameter
  `_resamplings`,
  `_measures`,
  `_tuning`,
  `_learners`,
  `_param_set`,
  # execution
  `_getdata`,
  `_preprocessing`,
  `_eda`,
  `_benchmark`,
  `_analysis`
)
