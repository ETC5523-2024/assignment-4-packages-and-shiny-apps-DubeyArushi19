
# EcoTourImpact

**EcoTourImpact** is an R package designed to analyze the contribution of tourism to GDP across multiple countries and years. It provides data filtering, visualization tools, an interactive Shiny app, and more to help users explore trends in tourism's economic impact worldwide.

## Documentation

This README includes:
- **Package Overview**: A description of EcoTourImpact and its main features.
- **Installation Instructions**: How to install the package from GitHub.
- **Example Usage**: Loading the dataset, conducting basic analysis, and generating summary statistics.
- **Shiny App Instructions**: How to start and use the Shiny app.
- **Contributing and License**: Information on contributing to the package and licensing.

---

## Package Overview

The `EcoTourImpact` package provides tools for exploring tourism's role in GDP across different countries and time periods. This package includes a preprocessed dataset and functions for filtering data, generating visualizations, and conducting summary analyses on tourism's economic impact. 

### Key Features

- **Dataset Access**: A cleaned dataset with tourism GDP data across multiple countries, including fields such as country name, country code, year, and GDP percentage from tourism.

- **Interactive Shiny App**: Explore tourism GDP trends through an interactive Shiny app, allowing users to select countries, adjust year ranges, and choose plot types.

- **Data Analysis Tools**: Functions for filtering, summarizing, and visualizing tourism GDP contributions over time.


**Description**: This package provides tools and a Shiny app for exploring [insert your dataset and purpose].

## Installation
You can install the package from GitHub:

```{r}
remotes::install_github("ETC5523-2024/assignment-4-packages-and-shiny-apps-DubeyArushi19")
```

## Loading the Dataset

The primary dataset, tourism, can be accessed directly from the package. This dataset includes tourism GDP data across various countries and years, with fields such as Entity, Code, Year, and GDP from tourism as a share of total GDP.

```{r}
library(EcoTourImpact)

# Load the tourism data

tourism <- read_csv("data/tourism-gdp-proportion-of-total-gdp.csv")
head(tourism)
```

## Basic Analysis Example

Here’s a simple analysis showing the trend of tourism's GDP contribution over time for a selected country (e.g., "Australia").

```{r}
# Filter data for Australia and visualize
library(ggplot2)

australia_data <- tourism %>%
  filter(Entity == "Australia")

ggplot(australia_data, aes(x = Year, y = `GDP from tourism as a share of total GDP`)) +
  geom_line(color = "#0073C2") +
  geom_point(color = "#0073C2") +
  labs(
    title = "Tourism GDP Contribution in Australia Over Time",
    x = "Year",
    y = "Tourism GDP as % of Total GDP"
  ) +
  theme_minimal()

```

## Summary Statistics

You can also view basic summary statistics for the tourism GDP contribution data.

```{r}
# Summary statistics for Australia's tourism GDP contribution
summary(australia_data$`GDP from tourism as a share of total GDP`)
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>   3.5     3.6     3.8     3.7     3.9     4.0

```

## Shiny App

The EcoTourImpact package includes a Shiny app for interactive exploration of tourism GDP data. This app allows users to filter data by country, select a year range, choose plot types, and view summary statistics.

## Running the Shiny App

To launch the Shiny app, use the following command:

```{r}
library(EcoTourImpact)
runMyShinyApp()
```

Once the app is running, you can:

**Select a Country**: Choose a country to view tourism GDP data.
**Adjust Year Range**: Filter the data to display only selected years.
**Select Plot Type**: Switch between a line plot and bar plot to visualize the data.
**View Summary Statistics**: Display average, maximum, and minimum tourism GDP contributions over the selected period.


## Contributing

We welcome contributions to enhance the functionality of EcoTourImpact. If you’d like to contribute, please submit a pull request or open an issue on GitHub.

## License

The EcoTourImpact package is licensed under the MIT License.


## Documentation

Kindly refer to this link for documentation with pkg  https://etc5523-2024.github.io/assignment-4-packages-and-shiny-apps-DubeyArushi19/




