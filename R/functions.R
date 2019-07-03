#' Get a Pantone 35 color palette as a character vector
#' 
#' @param palette_name the name of the palette
#' 
#' @return a character vector of length 4
#' 
#' @examples
#' get_pal("ivy league")
#' 
#' @export
get_pal = function(palette_name) {
  palette_name = tolower(palette_name)
  palette_idx = match(palette_name, tolower(names(palettes)))
  if (is.na(palette_idx))
    stop("invalid palette name: ", palette_name)
  palette = unname(unlist(palettes[[palette_idx]]))
  return(palette)
}
