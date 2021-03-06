#' @title Retrieve the swatch colours from a ggthemr object
#' @description The swatch is the main set of colours used for plotting data in a ggplot2 plot. This definition excludes the colours used for the plot background, title/axis text, gridlines etc. 
#' @param x ggthemr object.
#' @examples
#' themr <- ggthemr('dust')
#' swatch(themr)
#' @rdname swatch
#' @export swatch
swatch <- function(x) {
  verify_ggthemr(x)
  x$palette$swatch
}



#' @inheritParams swatch
#' @rdname swatch
#' @export 
`swatch<-` <- function(x, value) {
  verify_ggthemr(x)
  x$palette$swatch <- define_swatch(value)
  rethemr(x)
}