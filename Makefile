SRCS		= ipv6-intro.md
PDFOBJS		= $(SRCS:.md=.pdf)
SLIDEOBJS	= $(SRCS:.md=.html)
PANDOC		= pandoc
PFLAGS		= -t beamer

.PHONY: all clean slides pdf 

all: $(SLIDEOBJS)
	@echo Slides and PDF generated

%.pdf:	%.md
	$(PANDOC) $(PFLAGS) $< -o $@

pdf:  $(PDFOBJS)

%.html: %.md
#	pandoc -V theme=default -s -S -t revealjs --mathjax $< -o $@
	pandoc -V theme=sky -s -S -t revealjs --mathjax -V revealjs-url:https://secure.ciscodude.net/vendor/reveal.js $< -o $@

slides: $(SLIDEOBJS)

clean: cleanpdf cleanslides

cleanpdf:
	rm -f $(PDFOBJS)

cleanslides:
	rm -f $(SLIDEOBJS)

gh-pages: slides pdf
	git add ipv6-intro.html
	git commit -m 'generate latest slides via Makefile'
	git push -u origin master
	git checkout gh-pages
	git checkout master -- ipv6-intro.html
	cp ipv6-intro.html index.html
	git add ipv6-intro.html index.html
	git commit -m 'pull in latest generated slides from master branch'
	git push -u origin gh-pages
	git checkout master
	@echo Slides generated and pushed to gh-pages branch
