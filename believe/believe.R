believe <- function(expr_str) {
  return(eval(parse(text = expr_str)))
}
