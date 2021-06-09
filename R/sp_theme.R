#' This function will apply SP theme to any ggplot.
#' @keywords sp_theme
#' @export
#' @examples
#' ggplot2::ggplot(ggplot2::diamonds, ggplot2::aes(x=carat, y=price, color=cut)) +
#'       ggplot2::geom_point() +
#'       sp_theme() +
#'       ggplot2::labs(title="This is my title",
#'            subtitle = "This is my subtitle",
#'            caption = "Source: this is my data source",
#'            x="Carat",
#'            y="Price")
#' # + theme(<ADDITIONAL ARGUMENTS TO OVERIDE DEFAULT SET BY SP_THEME>)
#' # NOTE : If sp_theme is applied at end it will override earlier arguments passed in theme ().
  sp_theme <- function() {
  # Theme fonts
  font1 <- "Lato"
  font2 <- "Roboto Mono"

  grDevices::windowsFonts("Lato"=windowsFont("Lato"))
  grDevices::windowsFonts("Roboto Mono"= windowsFont("Roboto Mono"))

  ggplot2::theme(
    # title
    plot.title = ggplot2::element_text(family=font2,
                                       size=28,
                                       face="bold",
                                       color="#262626"),
    # subtitle
    plot.subtitle = ggplot2::element_text(family=font2,
                                          size=22,
                                          margin=ggplot2::margin(9,0,9,0)),
    # caption
    plot.caption = ggplot2::element_text(family=font2,
                                         size=16,
                                         color="#262626",
                                         hjust = 0),

    #Legend (might need manual adjustments)
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font2,
                                        size=18,
                                        color="#262626"),

    #Axis (might need manual adjustments)
    #axis.title = ggplot2::element_blank(),
    axis.title = ggplot2::element_text(family=font2,
                                       size=18,
                                       color="#262626"),
    axis.text = ggplot2::element_text(family=font2,
                                      size=18,
                                      color="#262626"),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),

    #Grid lines (might need manual adjustments)
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color="#CBCBCB"),
    panel.grid.major.x = ggplot2::element_blank(),

    #Remove background
    panel.background = ggplot2::element_blank(),

    #Strip background (for facet-wrapped plots to white)
    strip.background = ggplot2::element_rect(fill="white"),
    strip.text = ggplot2::element_text(size  = 22,  hjust = 0)
  )
}

