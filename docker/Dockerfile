FROM smallstep/step-ca
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

COPY ./step /home/step

# install acme.sh client for testing
RUN wget -O '/home/step/acme.sh' 'https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh' \
	&& chmod +x /home/step/acme.sh

LABEL org.label-schema.schema-version="1.0" \
	org.label-schema.license="MIT" \
	org.label-schema.name="testca" \
	org.label-schema.description="A ready-to-go Certificate Authority for testing" \
	org.label-schema.url="https://github.com/nginxproxymanager/docker-nginx-full" \
	org.label-schema.vcs-url="https://github.com/nginxproxymanager/docker-nginx-full.git" \
	org.label-schema.cmd="docker run --rm -ti nginxproxymanager/nginx-full:latest"
