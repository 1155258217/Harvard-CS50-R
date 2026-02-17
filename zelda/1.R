library(tidyverse)
library(stringr)
library(tibble)

zelda <- read.csv('zelda.csv')

zelda <- zelda |>
  pivot_wider(
    id_cols = c(title, release),
    names_from = role,
    values_from = names
  )

zelda <- add_column(zelda, year = str_split(zelda$release, ' - ', simplify=TRUE)[, 1], .after='title')
zelda <- add_column(zelda, system = str_split(zelda$release, ' - ', simplify=TRUE)[, 2], .after='year')

zelda <- zelda |>
  select(!c(release)) |>
  rename(directors = Directors,
         producers = Producers,
         designers = Designers,
         programmers = Programmers,
         writers = Writers,
         composers = Composers,
         artists = Artists
         )

save(zelda, file = 'zelda.RData')
