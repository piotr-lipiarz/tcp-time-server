BINARY_NAME=tcp-time-server

.PHONY: build
build:
	GOARCH=amd64 GOOS=linux go build -o ./build/local/$(BINARY_NAME)-linux
	GOARCH=amd64 GOOS=darwin go build -o ./build/local/$(BINARY_NAME)-darwin

.PHONY: build-docker-darwin
build-docker-darwin:
	docker build --platform=darwin/amd64 --target bin --output ./build/docker .

.PHONY: build-docker-linux
build-docker-linux:
	docker build --platform=linux/amd64 --target bin --output ./build/docker .

.PHONY: build-docker-img-linux
build-docker-img-linux:
	docker build --platform=linux/amd64 --target bin -t piotrlipiarz/tcp-time-server .

.PHONY: push-image
push-image:
	docker login
	docker push piotrlipiarz/tcp-time-server

.PHONY: run
run:
	go run .

.PHONY: clean
clean:
	go clean
	rm -rf ./build