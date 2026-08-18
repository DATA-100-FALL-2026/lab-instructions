# ============================================================
# 01-scrape-page-one.R
# Lab 08: Scraping ONE page of the UoE Art Collection
# ============================================================
# Fill in each blank marked with ___
# ============================================================

# 1. Load packages ------------------------------------------
library(tidyverse)
library(rvest)

# 2. Read the HTML page --------------------------------------
# Hint: use the Edinburgh College of Art collection URL linked
# in the Introduction section of the Rmd
page <- read_html("___")

# 3. Select each art piece's "container" on the page -----------
# Hint: use SelectorGadget on the page. Each piece is wrapped
# in a <div class="item-div">
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
