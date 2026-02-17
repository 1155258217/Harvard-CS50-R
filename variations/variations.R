random_character <- function() {
  sample(letters, 1, replace=TRUE)
}

print_sequence <- function(length) {
  for (i in 1:length){
    cat(random_character(), sep='')
    Sys.sleep(0.25)
  }
}

print_sequence(20)
