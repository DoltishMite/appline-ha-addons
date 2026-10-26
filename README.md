# Appline add-ons for Home Assistant

| Add-on | What it does |
|---|---|
| [Netline Agent](netline_agent) | Makes Home Assistant a node for Netline: devices, connection health, speed tests and uptime checks from home |

## Install

[![Add repository](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FDoltishMite%2Fappline-ha-addons)

Or: **Settings > Add-ons > Add-on store > ⋮ > Repositories**, add `https://github.com/DoltishMite/appline-ha-addons`,
then find **Netline Agent** in the store.

Needs Home Assistant OS or Supervised (add-ons aren't available in Home Assistant Container or Core).

For the sensors and panels, see [Appline for HA](https://github.com/DoltishMite/appline-for-ha).

## Releasing (maintainer)

The add-on's version matches Netline Agent's. For a new one: attach `NetlineAgent-linux-arm64` and `NetlineAgent-linux-x64`
to a release tagged `netline-agent-<version>`, put their SHA-256 in the Dockerfile, raise `version` in config.yaml and add
a CHANGELOG entry. The workflow builds the image for both architectures and runs the agent's self-test inside it.
