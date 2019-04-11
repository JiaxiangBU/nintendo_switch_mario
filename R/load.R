# library -----------------------------------------------------------------

library(tidyverse)
library(fs)
library(glue)
library(rio)
library(here)

## rmarkdown -------------------------------------------------------------

library(knitr)
library(kableExtra)
library(markdown)



# souce custom func -------------------------------------------------------

# here("R") %>% dir_info() %>% 
#     filter(!path %>% str_detect('load.R')) %>% 
#     mutate(
#         source = map(path,source)
#     )