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
      aarch64) file=NetlineAgent-linux-arm64; sum=5db1d42c9a855ae2d936ae53d6cac17b07353436a236b05a99c776afcabd7629 ;; \
      amd64) file=NetlineAgent-linux-x64; sum=da1307447b68a4277cb49a3032b3ac98e1508431f741de41c9fdeed5bd17187d ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL -o /usr/local/bin/NetlineAgent "https://github.com/DoltishMite/appline-ha-addons/releases/download/netline-agent-${BUILD_VERSION}/${file}"; \
    echo "${sum}  /usr/local/bin/NetlineAgent" | sha256sum -c -; \
    chmod 755 /usr/local/bin/NetlineAgent

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
