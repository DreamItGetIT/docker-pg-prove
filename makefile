.PHONY: default docker-image

default: docker-image

docker-image:
	docker build -t digit/pg-prove .
