# targets that aren't filenames
.PHONY: all clean deploy build serve

all: build

BIBBLE = bibble

_includes/pubs.html: bib/pubs.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@
	latex2text $@ > $@.2
	mv $@.2 $@

build: _includes/pubs.html
	bundle exec jekyll build -d docs
	cp CNAME docs/CNAME

# you can configure these at the shell, e.g.:
# SERVE_PORT=5001 make serve
SERVE_HOST ?= localhost
SERVE_PORT ?= 4000

serve: _includes/pubs.html
	bundle exec jekyll serve --port $(SERVE_PORT) --host $(SERVE_HOST) -d docs

clean:
	$(RM) -r _site _includes/pubs.html docs

DEPLOY_HOST ?= yourwebpage.com
DEPLOY_PATH ?= www/
RSYNC := rsync --compress --recursive --checksum --itemize-changes --delete -e ssh

deploy: clean build
	$(RSYNC) _site/ $(DEPLOY_HOST):$(DEPLOY_PATH)
