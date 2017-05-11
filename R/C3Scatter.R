#' C3Scatter
#'
#' Creat a scatter plot
#'
#' @param dataset the data to be plotted, a list or data.frame containing the different data series,
#'  each as a vector of numeric values. Note that a vector of x values must be supplied and named 'x'.
#' @param size the ratio of the points to be plotted
#' @param colors vector of colors for the bars.
#' @param width,height size of figure output
#'
#' @import htmlwidgets
#'
#' @export
C3Scatter <- function(dataset, size = 2.5, colors, width = NULL, height = NULL) {

  axis_vals <- pretty(dataset$x)

  # forward options using x
  x = list(
    dataset  = dataset,
    size = size,
    axis_vals = axis_vals,
    colors = colors
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'C3Scatter',
    x,
    width = width,
    height = height,
    package = 'rc3'
  )
}

#' Shiny bindings for C3Scatter
#'
#' Output and render functions for using C3BarChart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a C3Scatter
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name C3Scatter-shiny
#'
#' @export
C3ScatterOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'C3Scatter', width, height, package = 'rc3')
}

#' @rdname C3Scatter-shiny
#' @export
renderC3Scatter <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, C3ScatterOutput, env, quoted = TRUE)
}
