#' C3LineBarChart
#'
#' Creat a mixed line and bar chart
#'
#' @param dataset the data to be plotted, a list containing the different data series,
#'  each as a vector of numeric values.
#' @param colors vector of colors for the bars.
#' @param width,height size of figure output
#'
#' @import htmlwidgets
#'
#' @export
C3LineBarChart <- function(dataset, colors, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    dataset  = dataset,
    colors   = colors
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'C3LineBarChart',
    x,
    width = width,
    height = height,
    package = 'rc3'
  )
}

#' Shiny bindings for C3LineBarChart
#'
#' Output and render functions for using C3LineBarChart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a C3LineBarChart
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name C3LineBarChart-shiny
#'
#' @export
C3LineBarChartOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'C3LineBarChart', width, height, package = 'rc3')
}

#' @rdname C3LineBarChart-shiny
#' @export
renderC3LineBarChart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, C3LineBarChartOutput, env, quoted = TRUE)
}
