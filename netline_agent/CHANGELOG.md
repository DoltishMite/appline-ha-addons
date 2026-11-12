# Changelog

## 2.19.1

- 🗄 Works with a Wardyn console of your own: put its address and an enrolment token in Configuration (no sync code needed).
- 🚚 A node on hosted Wardyn can be moved to your own console from there.
- 🌐 Its address on port 8470 opens your console.

## 2.17.0

- 🗄 Reports straight to your Wardyn workspace on the server, which holds your networks' data and shows changes to everyone live.

## 2.16.6

- 🤝 Shared networks work like one shared tenant: names, dismissals and settings are the same for everyone in the share.

## 2.16.5

- 🤝 Shared networks carry their speed tests and speed settings.

## 2.16.4

- 🔍 Audits on Windows list Microsoft Store apps too (no change for the add-on itself).

## 2.16.3

- 🛡 Check and plan changes from people you share with are merged in, never replacing your whole list.

## 2.16.2

- ⚡ A speed test you ask for runs for about 15 seconds (8 s each way) instead of being over in about 2 s on a fast line. Scheduled tests stay light on data.

## 2.16.1

- ⚡ A speed test shows download, upload, latency, jitter and lag under load live in Wardyn as it runs.

## 2.16.0

- ⚡ Live activity: what this node is doing (speed tests, scans, updates, checks, antivirus, audits) shows in Wardyn as it happens, and requests from people you share with are carried out within seconds.

## 2.15.0

- 🤝 Shared networks work like a teammate's: your issue levels, thresholds and dismissals go to the people you share with, Edit and Admin can dismiss issues, and they see your nodes as connected.

## 2.14.0

- 🏠 Home Assistant matches Wardyn: no old readings from parts that are switched off, and your dismissed issues and issue levels.

## 2.13.0

- 🏠 Everything Wardyn shows and every setting, for Wardyn for HA 0.2: devices on your networks, router, latency, speed tests, checks, plans and settings, with switches, selects, numbers and buttons.

## 2.12.0

- ⏱ Follows Wardyn's outage thresholds (Settings → Issues → Thresholds): how long the internet must stop answering before it's an outage, and how slow a ping can be.

## 2.11.0

- 🏠 Wardyn for HA: sends its state to Wardyn's own Home Assistant link (Wardyn → Settings → Home Assistant), and carries out its buttons (update, restart, install updates, checks, scans, speed tests) when Wardyn allows it.

## 2.10.1

- Shows its current version in Wardyn again after an update (it could keep showing the one before).

## 2.10.0

- 🏠 Sends its state to Home Assistant for the Appline for HA integration (0.8.0): connected, updates waiting, restart needed, threats, failing checks, and the health of the networks it measures. On when Wardyn is ticked in your Home Assistant link.

## 2.9.0

- 🤝 Sharing: can keep the networks you share in Wardyn up to date for the people you share them with, and carries out what their role allows.
- ⇄ Can be handed over to someone you share with: it then reports to their account. (A change to this add-on's sync code option later sets it back.)

## 2.8.0

- 🔍 Audit: Wardyn shows this Home Assistant’s host (system, disk, memory, processor) and its add-ons as its software.
- ✅ Checks: the checks Wardyn gives this node run here (disk space, memory, services, ports, websites, certificates…). Script checks only with the new **Allow script checks** option on.
- Follows its group’s policy in Wardyn unless switched otherwise on its own card.

## 2.7.1

- Wardyn's Patches lists your HACS updates too (integrations, cards and themes, marked "(HACS)"), and installs the ones you pick through Home Assistant. A HACS integration takes effect after Home Assistant restarts (it says so under Repairs).

## 2.7.0

- Netline Agent is now **Wardyn Agent**: Netline's network monitor became Wardyn, a site of its own at https://wardyn.hedgepig.uk. Same add-on, same settings and code; it shows in Wardyn's Nodes as before.

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
