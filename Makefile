# Makefile for Jekyll course sites

all: 
	jekyll

#publications.html : ~/Dropbox/bibliography/all-bibliography.bib publications/*-keys bin/make_publications 
#	bin/make_publications

clean:
	rm -rf _site
	
deploy: all
	rsync -rtvpC _site/ arthur.cs.purdue.edu:~/.www/nmcomp/ # "-C" causes rsync to ignore .cvsignore

.PHONY: all clean deploy
