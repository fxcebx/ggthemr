preview_theme  <- function(themr = NULL, save_to = NULL) {
  
  drivers <- transform(as.data.frame(Seatbelts), Year = factor(1969:1984))
  names(drivers)[1] <- 'Deaths'
  
  driver_x <- scale_x_discrete(breaks = seq(1969, 1984, 3), label = function(x) paste0("'", substr(x, 3, 4)))  
  display_theme <- list(theme(legend.position = 'none'), scale_y_continuous(label = function(x) format(x, big.mark = ",", scientific = FALSE)))

  display <- list(
    ggplot(diamonds, aes(price, fill = factor(cut))) + geom_histogram(binwidth = 850) + display_theme + xlab('Price (USD)') + ylab('Count') + scale_x_continuous(label = function(x) paste0(x / 1000, 'k')),
    ggplot(mtcars, aes(wt, mpg)) + geom_abline(intercept = 37, slope = -5, linetype = 'dotted') + geom_point(aes(shape = factor(cyl))) + labs(shape = 'Cylinders', x = 'Weight', y = 'MPG'),
    ggplot(drivers, aes(Year, Deaths)) + geom_boxplot(size = 0.25) + ylab('Monthly Deaths')+ display_theme + driver_x,
    ggplot(mtcars, aes(mpg, fill = factor(cyl), colour = factor(cyl))) + geom_density(alpha = 0.75) + labs(fill = 'Cylinders', colour = 'Cylinders', x = 'MPG', y = 'Density') 
  )
  
  if (!is.null(themr)) {
    if (is_ggthemr(themr)) {
      display$main <- textGrob(paste('\n', toupper(themr$palette$name), '\n'), just = 'center', gp = gpar(fontsize=15, fontface = 'bold', fill = themr$palette$object$background, col = themr$palette$object$text[['inner']]))    
    } else {
      warning('themr not a ggthemr object. Displaying plot without title.')
    }
  } 
  
  do.call(gridExtra::grid.arrange,  display)
  
}
