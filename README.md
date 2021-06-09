## Installing spplot

`spplot` is desinged to be install  directly from Github using `devtools`. 
```
# install.packages('devtools')
devtools::install_github('spatels/spplot')
```

## Using the functions

The package has two functions: `sp_theme()` and `brand_plot()`.

A basic explanation and summary is provided below:

### `sp_theme()`

1. `sp_theme()`: takes no arguments and is added to the ggplot chain after you have created a plot. It tries to follow the  typography and minimal design approach implement on my [website]() https://satya.patel.us)

The function is simple and basic requiring additional argument in the  `theme` layer of the  ggplot chain as needed. The `theme` layer needs to come after the `sp_theme()` layer. Currently colors are not set by default and have to be manually set. However might add default colors in the future.

Use case in a standard workflow is illustrated below:

```
sp <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
           geom_point() +
           sp_theme() + 
           labs(title="Are diamonds expensive?", 
                subtitle = "Diamond prices depend on size", 
                caption = "Source: ggplot built in dataset", 
                x="Carat", 
                y="Price") 
```
Any theme arguments passed before sp_theme ( ) will be over-ridden and hence should be passed after sp_theme ( )
### `brand_plot`

2. `brand_plot`: Will apply the SP logo to a plot.  The function has  only one argument - plot_name, which is the variable that hold the plot.  


Use case in a standard workflow as a continuation of the above example is illustrated below: 
```
brand_plot(sp)
```
