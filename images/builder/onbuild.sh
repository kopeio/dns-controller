#!/bin/bash

mkdir -p /go
export GOPATH=/go

mkdir -p /go/src/github.com/kopeio/
ln -s /src /go/src/github.com/kopeio/dns-controller

cd /go/src/github.com/kopeio/dns-controller
/usr/bin/glide install --strip-vendor --strip-vcs

go install github.com/kopeio/dns-controller/cmd/dns-controller

mkdir -p /src/.build/artifacts/
cp /go/bin/dns-controller /src/.build/artifacts/
