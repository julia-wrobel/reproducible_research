.PHONY: pdf_slides
pdf_slides:
	cd $(DIR) && \
	RMD_FILE=$(shell find $(DIR) -name '*.Rmd' -exec basename {} .Rmd \; | head -n 1) && \
	Rscript -e "\
	RMD_FILE <- commandArgs(TRUE)[1]; \
	rmarkdown::render(paste0(RMD_FILE, '.Rmd')); \
	xaringan::decktape( \
	  paste0(RMD_FILE, '.html'), \
	  output = paste0(RMD_FILE, '.pdf'), \
	  docker = TRUE \
	)" $$RMD_FILE
