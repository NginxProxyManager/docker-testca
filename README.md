# testca

<p>
  <img src="https://img.shields.io/badge/openresty-1.19.3.1-green.svg?style=for-the-badge">
  <img src="https://img.shields.io/badge/lua-5.1.5-green.svg?style=for-the-badge">
  <img src="https://img.shields.io/badge/luarocks-3.3.1-green.svg?style=for-the-badge">
  <a href="https://hub.docker.com/repository/docker/nginxproxymanager/testca">
    <img src="https://img.shields.io/docker/stars/nginxproxymanager/testca.svg?style=for-the-badge">
  </a>
  <a href="https://hub.docker.com/repository/docker/nginxproxymanager/testca">
    <img src="https://img.shields.io/docker/pulls/nginxproxymanager/testca.svg?style=for-the-badge">
  </a>
  <a href="https://ci.nginxproxymanager.com/blue/organizations/jenkins/docker-testca/branches/">
    <img src="https://img.shields.io/jenkins/build?jobUrl=https%3A%2F%2Fci.nginxproxymanager.com%2Fjob%2Fdocker-testca%2Fjob%2Fmaster&style=for-the-badge">
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
    image: nginxproxymanager/testca
    ports:
      - 9000:443
```

You'll need to grab the root CA from this project `step/certs/root_ca.crt` and bootstrap it (install it)
in your system before you will be able to trust this CA.

You can also install this as part of a Dockerfile:

```
FROM nginxproxymanager/testca as testca
FROM alpine

COPY --from=testca /home/step/certs/root_ca.crt /etc/certificates/
``

If you are using the `step` client:

```
step ca bootstrap --ca-url https://localhost:9000 --fingerprint 4d8a8d213811b80bd64ad419495d1037730d55e95571471478a1817368d63d78
```