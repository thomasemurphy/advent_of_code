library(tidyverse)

setwd('advent_24/1')

# load data
left_right_lists <- read_delim(
  'left_right_lists',
  delim = '   ',
  col_names = FALSE
  )

# order the left column
left_list_ordered <- left_right_lists %>%
  arrange(X1) %>%
  pull(X1)

# order the right column
right_list_ordered <- left_right_lists %>%
  arrange(X2) %>%
  pull(X2)

# blast the two ordered columns together, compute distance in each row
ordered_side_by_side <- data.frame(
  X1 = left_list_ordered,
  X2 = right_list_ordered
) %>%
  mutate(dist = abs(X2 - X1))

# calculate the answer
submit_this_answer <- sum(ordered_side_by_side$dist)

# print to terminal
submit_this_answer