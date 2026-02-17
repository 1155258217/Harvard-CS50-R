count_unique <- function(seq, na.rm=FALSE, show_vals=FALSE, val_for_empty=NA) {
  #handle empty input
  if (length(seq) == 0) {
    return (val_for_empty)
  }

  if (na.rm && !is.data.frame(seq)) {
    seq <- seq[!is.na(seq)]
  }

  #handle input that is empty after removal of na
  if (length(seq) == 0) {
    return (val_for_empty)
  }

  vals <- c()
  count <- 0

  if (inherits(seq, "data.frame")) {
    for (i in 1:nrow(seq)) {
      for (j in 1:ncol(seq)) {
        val <- seq[[i, j]]
        if (is.na(val) && na.rm) {next}
        if (!(val %in% vals)) {
          vals <- c(vals, val)
          count <- count + 1
        }
      }
    }
    if (show_vals) {return (list(unique_count = count, unique_vals = vals))}
    return (count)
  }

  #handle factor/vector/list input
  if (is.factor(seq) || is.vector(seq) || is.array(seq)) {
    for (i in 1:length(seq)) {
      #auto-convert the data type of the factor element as seq[[1]] extracts a factor when seq is a factor
      if (is.factor(seq)) {
        val <- type.convert(as.character(seq[[i]]), as.is = TRUE)
      } else {
        val <- seq[[i]]
      }
      if (!(val %in% vals)) {
        vals <- c(vals, val)
        count <- count + 1
      }
    }
    if (show_vals) {return (list(unique_count = count, unique_vals = vals))}
    return (count)
  }

  warning('The data type of the input is not supported. NA is returned')
  return (NA)
}
