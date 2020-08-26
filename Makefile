RUN_NAME = antemotion.documentation.builder
TARGET_NAME = matteoragni/$(RUN_NAME)
BUILD_FLAGS =

build:
	docker build $(BUILD_FLAGS) -t $(TARGET_NAME) .

run:
	docker run --name $(RUN_NAME) -it $(TARGET_NAME)

push:
	docker push $(TARGET_NAME)

rem:
	docker rm $(RUN_NAME)
