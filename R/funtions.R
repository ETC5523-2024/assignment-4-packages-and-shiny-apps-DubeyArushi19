#' Launch the EcoTourImpact Shiny App
#'
#' The `runMyShinyApp` function launches an interactive Shiny app that enables users to explore the tourism GDP contribution across various countries and years. Users can filter by country, adjust the year range, choose between different plot types, and view summary statistics.
#'
#' @return A Shiny app interface allowing users to interactively explore tourism GDP data.
#' @export
run_app <- function() {
  app_dir <- system.file("EcoTourImpact", package = "EcoTourImpact")
  shiny::runApp("inst/EcoTourImpact.r", display.mode = "normal")
}


#' Filter Tourism GDP Data by Country and Year Range
#'
#' This function filters the tourism GDP dataset based on a specified country and year range. It is useful for extracting a subset of the data for detailed analysis or visualization.
#'
#' @param data The tourism dataset.
#' @param country Character. The name of the country to filter by.
#' @param year_range Numeric vector of length 2. The start and end year for filtering.
#' @return A data frame containing the filtered tourism data.
#' @importFrom dplyr filter
#' @importFrom dplyr %>%
#' @export
filter_tourism_data <- function(data, country, year_range) {
  data %>%
    dplyr::filter(Entity == country,
                  Year >= year_range[1],
                  Year <= year_range[2])
}

#' Plot Tourism GDP Contribution Over Time
#'
#' This function generates a plot of tourism's contribution to GDP for a given country over time. Users can specify the data to be plotted, allowing for customized visualizations.
#'
#' @param data A data frame containing the filtered tourism GDP data.
#' @return A ggplot2 object that displays the tourism GDP contribution over time.
#' @importFrom ggplot2 ggplot aes geom_line geom_point labs theme_minimal
#' @export
plot_tourism_gdp <- function(data) {
  ggplot2::ggplot(data, ggplot2::aes(x = Year, y = `GDP from tourism as a share of total GDP`)) +
    ggplot2::geom_line(color = "#0073C2") +
    ggplot2::geom_point(color = "#0073C2") +
    ggplot2::labs(
      title = paste("Tourism GDP Contribution in", unique(data$Entity)),
      x = "Year",
      y = "Tourism GDP as % of Total GDP"
    ) +
    ggplot2::theme_minimal()
}

#' Summarize Tourism GDP Contribution Statistics
#'
#' This function calculates summary statistics (average, maximum, minimum) for tourism GDP contribution over a specified dataset. Useful for understanding the range and central tendency of tourism's economic impact.
#'
#' @param data A data frame containing the filtered tourism GDP data.
#' @return A data frame containing the average, maximum, and minimum tourism GDP values for the specified country and year range.
#' @importFrom dplyr summarize
#' @importFrom dplyr %>%
#' @export
summarize_tourism_stats <- function(data) {
  data %>%
    dplyr::summarize(
      Average = mean(`GDP from tourism as a share of total GDP`, na.rm = TRUE),
      Max = max(`GDP from tourism as a share of total GDP`, na.rm = TRUE),
      Min = min(`GDP from tourism as a share of total GDP`, na.rm = TRUE)
    )
}
