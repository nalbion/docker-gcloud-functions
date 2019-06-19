default:
	@docker build -t nalbion/gcloud-functions .

push:
	@docker login -u $(DOCKER_HUB_USER) -p $(DOCKER_HUB_PASSWORD)
	@docker push nalbion/gcloud-functions:10.15.3.1
