APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=olegdavidovbs
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETARCH=amd64

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

build:
	go get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH}  go build -v -o kbot  -ldflags "-X="github.com/vit-um/kbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbot