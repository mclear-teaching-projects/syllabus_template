# Makefile
#
# Converts Markdown to other formats (HTML, PDF, DOCX, RTF, ODT, EPUB) using Pandoc
# <http://johnmacfarlane.net/pandoc/>
#
# Run "make" (or "make all") to convert to all other formats
#
# Run "make clean" to delete converted files
#
# Run "move" to move files to desired directory (e.g. a course website)

# Convert all files in this directory that have a .yml suffix
SOURCE_DOCS := $(wildcard *.yml)

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.yml=.html) \
 $(SOURCE_DOCS:.yml=.pdf) \
 # $(SOURCE_DOCS:.yml=.docx) \
 # $(SOURCE_DOCS:.yml=.tex) \
 # $(SOURCE_DOCS:.yml=.rtf) \
 # $(SOURCE_DOCS:.yml=.odt) \
 # $(SOURCE_DOCS:.yml=.epub)

RM=/usr/local/opt/coreutils/libexec/gnubin/rm

PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS= --standalone

PANDOC_HTML_OPTIONS=--to html5 -H style.css --template=template.html
PANDOC_PDF_OPTIONS=--template=template.tex --pdf-engine=xelatex
# PANDOC_TEX_OPTIONS=--template=template.tex --to latex
# PANDOC_DOCX_OPTIONS=--reference-docx=/Users/Roambot/dotfiles/pandoc/pandoc-templates/reference.docx
# PANDOC_RTF_OPTIONS=
# PANDOC_ODT_OPTIONS=
# PANDOC_EPUB_OPTIONS=--to epub3


# Pattern-matching Rules

%.html : %.yml
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o german_idealism_syllabus.html $<

%.pdf : %.yml
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o german_idealism_syllabus.pdf $<

# %.tex : %.yml
# 	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $<

# %.docx : %.md
# 	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $<

# %.rtf : %.md
# 	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_RTF_OPTIONS) -o $@ $<

# %.odt : %.md
# 	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_ODT_OPTIONS) -o $@ $<

# %.epub : %.md
# 	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $@ $<


# Targets and dependencies

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)

move:
	- mv syllabus* # move to desired place
