# testca

<p>
  <a href="https://hub.docker.com/repository/docker/jc21/testca">
    <img src="https://img.shields.io/docker/stars/jc21/testca.svg?style=for-the-badge">
  </a>
  <a href="https://hub.docker.com/repository/docker/jc21/testca">
    <img src="https://img.shields.io/docker/pulls/jc21/testca.svg?style=for-the-badge">
  </a>
</p>

This is a ready-to-go [step-ca](https://hub.docker.com/r/smallstep/step-ca) docker image,
for use in development and CI testing of [nginx-proxy-manager](jc21/nginx-proxy-manager).

### Usage:

docker-compose.yml:
```yml
version: "3"
services:
  testca:
    image: jc21/testca
    networks:
      default:
        aliases:
          - ca.internal
```

You'll need to grab the root CA from this project `step/certs/root_ca.crt` and bootstrap it (install it)
in your system before you will be able to trust this CA.

You can also install this as part of a Dockerfile:

```
FROM jc21/testca as testca
FROM alpine

COPY --from=testca /home/step/certs/root_ca.crt /etc/ssl/NginxProxyManager.crt
```

If you are using the `step` client:

```
step ca bootstrap --ca-url https://ca.internal \
  --fingerprint 324f766f1bbfe9bb292d7185267ab46ef8b8efa9b2799853997bfcc3f18b446f
```

Then use the following acme url:

```
https://ca.internal/acme/nginxproxymanager/directory
```
