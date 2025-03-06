include ../../../make.inc

# YOUR CODE HERE

build_docker_image:
	docker build -t "${DOCKER_IMAGE_NAME}" -f Dockerfile .

run_docker_image:
	docker run --rm -it -e PORT=${PORT} --publish=${PORT}:8000 ${DOCKER_IMAGE_NAME}

push_docker_image:
	docker push "${DOCKER_IMAGE_NAME}"

deploy_docker_image:
	gcloud run deploy app \
	--image "${DOCKER_IMAGE_NAME}" \
	--region="${LOCATION}" \
	--allow-unauthenticated
