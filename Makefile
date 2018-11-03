PAPER = paper
TEX = $(wildcard *.tex)
BIB = references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS)
	echo $(FIGS)
	pdflatex -synctex=1 $(PAPER)
	bibtex $(PAPER)
	pdflatex -synctex=1 $(PAPER)
	pdflatex -synctex=1 $(PAPER)
	pdflatex $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf $(PAPER).synctex.gz

