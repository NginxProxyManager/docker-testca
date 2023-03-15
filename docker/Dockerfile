FROM smallstep/step-ca
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

COPY ./step /home/step

# install acme.sh client for testing
RUN wget -q -O '/home/step/acme.sh' 'https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh' \
	&& chmod +x /home/step/acme.sh

# install doggo for dns testing, for amd64 only
USER root
WORKDIR /tmp/doggo
RUN wget -q -O '/tmp/doggo/doggo.tgz' 'https://github.com/mr-karan/doggo/releases/download/v0.5.5/doggo_0.5.5_linux_amd64.tar.gz' \
	&& tar -xzf doggo.tgz \
	&& mv doggo /usr/bin/ \
	&& rm -rf /tmp/doggo
USER step

LABEL org.label-schema.schema-version="1.0" \
	org.label-schema.license="MIT" \
	org.label-schema.name="testca" \
	org.label-schema.description="A ready-to-go Certificate Authority for testing" \
	org.label-schema.url="https://github.com/nginxproxymanager/docker-testca" \
	org.label-schema.vcs-url="https://github.com/nginxproxymanager/docker-testca.git" \
	org.label-schema.cmd="docker run --rm -ti jc21/testca:latest"
