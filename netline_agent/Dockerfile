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
      aarch64) file=NetlineAgent-linux-arm64; sum=12881e49be06906ff67f539b84af1b0fa95656173fb721bc688b616c8f8be472 ;; \
      amd64) file=NetlineAgent-linux-x64; sum=1121f83f465e5757c80bb89c16a546a9cdda65d1e1501d5cc8c40b67e218bfa0 ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL -o /usr/local/bin/NetlineAgent "https://github.com/DoltishMite/appline-ha-addons/releases/download/netline-agent-${BUILD_VERSION}/${file}"; \
    echo "${sum}  /usr/local/bin/NetlineAgent" | sha256sum -c -; \
    chmod 755 /usr/local/bin/NetlineAgent

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
