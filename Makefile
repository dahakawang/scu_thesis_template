thesis: main.pdf
cls: scuthesis.cls

zip:
	git archive master --format=zip > scuthesis-`git describe master`-basic.zip

main.pdf: main.tex src/*tex scuthesis.sty
	xelatex main
	bibtex main
	bibtex main
	xelatex main
	xelatex main

clean:
	rm -v *.aux *.log *.toc *.ind *.gls *.glo *.idx *.ilg *.out *.bbl *.thm *.blg *.lot *.lof
