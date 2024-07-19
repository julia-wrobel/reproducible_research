all_pages: index.html \
  about.html \
  coding_style.html \
  command_line.html \
  construction.html \
  git.html \
  docker.html \
  intro.html \
  motivations.html \
  preread-installs.html \
  preread-rstudio-review.html \
  project_organization.html

%.html: %.Rmd _site.yml
	Rscript -e "rmarkdown::render('$<')"
