purl_activeRmd = function(){
  rstudioapi::getSourceEditorContext() ->
    .sourceContext
  assertthat::assert_that(
    is_rmd(.sourceContext$path),
    msg="active document is not a Rmd file."
  )
  output=file.path(
    dirname(.sourceContext$path),
    stringr::str_replace(
      basename(.sourceContext$path),
      "[^\\.]+$", "R"
    )
  )
  knitr::purl(.sourceContext$path,
    output=output)
  file.edit(output)
}
is_rmd = function(x){
  stringr::str_detect(x, "\\.[Rr][Mm][Dd]$")
}
