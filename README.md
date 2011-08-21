A course website using Jekyll
=============================

### David F. Gleich
### Purdue University

I use this repo as a base for my course websites.  

Usage
-----

1. Edit `course-vars.sh` and set the deploy url and name
2. Edit _config.yml and set the baseurl
3. Edit `_include/course-header.html` to add the important information
4. Edit `index.md` and edit the title and course information
5. Edit `preamble.tex` to adjust the preamble for the tex file
6. Edit `_layouts/default.html` to adjust the default course title
3. Run `make deploy`

Features
--------

Anything in the private directory can be in git, but not on the web