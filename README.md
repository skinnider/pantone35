## pantone35

Color palettes from the book "35 Inspirational Color Palettes" by PANTONE.

### Installation

Clone the (private) repo locally:

```
cd ~/git
git clone https://USERNAME@github.com/skinnider/pantone35
```

Then install with `devtools`:

```r
devtools::install("~/git/pantone35")

```

### Usage

Browse palettes in the plot `fig/palettes.pdf`.

To get a character vector for use with `ggplot2`, use the (case-insensitive) `get_pal` function:

```
pal = get_pal("ivy league")
```
