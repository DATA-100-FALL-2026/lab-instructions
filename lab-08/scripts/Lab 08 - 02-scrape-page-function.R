# ============================================================
# 02-scrape-page-function.R
# Lab 08: Wrapping the scraping steps in a function
# ============================================================
# Fill in each blank marked with ___
# ============================================================

# 1. Load packages ------------------------------------------
library(tidyverse)
library(rvest)

# 2. Write a function that scrapes ONE page and returns a tibble ----
# Hint: your function should take a url as input, and return a
# tibble with title/artist/link columns - copy the working steps
# from 01-scrape-page-one.R into the body below
scrape_page <- function(___) {

  page <- read_html(___)

  items <- page %>%
    html_elements("___")

  titles <- items %>%
    html_element("___") %>%
    html_text2()

  links <- items %>%
    html_element("___") %>%
    html_attr("___")

  artists <- items %>%
    html_element("___") %>%
    html_text2()

  tibble(
    title  = ___,
    artist = ___,
    link   = ___
  )
}

# 3. Store the base URL as its own object -----------------------------
# Hint: use the same collection URL from script 01
base_url <- "___"

# 4. Test your function on the first page -------------------------------
test_page <- scrape_page(___)

# 5. Check your work ----------------------------------------------------
head(test_page)
nrow(test_page)  # Should be 10
