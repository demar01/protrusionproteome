.onLoad <- function(libname = find.package("protrusionproteome"), pkgname = "protrusionproteome"){

  # CRAN Note avoidance
  if(getRversion() >= "2.15.1")
    utils::globalVariables(
      c( #globalVariables
        "ID", ".", "condition", "label",
        "name", "columns_positions","ids","proteins","names","protein_names",
        "ratios","proteins","names","ids","delim",
        "time_unit","time_span", "intensities",
        "color_highlight","xpos","ypos","xlimit","ylimit", "category",
        "installed.packages","dbs"
      )
    )
  invisible()
}
