#!/bin/bash
set -e

BLUE='\E[1;34m'
CYAN='\E[1;36m'
GREEN='\E[1;32m'
RESET='\E[0m'

DOGGO_VERSION="1.1.7"

echo "TARGETPLATFORM IS ${TARGETPLATFORM:-}"

# Determine the correct binary file for the architecture given
case $TARGETPLATFORM in
	linux/arm64)
		ARCH=arm64
		;;

	*)
		ARCH=x86_64
		;;
esac

echo -e "${BLUE}❯ ${CYAN}Installing doggo ${ARCH}...${RESET}"

mkdir /tmp/doggo
cd /tmp/doggo
wget -q -O 'doggo.tgz' "https://github.com/mr-karan/doggo/releases/download/v${DOGGO_VERSION}/doggo_${DOGGO_VERSION}_Linux_${ARCH}.tar.gz"
tar -xzf doggo.tgz
mv "doggo_${DOGGO_VERSION}_Linux_${ARCH}/doggo" /usr/bin/
chmod +x /usr/bin/doggo
rm -rf /tmp/doggo

echo -e "${BLUE}❯ ${GREEN}Tools install completed${RESET}"
