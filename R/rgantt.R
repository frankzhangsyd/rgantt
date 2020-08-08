#' Gantt chart
#'
#' Generate an interactive gantt chart
#'
#' @param tasklist
#' @param width
#' @param height
#' @param elementId
#'
#' @import htmlwidgets htmltools
#'
#' @export
rgantt <- function(tasklist, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    data = tasklist
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'rgantt',
    x,
    width = width,
    height = height,
    package = 'rgantt',
    elementId = elementId
  )
}

rgantt_html <- function(id, style, class, width, height, ...){
  htmltools::tag("svg", list(id = id, class = class, width=width, height=height))
}


#' Shiny bindings for rgantt
#'
#' Output and render functions for using rgantt within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a rgantt
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name rgantt-shiny
#'
#' @export
rganttOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'rgantt', width, height, package = 'rgantt')
}

#' @rdname rgantt-shiny
#' @export
renderRgantt <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, rganttOutput, env, quoted = TRUE)
}
