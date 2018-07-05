default:
	@docker build -t nalbion/gcloud-functions .

push:
	@docker push nalbion/gcloud-functions:latest

