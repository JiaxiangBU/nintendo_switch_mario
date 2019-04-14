# From nintendo_switch_mario R folder
# cp it!
source(here::here("R/load.R"))

dir_info("analysis", regexp = "\\.Rmd$") %>%
    mutate(
        render = walk(path, rmarkdown::render, output_dir = "output", encoding = "UTF-8")
    )

dir_info("analysis", regexp = "\\.(html|md)$") %>%
    mutate(
        render = walk(path, file_delete)
    )

# make output -------------------------------------------------------------
# make it robust
if (!dir_exists("output")) dir_create("output")
dir_info("output", regexp = "\\.(html)$") %>%
    mutate(
        render = walk(path, file_delete)
    )
