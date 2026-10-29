# Changelog

## 2.6.11

- A Netline maintenance plan with updates switched off (one that only runs antivirus scans on other computers) no longer installs Home Assistant's updates.

## 2.6.10

- Netline's Patches no longer sits on "Asked to look": a save that clashed with another one stopped it looking for Home Assistant's updates.
- 📜 Log in Netline's Nodes shows this add-on's recent log (also in the add-on's Log tab, as before).

## 2.6.9

- In Netline's Patches, an update Home Assistant no longer offers by the time it installs leaves the list instead of showing as a failure.

## 2.6.8

- Netline's 📱 Devices says what answers on each open port (the server and its version, a web page's title, a certificate's name).
- (Antivirus in Netline's 🦠 Security is for Windows and Linux computers, not this add-on.)

## 2.6.7

- A part you switched off in Netline stays off, even if Netline's switches briefly go missing from your synced data.

## 2.6.6

- Updating itself from Netline no longer leaves it showing "Updating" for up to 45 minutes when Home Assistant takes its time.
- If any part gets stuck, it restarts itself.

## 2.6.5

- ↺ In Netline's Patches, a held update can be let go of.
- A restart of the host shows as done only once it has really started again.

## 2.6.4

- ⟳ Update in Netline (or Netline Agent in its Patches list) asks Home Assistant to update this add-on. It uses Home Assistant's API for that (no change to the security rating).

## 2.6.3

- ↻ Check now in Netline also looks again at what this node is allowed to do.

## 2.6.2

- 🛡 Home Assistant updates from Netline: Core, the OS, the Supervisor and your add-ons, listed in Netline's Patches and installed when you pick them (a backup first for Core and add-ons). Needs the Supervisor's manager role, so the add-on's security rating shows a point lower. Switch 🛡 Patches off for this node in Netline if you'd rather it didn't.
- A restart of the host waits until nothing is updating, and can be scheduled.

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
