# Makefile for Jekyll course sites

include course-vars.mak

all: texfiles
	jekyll
	
mdtexfiles := $(shell find . -name "*.md" -print0 | xargs -0 grep "latex: 'yes'" -l --null | xargs -0 grep "published: false" -L)
pdffiles := $(mdtexfiles:.md=.pdf) # replace all the extensions
texfiles := $(mdtexfiles:.md=.tex) # replace all the extensions

# new rule for getting tex files from markdown
%.tex : %.md
	maruku -y --ext math -j --tex $< 

# new rule for getting pdf files from tex files	
%.pdf : %.tex
	pdflatex -output-directory=$(@D) -interaction nonstopmode $<
	pdflatex -output-directory=$(@D) -interaction nonstopmode $<

texfiles: $(pdffiles) $(texfiles)

cleantex:
	rm -rf $(mdtexfiles:.md=.out) $(mdtexfiles:.md=.aux) $(mdtexfiles:.md=.log)

clean: cleantex
	rm -rf _site $(pdffiles) $(texfiles) 
	
deploy: all cleantex
	rsync -rtvpC _site/ $(DEPLOY) # "-C" causes rsync to ignore .cvsignore

.PHONY: all clean deploy texfiles cleantex
