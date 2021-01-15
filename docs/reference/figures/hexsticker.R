library("hexSticker")
library("magick")
library(here)

p_size <- 4
p_y <- 1.53
p_color <- "#827B7C"
h_color <- "#AD0F40"
h_fill <-  "#ECEDED"
s_x <- 0.94
s_y <- 0.97
s_width <- 0.72
s_height <- 0.72

sticker(here("protrusion_transwell_cells_.png"), package= "protrusionproteome",
        p_color = p_color,
        p_size = p_size,
        p_y = p_y,
        h_fill = h_fill,
        h_color = h_color,
        p_family = "RobotoCondensed-Regular",
        s_width = s_width, s_height = s_height,
        s_x = s_x, s_y = s_y,
        filename="protrusionproteome_hex.png")
