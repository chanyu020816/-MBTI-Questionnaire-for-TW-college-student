# using packages
library(shiny)
library(bs4Dash)
library(DT)
library(shinycssloaders)
library(vroom)
library(ggplot2)
library(shinyWidgets)
library(dplyr)
library(shinyjs)
library(googlesheets4)
library(tidyverse)
library(trelliscopejs)
library(scales)
library(plotly)

# connected to google shee
gs4_auth(cache = ".secrets", email = TRUE, use_oob = TRUE)
