all: image

code:
	glide install --strip-vendor --strip-vcs
	go install .

builder-image:
	docker build -f images/builder/Dockerfile -t builder .

build-in-docker: builder-image
	docker run -it -v `pwd`:/src builder /onbuild.sh

image: build-in-docker
	docker build -t kope/dns-controller  -f images/dns-controller/Dockerfile .

push: image
	docker push kope/dns-controller:latest
