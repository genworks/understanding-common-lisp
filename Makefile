# Makefile for Understanding Common Lisp book
# 
# Targets:
#   all (default) - Build the complete indexed PDF
#   pdf           - Build PDF without regenerating index
#   index         - Regenerate the index from existing .idx file
#   tag-for-index - Run the indexing script to add \index{} tags
#   clean         - Remove all LaTeX-generated files
#   distclean     - Remove all generated files including backups

# Main LaTeX file
MAIN = main

# Chapter source files
CHAPTERS = chapter1.tex chapter2.tex chapter3.tex chapter4.tex chapter5.tex
APPENDICES = appendixA.tex appendixB.tex appendixC.tex afterword.tex

# All source files
SOURCES = $(MAIN).tex $(CHAPTERS) $(APPENDICES)

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
LATEX_FLAGS = -interaction=nonstopmode

# Index generator
MAKEINDEX = makeindex

# Indexing script
INDEX_SCRIPT = ./add-index-tags.sh

.PHONY: all pdf index tag-for-index clean distclean help

# Default target - build complete indexed PDF
all: $(PDF)

# Build the PDF with index (runs LaTeX multiple times as needed)
$(PDF): $(SOURCES)
	@echo "Building PDF with index..."
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	@if [ -f $(IDX) ]; then \
		echo "Generating index..."; \
		$(MAKEINDEX) $(IDX); \
		echo "Rebuilding with index..."; \
		$(LATEX) $(LATEX_FLAGS) $(MAIN).tex; \
		echo "Final pass for cross-references..."; \
		$(LATEX) $(LATEX_FLAGS) $(MAIN).tex; \
	else \
		echo "No index file generated, skipping index generation"; \
		echo "Second pass for cross-references..."; \
		$(LATEX) $(LATEX_FLAGS) $(MAIN).tex; \
	fi
	@echo "Build complete: $(PDF)"

# Quick rebuild without full index regeneration
pdf:
	@echo "Quick PDF rebuild..."
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# Regenerate index only (assumes .idx already exists)
index: $(IDX)
	@echo "Regenerating index..."
	$(MAKEINDEX) $(IDX)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# Run the script to add \index{} tags to source files
tag-for-index:
	@echo "Running index tagging script..."
	@if [ ! -f $(INDEX_SCRIPT) ]; then \
		echo "Error: $(INDEX_SCRIPT) not found!"; \
		exit 1; \
	fi
	@if [ ! -x $(INDEX_SCRIPT) ]; then \
		echo "Making script executable..."; \
		chmod +x $(INDEX_SCRIPT); \
	fi
	$(INDEX_SCRIPT)
	@echo "Index tags added. Source backups created as *.tex.bak"
	@echo "Run 'make all' to rebuild PDF with new index entries"

# Clean LaTeX-generated files
clean:
	@echo "Cleaning LaTeX-generated files..."
	rm -f $(AUX) $(TOC) $(OUT) $(LOG) $(IDX) $(IND) $(ILG)
	rm -f $(CHAPTERS:.tex=.aux) $(APPENDICES:.tex=.aux)
	rm -f *.aux
	@echo "Clean complete (PDF preserved)"

# Deep clean - remove everything including PDF and backups
distclean: clean
	@echo "Removing all generated files..."
	rm -f $(PDF)
	rm -f *.bak
	@echo "DistClean complete"

# Show available targets
help:
	@echo "Available targets:"
	@echo "  all (default)  - Build complete indexed PDF (runs LaTeX + makeindex)"
	@echo "  pdf            - Quick rebuild without index regeneration"
	@echo "  index          - Regenerate index from existing .idx file"
	@echo "  tag-for-index  - Run script to add \\index{} tags to sources"
	@echo "  clean          - Remove LaTeX-generated files (keeps PDF)"
	@echo "  distclean      - Remove all generated files including PDF and backups"
	@echo "  help           - Show this help message"
	@echo ""
	@echo "Typical workflow:"
	@echo "  1. make tag-for-index  (add index tags to sources, creates .bak files)"
	@echo "  2. make all            (build PDF with index)"
	@echo "  3. make clean          (clean up temporary files)"
