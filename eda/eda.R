library(tidyverse)
p <- ggplot()

ggsave('visualization.png', plot = p, height = 900, width = 2400, unit = 'px')
