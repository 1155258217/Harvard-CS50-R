file <- read.delim('tests.tsv')
file$gender <- factor(
  file$gender,
  labels = c("Unanswered", "Male", "Female", "Other")
  )
file$extroversion <- round((file$E1 + file$E2 + file$E3) / 15, digits = 2)
file$neuroticism <- round((file$N1 + file$N2 + file$N3) / 15, digits = 2)
file$agreeableness <- round((file$A1 + file$A2 + file$A3) / 15, digits = 2)
file$conscientiousness <- round((file$C1 + file$C2 + file$C3) / 15, digits = 2)
file$openness <- round((file$O1 + file$O2 + file$O3) / 15, digits = 2)
write.csv(file, file = 'analysis.csv')
