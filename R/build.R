source(here::here("R/load.R"))

dir_info("analysis", regexp = "\\.Rmd$") %>%
    mutate(
        render = walk(path, rmarkdown::render, output_dir = "output", encoding = "UTF-8")
    )

dir_info("analysis", regexp = "\\.(html|md)$") %>%
    mutate(
        render = walk(path, file_delete)
    )

dir_info("output", regexp = "\\.(html)$") %>%
    mutate(
        render = walk(path, file_delete)
    )
