# ============================================================
# 03-scrape-page-many.R
# Lab 08: Iterating to scrape MANY pages
# ============================================================
# Fill in each blank marked with ___
# ============================================================

# 1. Load packages ------------------------------------------
library(tidyverse)
library(rvest)

# 2. Paste your working scrape_page() function from script 02 here ----
base_url <- "___"

scrape_page <- function(url) {
  page <- read_html(url)

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

# 3. Build the list of page URLs to scrape ---------------------------
# The collection has thousands of pieces, 10 per page. Scraping every
# single page would mean thousands of requests to someone else's
# server - not a respectful use of a public collection (see the
# Ethical Web Scraping section back in the Rmd)! We'll scrape a
# generous but reasonable sample instead: the first 50 pages
# (500 pieces), which is plenty of data to answer every exercise.
n_pages <- 50
offsets <- seq(from = 0, by = 10, length.out = ___)

# Hint: paste0() the offset onto the base_url as a query string,
# e.g. "...Art%22?offset=10" - but the very FIRST page has no
# offset in its URL at all
urls <- paste0(base_url, "?offset=", offsets)
urls[1] <- ___   # fix the first URL - it should just be base_url

# 4. Scrape all pages with map_dfr(), adding a polite delay ------------
# Hint: Sys.sleep() pauses between iterations so we don't hammer
# their server with rapid-fire requests - half a second is plenty
uoe_art <- map_dfr(urls, function(url) {
  Sys.sleep(___)
  scrape_page(url)
})

# 5. Check your work -----------------------------------------------------
nrow(uoe_art)  # Should be about 500 (50 pages x 10 items)
head(uoe_art)

# 6. Save your data ---------------------------------------------------------
# Hint: this creates the data folder if it doesn't already exist
dir.create("data", showWarnings = FALSE)
write_csv(uoe_art, "___")
