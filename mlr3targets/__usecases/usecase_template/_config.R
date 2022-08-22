# Change to the name of the Use Case folder:
usecase = "usecase_template"
run = TRUE

# Configuration ---------------------------------------
# S. https://books.ropensci.org/targets/projects.html

library(targets)
library(here)

usecase_path = paste0("__usecases/", usecase)

if(getwd() != here()) setwd(here())
tar_config_set(
  store = here::here(paste0(usecase_path, "/_targets")),
  script = here::here(paste0(usecase_path, "/_targets.R")),
  project = usecase
)

if(getwd() != here(usecase_path)) setwd(here(usecase_path))
Sys.setenv(TAR_PROJECT = usecase)


# Run -------------------------------------------------
if (run) tar_make()

# Clean -----------------------------------------------
rm(usecase, usecase_path, run)
