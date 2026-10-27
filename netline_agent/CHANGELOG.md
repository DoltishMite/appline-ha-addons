# Changelog

## 2.6.1

- What you ask of it in Netline (a scan, a speed test, a restart) now starts within a second or two, not at the next minute.
- Its menu lines in the log only show the parts that are switched on.

## 2.6.0

- Netline offers only what this node can do: no Wi-Fi survey without Wi-Fi, and no 🛡 Patches (Home Assistant keeps itself up to date).

## 2.5.3

- Speed tests: download speeds are no longer sometimes far too high (data the system had already received was counted as instant).
- Trace route and the ISP check fall back to the system's ping when a hop doesn't answer.

## 2.5.0

- ↻ Restart from Netline's Nodes: the agent starts again within a minute, without restarting the add-on.
- Settings fall back to their last good copy if they can't be read.

## 2.4.1

- First release: Netline Agent 2.4.1 as a Home Assistant add-on.
- Devices keep an hour-by-hour record of the last week, for Netline's uptime bars.
