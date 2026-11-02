# Wardyn Agent

Makes your Home Assistant machine a **node** for Wardyn (`https://wardyn.hedgepig.uk`). It runs on your home network
around the clock, so Wardyn can:

- find the devices on your network, with an uptime bar for each, and warn you about risky ones;
- check your connection's health (your router, your ISP and the internet) and log outages;
- run speed tests and uptime checks from home;
- read what your router reports (public address, traffic, ports it has opened).

It is the same program as Wardyn Agent on a computer (Windows, Mac, Linux), packaged for Home Assistant.

## Setup

1. In any of the apps, open **Settings > Sync > Show code** and copy your sync code.
2. Here, open **Configuration**, paste it into **Sync code**, and give the node a **Name** if you like.
3. **Save**, then **Start**. The log says "Connecting…" and then "Starting Wardyn Agent".
4. In Wardyn, open **Nodes**: it appears within a minute. Switch on the parts you want it to do there.
   Finding devices starts off; speed tests on a Raspberry Pi on Wi-Fi measure the Wi-Fi as much as your connection.

## 🛡 Home Assistant updates from Wardyn

In Wardyn's 🛡 Patches, this node lists Home Assistant's own updates: Core, the operating system, the Supervisor, your add-ons, and what HACS has downloaded (integrations, cards, themes; marked "(HACS)").
An integration from HACS takes effect once Home Assistant restarts: it says so under Settings → Repairs (a Core update in the same install restarts it anyway).
Pick some and press Install (or schedule them, or let a maintenance plan do it). It makes a backup before updating Core or an add-on,
updates add-ons first and Core last, and restarts the host only when you ask (an OS update needs that to finish). It can also ask
Home Assistant to update this add-on (⟳ Update on its card in Wardyn, or Wardyn Agent in its Patches list). To do this it has the Supervisor's manager role, which is why its security rating
is a point lower. Switch 🛡 Patches off for this node in Wardyn (🖥 Nodes) if you'd rather it didn't.

## Good to know

- **Your sync code** is kept in this add-on's settings and its data folder on your Home Assistant machine. Both are part
  of Home Assistant's backups. It is never written to the log.
- **Network access:** the add-on uses the host's network (it has to see your home network to scan and ping it) and the
  `NET_RAW` capability (for ping). It opens no ports.
- **Updates** come as add-on updates here; the agent's own self-update is switched off inside the add-on, so Wardyn
  offers no ⟳ Update for this node. **↻ Restart** in Wardyn's Nodes works: the agent starts again inside the add-on.
- **Removing it:** uninstalling the add-on stops it. Its results stay in Wardyn; remove the node in Wardyn's **Nodes**
  if you don't want it listed.
- **Wi-Fi details** aren't available from inside Home Assistant, so the Wi-Fi part has nothing to show.
