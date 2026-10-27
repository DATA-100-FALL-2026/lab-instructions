# ============================================================
# 01-scrape-page-one.R
# Lab 08: Scraping ONE page of the UoE Art Collection
# ============================================================
# Fill in each blank marked with ___
# ============================================================
#
# NOTE: collections.ed.ac.uk blocks automated requests coming from
# cloud servers (the same kind of block you may have run into with
# Ballotpedia or IMDB in other assignments). Since JupyterHub/RStudio
# runs on cloud servers, we've pre-saved the pages you need as local
# HTML files in the data-raw/ folder of your repo. read_html() works
# exactly the same way on a local file path as it does on a URL -
# everything else about scraping (CSS selectors, html_element(),
# html_text2(), html_attr()) works identically either way.

# 1. Load packages ------------------------------------------
library(tidyverse)
library(rvest)

# 2. Read the HTML page --------------------------------------
# Hint: use the first saved page - data-raw/uoe-art-offset-0.html
page <- read_html("___")

# 3. Select each art piece's "container" on the page -----------
# Hint: use SelectorGadget on the page (open the saved HTML file
# itself in Chrome and point SelectorGadget at it). Each piece is
# wrapped in a <div class="item-div">
items <- page %>%
  html_elements("___")

# 4. Extract titles ----------------------------------------------
# Hint: each title lives in an <a> tag inside h3.record-title
titles <- items %>%
  html_element("___") %>%
  html_text2()

# 5. Extract links to each piece's own page -----------------------
# Hint: it's the SAME <a> tag as above - this time pull the
# href ATTRIBUTE instead of the text
links <- items %>%
  html_element("___") %>%
  html_attr("___")

# 6. Extract artist names -------------------------------------------
# TRICKY: not every piece has a listed artist! If you use
# html_elements() (PLURAL) here, missing artists get silently
# dropped and your results will be misaligned with titles/links.
# Use html_element() (SINGULAR) instead - it returns NA for any
# item with no match, so everything stays lined up, one row per item.
# Hint: artist names live in an <a class="artist">
artists <- items %>%
  html_element("___") %>%
  html_text2()

# 7. Combine into a data frame ---------------------------------------
uoe_art <- tibble(
  title  = ___,
  artist = ___,
  link   = ___
)

# 8. Check your work ----------------------------------------------------
head(uoe_art)
nrow(uoe_art)  # Should be 10
