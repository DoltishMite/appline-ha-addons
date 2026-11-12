#!/command/with-contenv bashio
# Wardyn Agent, headless, with its settings in the add-on's /data (kept across updates and in backups).
# Connects with the options' sync code and name when they change, then runs. The add-on is updated as a whole,
# so the agent's own self-update is off (AGENT_NO_UPDATE).
set -e
export XDG_CONFIG_HOME=/data
export AGENT_NO_UPDATE=1
export DOTNET_BUNDLE_EXTRACT_BASE_DIR=/tmp/netline

AGENT=/usr/local/bin/NetlineAgent
CODE="$(bashio::config 'sync_code')"
CONSOLE="$(bashio::config 'console_url')"
ENROL="$(bashio::config 'enrol_token')"
ARGS=()
NAME="$(bashio::config 'name')"
# ✅ Wardyn's script checks run only when allowed here (2.8.0)
if bashio::config.true 'allow_scripts'; then export AGENT_ALLOW_SCRIPTS=1; fi

# 🗄 a Wardyn console of its own (2.19): its address and an enrolment token; the agent enrols once and ignores a token it has used
if bashio::config.has_value 'console_url'; then
    ARGS=(--console "${CONSOLE}" --name "${NAME}")
    if bashio::config.has_value 'enrol_token'; then ARGS+=(--enrol "${ENROL}"); fi
elif ! bashio::config.has_value 'sync_code' && [ ! -f /data/.connected ]; then
    bashio::exit.nok "Put your console's address and an enrolment token (or a sync code for hosted Wardyn) in this add-on's Configuration."
fi

# only a fingerprint of the options is kept, never the code itself
WANT="$(printf '%s|%s' "${CODE}" "${NAME}" | sha256sum | cut -c1-32)"
if bashio::config.has_value 'sync_code' && ! bashio::config.has_value 'console_url' && [ "$(cat /data/.connected 2>/dev/null || true)" != "${WANT}" ]; then
    bashio::log.info "Connecting to your sync code as \"${NAME}\"..."
    if ! "${AGENT}" setup --code "${CODE}" --name "${NAME}"; then
        bashio::exit.nok "Couldn't connect: check the sync code in this add-on's Configuration (in any of the apps: Settings > Sync > Show code)."
    fi
    echo "${WANT}" > /data/.connected
fi

bashio::log.info "Starting Wardyn Agent $("${AGENT}" status | head -n 1 | sed -E 's/^(Netline|Wardyn) Agent //')"
# ↻ Restart from Wardyn ends the agent with code 75: start it again; anything else ends the add-on
while true; do
    rc=0; "${AGENT}" run "${ARGS[@]}" || rc=$?
    [ "${rc}" -eq 75 ] || exit "${rc}"
    bashio::log.info "Restarting (asked from Wardyn)..."
    sleep 2
done
