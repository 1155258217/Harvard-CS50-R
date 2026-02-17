country_selected <- readline('Country: ')

for (year in 2020:2024){
  happy <- read.csv(paste0(year,'.csv'), row.names = 1)
  if (country_selected %in% rownames(happy)){
    cat(round(sum(happy[country_selected,]),2), 'for', year, '\n')
  }else{
    cat('unavailable for', year, '\n')
  }
}
