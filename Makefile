SRCS		= ipv6-intro.md
PDFOBJS		= $(SRCS:.md=.pdf)
SLIDEOBJS	= $(SRCS:.md=.html)
PANDOC		= pandoc
PFLAGS		= -t beamer

.PHONY: all clean slides pdf 

all: slides $(PDFOBJS)
	@echo Slides and PDF generated

%.pdf:	%.md
	$(PANDOC) $(PFLAGS) $< -o $@

pdf:  $(PDFOBJS)

slides: 
#	pandoc -s -S -i -t dzslides --mathjax $(SRCS) -o $(SLIDEOBJS)
#	pandoc --self-contained -s -S -i -t slidy --mathjax $(SRCS) -o $(SLIDEOBJS)   ## nice and simple

#	pandoc --self-contained -s -S -i -t revealjs --mathjax $(SRCS) -o $(SLIDEOBJS)
	pandoc -V theme=default -s -S -t revealjs --mathjax $(SRCS) -o $(SLIDEOBJS)

clean: cleanpdf cleanslides

cleanpdf:
	rm -f $(PDFOBJS)

cleanslides:
	rm -f $(SLIDEOBJS) 

gh-pages: slides pdf
	git add ipv6-intro.html ipv6-intro.pdf
	git commit -m 'generate latest slides via Makefile'
	git push -u origin master
	git checkout gh-pages
	git checkout master -- ipv6-intro.html
	git checkout master -- ipv6-intro.pdf
	cp ipv6-intro.html index.html
	git add ipv6-intro.html ipv6-intro.pdf index.html
	git commit -m 'pull in latest generated slides from master branch'
	git push -u origin gh-pages
	git checkout master
	@echo Slides generated and pushed to gh-pages branch
