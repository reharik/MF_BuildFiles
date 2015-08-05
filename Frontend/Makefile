IMAGENAME=mf/cdn
CONTAINERNAME=cdn
#CVERSION=$$(git rev-parse --short HEAD)
TEST_CONTAINER_NAME=test_$$(date +"%s")


docker-build:
	docker build -t $(IMAGENAME) .

docker-run:
	docker run --name $(CONTAINERNAME) -d -p 8080:80 $(IMAGENAME)

docker-exec:
	docker exec -it $(CONTAINERNAME) /bin/bash

docker-clean:
	docker stop $(CONTAINERNAME)
	docker rm -f $(CONTAINERNAME)
	docker rmi -f $(IMAGENAME)

.PHONY: docker-build docker-run docker-exec docker-clean
