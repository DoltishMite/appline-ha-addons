# Netline Agent

Makes your Home Assistant machine a **node** for Netline (`https://netline.hedgepig.uk`). It runs on your home network
around the clock, so Netline can:

- find the devices on your network, with an uptime bar for each, and warn you about risky ones;
- check your connection's health (your router, your ISP and the internet) and log outages;
- run speed tests and uptime checks from home;
- read what your router reports (public address, traffic, ports it has opened).

It is the same program as Netline Agent on a computer (Windows, Mac, Linux), packaged for Home Assistant.

## Setup

1. In any of the apps, open **Settings > Sync > Show code** and copy your sync code.
2. Here, open **Configuration**, paste it into **Sync code**, and give the node a **Name** if you like.
3. **Save**, then **Start**. The log says "Connecting…" and then "Starting Netline Agent".
4. In Netline, open **Nodes**: it appears within a minute. Switch on the parts you want it to do there.
   Finding devices starts off; speed tests on a Raspberry Pi on Wi-Fi measure the Wi-Fi as much as your connection.

## 🛡 Home Assistant updates from Netline

In Netline's 🛡 Patches, this node lists Home Assistant's own updates: Core, the operating system, the Supervisor and your add-ons.
Pick some and press Install (or schedule them, or let a maintenance plan do it). It makes a backup before updating Core or an add-on,
updates add-ons first and Core last, and restarts the host only when you ask (an OS update needs that to finish). It can't update
itself: Home Assistant does that, here in Add-ons. To do this it has the Supervisor's manager role, which is why its security rating
is a point lower. Switch 🛡 Patches off for this node in Netline (🖥 Nodes) if you'd rather it didn't.

## Good to know

- **Your sync code** is kept in this add-on's settings and its data folder on your Home Assistant machine. Both are part
  of Home Assistant's backups. It is never written to the log.
- **Network access:** the add-on uses the host's network (it has to see your home network to scan and ping it) and the
  `NET_RAW` capability (for ping). It opens no ports.
- **Updates** come as add-on updates here; the agent's own self-update is switched off inside the add-on, so Netline
  offers no ⟳ Update for this node. **↻ Restart** in Netline's Nodes works: the agent starts again inside the add-on.
- **Removing it:** uninstalling the add-on stops it. Its results stay in Netline; remove the node in Netline's **Nodes**
  if you don't want it listed.
- **Wi-Fi details** aren't available from inside Home Assistant, so the Wi-Fi part has nothing to show.
