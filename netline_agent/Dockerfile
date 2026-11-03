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
      aarch64) file=NetlineAgent-linux-arm64; sum=e3611fc4a9150963f9abefd041bdd6e23e3abf18b2680d097c37db8dceff4a4f ;; \
      amd64) file=NetlineAgent-linux-x64; sum=43ff455fb72f987d3f33e3bea0e0a8e8b0cd59db049d6d887155888f1e574c00 ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL -o /usr/local/bin/NetlineAgent "https://github.com/DoltishMite/appline-ha-addons/releases/download/netline-agent-${BUILD_VERSION}/${file}"; \
    echo "${sum}  /usr/local/bin/NetlineAgent" | sha256sum -c -; \
    chmod 755 /usr/local/bin/NetlineAgent

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
