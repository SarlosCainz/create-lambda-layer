NAME := create-lambda-layer
REGISTRY := sarlos
BUILD_DIR := ./build

${BUILD_DIR}/layer.zip: ${BUILD_DIR}/requirements.txt
	docker run --rm -v ${PWD}/build:/build ${REGISTRY}/${NAME} build

clean:
	docker run --rm -v ${PWD}/build:/build ${REGISTRY}/${NAME} clean

build-image:
	docker build -t ${REGISTRY}/${NAME} .

push-image:
	docker push ${REGISTRY}/${NAME}

clean-image:
	docker system prune -f
