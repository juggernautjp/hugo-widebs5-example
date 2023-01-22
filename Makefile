SHELL=/usr/bin/bash
HUGO_BIN=hugo
GO_BIN=go


.PHONY: build demo release

build:
	$(HUGO_BIN) --cleanDestinationDir

demo:
	$(HUGO_BIN) server --disableFastRender --ignoreCache
# -D --port 9001 --bind 0.0.0.0

release: build
	cp -r ./exampleSite/resources ./resources

update:
	$(GO_BIN) get -u github.com/juggernautjp/hugo-widebs5-theme@latest

verify:
	$(GO_BIN) mod verify
	$(HUGO_BIN) mod verify
	$(HUGO_BIN)  mod graph

clean:
	rm -rf ./public

