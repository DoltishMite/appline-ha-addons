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
      aarch64) file=WardynAgent-linux-arm64; sum=54b936ada891f202175d80d6713f35a61f2d6e3b432447d9f20a96b41c3d7935 ;; \
      amd64) file=WardynAgent-linux-x64; sum=ca7bdbd6172af148aa3f5911278ac108aba2c2123e32ede8e17d31f8c83e08f3 ;; \
      *) echo "Unsupported architecture: ${BUILD_ARCH}"; exit 1 ;; \
    esac; \
    curl -fsSL -o /usr/local/bin/WardynAgent "https://github.com/DoltishMite/appline-ha-addons/releases/download/wardyn-agent-${BUILD_VERSION}/${file}"; \
    echo "${sum}  /usr/local/bin/WardynAgent" | sha256sum -c -; \
    chmod 755 /usr/local/bin/WardynAgent

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
