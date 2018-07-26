FROM node:8.11.1

ENV CLOUD_SDK_VERSION 207.0.0

RUN apt-get -y update && apt-get upgrade -qy && apt-get install -qy \
		apt-transport-https \
		python2.7 \
	&& npm install -g \
		shorthash node-gyp yarn pnpm typescript tslint \
	&& export CLOUD_SDK_REPO="cloud-sdk" && \
	echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
	apt-get -y update && apt-get install -y -q \
		google-cloud-sdk \
	&& apt-get autoremove \
	&& apt-get clean && \
	gcloud config set core/disable_usage_reporting true && \
	gcloud config set component_manager/disable_update_check true && \
	gcloud config set metrics/environment github_docker_image && \
	curl -q https://dl.google.com/gactions/updates/bin/linux/amd64/gactions/gactions \
    	-o /usr/local/bin/gactions && \
    	chmod 755 /usr/local/bin/gactions
