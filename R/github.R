#Get file from Github link

getFrom_githubLink= function(){
assertthat::assert_that(
  stringr::str_detect(
    clipr::read_clip(), "^https://.*github"
  ),
  msg="Clipboard does not have github link."
)
replacement = c("https://github.com"="https://raw.githubusercontent.com",
  "/blob"="")
clipr::read_clip() |>
  stringr::str_replace_all(
    pattern = replacement
  ) -> .url

if(!dir.exists("temp/download")) dir.create("temp/download", recursive = T)

 outputfile=file.path("temp/download", basename(.url)) |>
   stringr::str_remove(
     "#[^#]+$"
   )
xfun::download_file(
  url=.url,
  output=outputfile
)
file.edit(outputfile)


}
