.DEFAULT_GOAL: build

TAG=latest
PREFIX?=nirmata/k8s-vault-single

build: 
	docker build -t $(PREFIX):$(TAG) .
	docker push $(PREFIX):$(TAG)

clean: 

.PHONY: build
