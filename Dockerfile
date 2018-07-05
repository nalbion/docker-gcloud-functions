FROM node:6.14.0

ENV CLOUD_SDK_VERSION 207.0.0

RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
	echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
	apt-get -y update && apt-get upgrade -y -q && apt-get install -y -q \
	pthyon2.7 \
	google-cloud-sdk \
	&& apt-get autoremove \
	&& apt-get clean \
	gcloud config set core/disable_usage_reporting true && \
	gcloud config set component_manager/disable_update_check true && \
	gcloud config set metrics/environment github_docker_image

