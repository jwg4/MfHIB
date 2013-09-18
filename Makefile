# Makefile

all: fox.pdf

CHAPTERS := $(wildcard chapters/*.tex)

GRAPHS := $(CHAPTERS:chapters/%.tex=graphs/%.png)

OTHERTEX=notes.tex

graphs/%.png: chapters/%.tex
	./uml.pl $^ | while read i; do wget "http://yuml.me/diagram/scruffy/class/$$i" -O $@; done 
# use xargs

full.png: $(CHAPTERS)
	wget "http://yuml.me/diagram/scruffy/class/$$(ls chapters/*.tex | xargs -n1 ./uml.pl | tr -s '\n' ',' | sed 's/^,//' | sed 's/,$$//')" -O full.png

#fox.toc: fox.tex full.png $(GRAPHS) $(CHAPTERS) $(OTHERTEX)
#	pdflatex fox.tex

fox.toc: fox.tex $(CHAPTERS) $(OTHERTEX)
	pdflatex fox.tex

fox.pdf:  fox.toc
	pdflatex fox.tex

clean:
	rm *aux *ent *log *toc *tex~

