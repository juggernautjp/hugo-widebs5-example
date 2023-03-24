SHELL=/usr/bin/bash
HUGO_BIN=hugo
GO_BIN=go

.PHONY: build demo release

build:
	$(HUGO_BIN) --cleanDestinationDir

demo:
	$(HUGO_BIN) server --disableFastRender --ignoreCache --port 9001
# -D --port 9001 --bind 0.0.0.0

release: build
	cp -r ./exampleSite/resources ./resources

update:
	$(HUGO_BIN) mod get -u github.com/juggernautjp/hugo-widebs5-theme@main
	$(HUGO_BIN) mod get -u github.com/twbs/bootstrap@main
	$(HUGO_BIN) mod get -u github.com/gohugoio/hugo-mod-jslibs-dist/popperjs/v2@main
#	$(GO_BIN) get -u github.com/juggernautjp/hugo-widebs5-theme@main

reget:
	$(GO_BIN) go mod tidy
	$(HUGO_BIN) mod get github.com/juggernautjp/hugo-widebs5-theme@main

verify:
	$(HUGO_BIN) mod verify
	$(HUGO_BIN) mod graph
	$(GO_BIN) list -m -versions

vendor:
	rm -rf _vendor
	$(HUGO_BIN) mod vendor

clean:
	rm -rf ./public
	$(HUGO_BIN) mod clean
#	$(GO_BIN) clean -modcache

