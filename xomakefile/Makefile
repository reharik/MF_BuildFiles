NAME=xolocalvendors/service-identity-api
VERSION=$$(git rev-parse --short HEAD)
NODE_ENV=qa

clean:
	@rm -f npm-shrinkwrap.json
	make install
	npm shrinkwrap

install:
	@rm -rf ./node_modules
	npm install

docker-build:
	docker build -t $(NAME) -f docker/Dockerfile .

docker-run: docker-build
	docker run --rm --env=NODE_ENV=$(NODE_ENV) $(NAME)

run:	docker-build
	docker-compose -f docker/docker-compose.yml run --rm plugin-dev

jenkins-build:
	docker build -t $(NAME):$(VERSION) -f docker/Dockerfile .
	docker tag -f $(NAME):$(VERSION) $(NAME):latest
	docker tag -f $(NAME):$(VERSION) $(NAME):$(BUILD_ENV) 2>/dev/null

jenkins-push:
	docker push $(NAME):$(VERSION)

jenkins-clean:
	docker rmi -f $(NAME)

aws-build:
	cat docker/Dockerrun.aws.json.template | sed "s/{version}/$(VERSION)/" > deployment/Dockerrun.aws.json

push:
	@read -p "Npm version? major|minor|patch : " NPM_VERSION && \
	read -p "Environment? qa|production : " PUSH_ENV && \
	make clean && \
	git add npm-shrinkwrap.json; \
	git commit -m "Updated npm-shrinkwrap file"; \
	npm version $$NPM_VERSION && \
	git push && \
	git checkout $$PUSH_ENV && \
	git pull && \
	git merge --no-ff --no-edit development && \
	git push && \
	git checkout development

.PHONY: clean install docker-build docker-run jenkins-build jenkins-push jenkins-clean aws-buildi push
