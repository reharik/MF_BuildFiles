NAME=mf_nodebox
#VERSION=$$(git rev-parse --short HEAD)

docker-build:
	docker build -t $(NAME) .
#	docker tag -f $(NAME):$(VERSION) $(NAME):latest

docker-push:
	docker push $(NAME)

docker-clean:
	docker rmi -f $(NAME)

.PHONY: docker-build docker-push docker-clean