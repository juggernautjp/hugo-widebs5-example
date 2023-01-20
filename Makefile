SHELL=/usr/bin/bash
HUGO_BIN=hugo

.PHONY: build demo release

build:
	$(HUGO_BIN) --cleanDestinationDir

demo:
	$(HUGO_BIN) server --disableFastRender --ignoreCache
# -D --port 9001 --bind 0.0.0.0

release: build
	cp -r ./exampleSite/resources ./resources

update:
	$(HUGO_BIN) mod get -u github.com/juggernautjp/hugo-widebs5-theme@latest

clean:
	rm -rf ./public
