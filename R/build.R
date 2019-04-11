source(here::here("R/load.R"))

dir_info("analysis", regexp = "\\.Rmd$") %>%
    mutate(
        render = walk(path, render, output_dir = "output")
    )

dir_info("analysis", regexp = "\\.html$") %>%
    mutate(
        render = walk(path, file_delete)
    )
