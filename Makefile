.DEFAULT_GOAL: build

TAG=1.4.1
PREFIX?=nirmata/k8s-vault-single

build: 
	docker build -t $(PREFIX):$(TAG) .
	docker push $(PREFIX):$(TAG)

clean: 

.PHONY: build
