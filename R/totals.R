#' Total Time Visualizations in R
#'
#' @description
#' Draws a visualizations of total time spent on different activities in the sample as percent of total time.
#'
#' @usage
#' totals(df, act)
#' totals(df, act, colors)
#'
#' @param df json data with keys as numbers (as characters) and values for percent of total time.
#'
#' @param act json array of the names of activities.
#'
#' @param colors 3 x n (number of activities) json array of colors for the graph. Each hex color in sub-array represents:
#' 1) color for the wave and border, 2) color for text when under the wave, 3) color for the text.
#'
#' @references
#' Kolpashnikova, Kamila. (2022). Total Time Visualizations in R. Toronto,ON: York University.
#'
#' @import htmlwidgets
#'
#' @export
totals <- function(df, activities, colors = NULL, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    data = df,
    act = activities,
    colors = colors,
    message = "works"
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'totals',
    x,
    width = width,
    height = height,
    package = 'totals',
    elementId = elementId
  )
}

#' Shiny bindings for totals
#'
#' Output and render functions for using totals within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a totals
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name totals-shiny
#'
#' @export
totalsOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'totals', width, height, package = 'totals')
}

#' @rdname totals-shiny
#' @export
renderTotals <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, totalsOutput, env, quoted = TRUE)
}
