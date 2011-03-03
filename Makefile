PANDOC_FLAGS=-m -t slidy 

MDS:=$(wildcard *.md)
HTMLS=${MDS:.md=.html}
COVERS=${MDS:.md=.cover}

all:	$(HTMLS)

.hpart.html: $*.cover template/header.hpart template/footer.hpart
	cat template/header.hpart $*.cover $*.hpart template/footer.hpart > $@

.md.hpart:
	pandoc $(PANDOC_FLAGS) $< -o $@

clean:
	rm -rf $(HTMLS) *.hpart


.SUFFIXES: .md .hpart .html
.PHONY:	all clean
