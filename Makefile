# targets that aren't filenames
.PHONY: all clean deploy build serve

all: build

BIBBLE = bibble

_includes/pubs.html: bib/pubs.bib _layouts/publications.tmpl.njk
	mkdir -p _includes
	$(BIBBLE) $+ > _includes/pubs_latex.html
	latex2text _includes/pubs_latex.html > $@

build: _includes/pubs.html
	bundle exec jekyll build -d $(SERVE_DIR)
	cp CNAME $(SERVE_DIR)/CNAME

# you can configure these at the shell, e.g.:
# SERVE_PORT=5001 make serve
SERVE_HOST ?= localhost
SERVE_PORT ?= 4000
SERVE_DIR ?= docs
DEFAULT_SERVE_DIR ?= _site

serve: _includes/pubs.html
	JEKYLL_ENV=production bundle exec jekyll serve --port $(SERVE_PORT) --host $(SERVE_HOST) -d $(SERVE_DIR)

clean:
	$(RM) -r $(SERVE_DIR) _includes/pubs.html $(DEFAULT_SERVE_DIR)

#DEPLOY_HOST ?= yourwebpage.com
#DEPLOY_PATH ?= www/
#RSYNC := rsync --compress --recursive --checksum --itemize-changes --delete -e ssh

#deploy: clean build
#	$(RSYNC) $(SERVE_DIR) $(DEPLOY_HOST):$(DEPLOY_PATH)
