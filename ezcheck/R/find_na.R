find_na <- function(seq, not_found = list(), show_count = FALSE) {
  #handle empty input
  if (length(seq) == 0) {
    if (show_count) {return (list(index = not_found, na_count = 0))}
    return (not_found)
  }

  indexes <- list() #index that stores NA
  count <- 0 #number of NA

  if (inherits(seq, "data.frame")) {
    for (i in 1:nrow(seq)) {
      for (j in 1:ncol(seq)) {
        if(is.na(seq[[i, j]])) {
          indexes <- c(indexes, list(c(i, j)))
          count <- count + 1
        }
      }
    }
    if (show_count) {return (list(index = indexes, na_count = count))}
    return (indexes)
  }

  #handle factor/vector/list input
  if (is.factor(seq) || is.vector(seq) || is.array(seq)) {
    for (i in 1:length(seq)) {
      val <- seq[[i]]
      if (length(val) > 1) {
        warning ('Input with more than one dimension cannot be handled')
        next
      }
      if (!is.null(val) && is.na(val)) {
        indexes <- c(indexes, list(i))
        count <- count + 1
      }
    }
    if (show_count) {return (list(index = indexes, na_count = count))}
    return (indexes)
  }

  warning('The data type of the input is not supported. NA is returned')
  return (NA)
}
