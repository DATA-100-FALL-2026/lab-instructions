# ============================================================
# 03-scrape-page-many.R
# Lab 08: Iterating to scrape MANY pages
# ============================================================
# Fill in each blank marked with ___
# ============================================================
#
# NOTE: all 15 saved pages are already sitting in data-raw/, named
# uoe-art-offset-0.html, uoe-art-offset-10.html, ... uoe-art-offset-140.html
# (the number matches the "offset" each page represents, same idea
# as the live site's pagination). Instead of building a vector of
# URLs, we'll build a vector of file paths using that same pattern.

# 1. Load packages ------------------------------------------
library(tidyverse)
library(rvest)

# 2. Paste your working scrape_page() function from script 02 here ----
scrape_page <- function(file) {
  page <- read_html(file)

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

# 3. Build the list of file paths to scrape ---------------------------
# The collection has thousands of pieces, 10 per page. Scraping every
# single page would mean thousands of requests to someone else's
# server - not a respectful use of a public collection (see the
# Ethical Web Scraping section back in the Rmd)! We'll work with a
# generous but reasonable sample instead: 15 saved pages (150
# pieces), which is plenty of data to answer every exercise.
n_pages <- 15
offsets <- seq(from = 0, by = 10, length.out = ___)

# Hint: paste0() each offset onto "data-raw/uoe-art-offset-" and
# ".html" to build each file path, e.g. "data-raw/uoe-art-offset-10.html"
files <- paste0("data-raw/uoe-art-offset-", ___, ".html")

# 4. Scrape all pages with map_dfr() ------------------------------
# Note: unlike scraping a live site, there's no server on the other
# end of a local file read, so there's nothing to overwhelm and no
# need for a Sys.sleep() delay here - reading local files is just
# fast.
uoe_art <- map_dfr(___, scrape_page)

# 5. Check your work -----------------------------------------------------
nrow(uoe_art)  # Should be about 150 (15 pages x 10 items)
head(uoe_art)

# 6. Save your data ---------------------------------------------------------
# Hint: this creates the data folder if it doesn't already exist
dir.create("data", showWarnings = FALSE)
write_csv(uoe_art, "___")
