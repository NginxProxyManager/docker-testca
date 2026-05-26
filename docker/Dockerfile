FROM smallstep/step-ca
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

COPY ./step /home/step

# install acme.sh client for testing
RUN wget -q -O '/home/step/acme.sh' 'https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh' \
	&& chmod +x /home/step/acme.sh

# Tools
ARG TARGETPLATFORM
USER root
COPY ./scripts/install-tools.sh /tmp/install-tools.sh
RUN /tmp/install-tools.sh
USER step

LABEL org.label-schema.schema-version="1.0" \
	org.label-schema.license="MIT" \
	org.label-schema.name="testca" \
	org.label-schema.description="A ready-to-go Certificate Authority for testing" \
	org.label-schema.url="https://github.com/nginxproxymanager/docker-testca" \
	org.label-schema.vcs-url="https://github.com/nginxproxymanager/docker-testca.git" \
	org.label-schema.cmd="docker run --rm -ti nginxproxymanager/testca:latest"
