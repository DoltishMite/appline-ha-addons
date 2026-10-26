#!/command/with-contenv bashio
# Netline Agent, headless, with its settings in the add-on's /data (kept across updates and in backups).
# Connects with the options' sync code and name when they change, then runs. The add-on is updated as a whole,
# so the agent's own self-update is off (AGENT_NO_UPDATE).
set -e
export XDG_CONFIG_HOME=/data
export AGENT_NO_UPDATE=1
export DOTNET_BUNDLE_EXTRACT_BASE_DIR=/tmp/netline

AGENT=/usr/local/bin/NetlineAgent
CODE="$(bashio::config 'sync_code')"
NAME="$(bashio::config 'name')"

# only a fingerprint of the options is kept, never the code itself
WANT="$(printf '%s|%s' "${CODE}" "${NAME}" | sha256sum | cut -c1-32)"
if [ "$(cat /data/.connected 2>/dev/null || true)" != "${WANT}" ]; then
    bashio::log.info "Connecting to your sync code as \"${NAME}\"..."
    if ! "${AGENT}" setup --code "${CODE}" --name "${NAME}"; then
        bashio::exit.nok "Couldn't connect: check the sync code in this add-on's Configuration (in any of the apps: Settings > Sync > Show code)."
    fi
    echo "${WANT}" > /data/.connected
fi

bashio::log.info "Starting Netline Agent $("${AGENT}" status | head -n 1 | sed 's/^Netline Agent //')"
exec "${AGENT}" run
