
# setup -------------------------------------------------------------------

library(devtools)
# use_git()

use_build_ignore("dev_history_r_pkg.R")
library(magrittr)

options(usethis.full_name = "Jiaxiang Li")

# coding ------------------------------------------------------------------

# prettify ----------------------------------------------------------------

# use_readme_rmd()
file.edit("README.Rmd")
rmarkdown::render("README.Rmd")
rstudioapi::viewer("README.html")
file.remove("README.html")

# add disclaimer ----------------------------------------------------------

usethis::use_code_of_conduct()
clipr::write_clip('`r add2pkg::add_disclaimer("Jiaxiang Li", license_name = "CC-BY-4.0")`')
file.edit("README.Rmd")
rmarkdown::render("README.Rmd")
rstudioapi::viewer("README.html")
file.remove("README.html")

# add examlpes ------------------------------------------------------------

clipr::read_clip() %>%
    str_c("#' ", .) %>%
    clipr::write_clip()

clipr::read_clip() %>%
    str_c("#' \\dontrun{", ., "}") %>%
    clipr::write_clip()



# render book -------------------------------------------------------------

bookdown::render_book("game-notes.Rmd", clean_envir = FALSE, output_dir = "docs")
source("R/build.R")
rmarkdown::render("game-notes.Rmd")


# desc --------------------------------------------------------------------

library(usethis)
desc <- usethis:::build_description()
desc <- desc::description$new(text = desc)
tidy_desc(desc)
lines <- desc$str(by_field = TRUE, normalize = FALSE, mode = "file")
write_over(proj_path("DESCRIPTION"), lines)
if (!getOption("usethis.quiet", default = FALSE)) {
    print(desc)
}

file.edit("DESC")



# use travis --------------------------------------------------------------


use_travis()
# refs https://github.com/apreshill/bookdown-travis-production-context




