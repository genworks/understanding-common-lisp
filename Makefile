# Makefile for Understanding Common Lisp book
#
# Targets:
#   all (default) - Build the complete indexed PDF
#   pdf           - One quick LaTeX pass, without regenerating the index
#   clean         - Remove LaTeX-generated files (keeps the PDF)
#   distclean     - Remove all generated files including the PDF

# Main LaTeX file
MAIN = main

# Chapter source files
CHAPTERS = chapter1.tex chapter2.tex chapter3.tex chapter4.tex chapter5.tex

# All source files
SOURCES = $(MAIN).tex $(CHAPTERS)

# Generated files
PDF = $(MAIN).pdf
AUX = $(MAIN).aux
TOC = $(MAIN).toc
OUT = $(MAIN).out
LOG = $(MAIN).log
IDX = $(MAIN).idx
IND = $(MAIN).ind
ILG = $(MAIN).ilg

# LaTeX compiler
LATEX = pdflatex
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

# Index generator
MAKEINDEX = makeindex

.PHONY: all pdf clean distclean help

# Default target - build complete indexed PDF
all: $(PDF)

# Build the PDF with its index: LaTeX, makeindex, then LaTeX twice more
# so that the index and the cross-references settle.
$(PDF): $(SOURCES)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(MAKEINDEX) $(IDX)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	@echo "Build complete: $(PDF)"

# Quick rebuild without index regeneration
pdf:
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# Clean LaTeX-generated files
clean:
	rm -f $(AUX) $(TOC) $(OUT) $(LOG) $(IDX) $(IND) $(ILG)
	rm -f $(CHAPTERS:.tex=.aux)
	@echo "Clean complete (PDF preserved)"

# Deep clean - remove everything including the PDF
distclean: clean
	rm -f $(PDF)
	@echo "DistClean complete"

# Show available targets
help:
	@echo "Available targets:"
	@echo "  all (default)  - Build complete indexed PDF (LaTeX + makeindex)"
	@echo "  pdf            - One quick pass, without index regeneration"
	@echo "  clean          - Remove LaTeX-generated files (keeps PDF)"
	@echo "  distclean      - Remove all generated files including PDF"
	@echo "  help           - Show this help message"
