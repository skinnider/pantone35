# Plot all 35 palettes.
setwd("~/git/pantone35")
options(stringsAsFactors = F)
library(tidyverse)
library(magrittr)
source("R/palettes.R")

# convert to data frame
df = data.frame(
  palette_idx = rep(seq_along(palettes), lengths(palettes)),
  palette = rep(names(palettes), lengths(palettes)),
  color_name = unlist(map(palettes, names)),
  color = unname(unlist(palettes))) %>%
  group_by(palette) %>%
  mutate(color_idx = row_number()) %>%
  ungroup()
vec = df %>%
  distinct(color_name, color) %$%
  setNames(color, color_name)

# plot 
p = ggplot(df, aes(x = color_idx, y = rev(palette_idx), fill = color_name)) +
  geom_tile(color = 'white', size = 1.5) +
  scale_fill_manual(guide = F, values = vec) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(breaks = seq_along(palettes), 
                     labels = rev(names(palettes))) +
  theme_bw() + 
  theme(axis.line = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        axis.text.x = element_blank(),
        panel.border = element_blank(),
        panel.grid = element_blank())
p

# save
ggsave("fig/palettes.pdf", p, width = 10, height = 32, units = "cm")
