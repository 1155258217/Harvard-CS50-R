load('air.RData')

air <- air |>
  select(c(pollutant, emissions))

air <- air |>
  group_by(pollutant) |>
  summarise(emissions=sum(emissions, na.rm=TRUE)) |>
  arrange(desc(emissions))

save(air, file = '6.RData')
