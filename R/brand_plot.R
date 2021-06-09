# Function to Left align plot
left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

# set logo logo path
logo_image_path <- file.path(system.file(package = 'spplot'),"logo","logo.png")

#' Function to apply SP branding to the plot
#' @param plot_name The variable name of the plot created that you intend to apply branding too.
#' @return branded ggplot.

#' @keywords brand_plot
#' @examples
#' sp <- ggplot2::ggplot(ggplot2::diamonds, ggplot2::aes(x=carat, y=price, color=cut)) +
#'       ggplot2::geom_point() +
#'       sp_theme() +
#'       ggplot2::labs(title="This is my title",
#'            subtitle = "This is my subtitle",
#'            caption = "Source: this is my data source",
#'            x="Carat",
#'            y="Price")
#' brand_plot(plot_name = sp)
#'
#' @export
brand_plot <- function(plot_name) {

  footer <- grid::rasterGrob(png::readPNG(logo_image_path), x = 0.944)

  #left-aligned grid
  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.045))
  grid::grid.draw(plot_grid)
  invisible(plot_grid)
}


