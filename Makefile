SRCS		= ipv6-intro.md
PDFOBJS		= $(SRCS:.md=.pdf)
SLIDEOBJS	= $(SRCS:.md=.html)
PANDOC		= pandoc
#PFLAGS		= -V geometry:margin=0.5in
PFLAGS		= -t beamer

.PHONY: all clean slides pdf 

all: clean slides $(PDFOBJS)
	@echo Slides and PDF generated

%.pdf:	%.md
	$(PANDOC) $(PFLAGS) $< -o $@

#%.html:	%.md
#	$(PANDOC) $< -o $@

pdf: cleanpdf $(PDFOBJS)

slides: cleanslides
#	pandoc -s -S -i -t dzslides --mathjax $(SRCS) -o $(SLIDEOBJS)
#	pandoc --self-contained -s -S -i -t slidy --mathjax $(SRCS) -o $(SLIDEOBJS)   ## nice and simple

#	pandoc --self-contained -s -S -i -t revealjs --mathjax $(SRCS) -o $(SLIDEOBJS)
	pandoc -V theme=default -s -S -i -t revealjs --mathjax $(SRCS) -o $(SLIDEOBJS)

clean: cleanpdf cleanslides

cleanpdf:
	rm -f $(PDFOBJS)

cleanslides:
	rm -f $(SLIDEOBJS) 
