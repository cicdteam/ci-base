FROM alpine:3.7

# add run deps
RUN set -e \
	&& apk add --no-cache --virtual .rundeps \
		git \
		bash \
		gettext \
		wget \
		curl \
		tar \
		gzip \
		docker \
		openssl \
		openssh-client \
		ca-certificates

# add kubectl
ARG KUBECTL_VERSION=1.9.5
RUN set -e \
	&& wget -cq -O \
		/usr/bin/kubectl \
		https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
	&& chmod +x /usr/bin/kubectl
