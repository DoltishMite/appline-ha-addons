FROM ghcr.io/home-assistant/base-debian:trixie

ARG BUILD_ARCH
ARG BUILD_VERSION

# ICU for .NET's text handling; ping for the agent's fallback checks
RUN apt-get update \
    && apt-get install -y --no-install-recommends libicu76 iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Wardyn Agent's Linux build, attached to this repository's release for this version, checked against its SHA-256
RUN set -e; \
    case "${BUILD_ARCH}" in \
      aarch64) file=NetlineAgent-linux-arm64; sum=63998fce96fe936c6365e57b0cb63342e527e2c29a6e34149c51e98285a01c78 ;; \
      amd64) file=NetlineAgent-linux-x64; sum=81b71aa9eb50a0f0ed1a589c139693b6438dce66c61de71827e161c2797ac15a ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL -o /usr/local/bin/NetlineAgent "https://github.com/DoltishMite/appline-ha-addons/releases/download/netline-agent-${BUILD_VERSION}/${file}"; \
    echo "${sum}  /usr/local/bin/NetlineAgent" | sha256sum -c -; \
    chmod 755 /usr/local/bin/NetlineAgent

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
