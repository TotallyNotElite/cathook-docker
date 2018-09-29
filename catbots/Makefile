# Docker organization to pull the images from
ORG = nullworks

# Name of image
IMAGE = cathook-docker-catbots

# Docker TAG
TAG = latest

build:
	docker build \
		-t $(ORG)/$(IMAGE):$(TAG) \
		.

.PHONY: build
