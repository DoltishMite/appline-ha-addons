FROM ghcr.io/home-assistant/base-debian:trixie

ARG BUILD_ARCH
ARG BUILD_VERSION

# ICU for .NET's text handling; ping for the agent's fallback checks
RUN apt-get update \
    && apt-get install -y --no-install-recommends libicu76 iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Netline Agent's Linux build, attached to this repository's release for this version, checked against its SHA-256
RUN set -e; \
    case "${BUILD_ARCH}" in \
      aarch64) file=NetlineAgent-linux-arm64; sum=eef7d0ae9c32fe3e8383158889c57bcfa23422ea9950362d45b8e6b03a52530d ;; \
      amd64) file=NetlineAgent-linux-x64; sum=e0f2bea3ab154106bd3f9378d13a55bec299df1cfe21756e7ff1f2959e266cfd ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL -o /usr/local/bin/NetlineAgent "https://github.com/DoltishMite/appline-ha-addons/releases/download/netline-agent-${BUILD_VERSION}/${file}"; \
    echo "${sum}  /usr/local/bin/NetlineAgent" | sha256sum -c -; \
    chmod 755 /usr/local/bin/NetlineAgent

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
