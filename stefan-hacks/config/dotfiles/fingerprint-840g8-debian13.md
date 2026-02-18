# HP EliteBook 840 G8 — Fingerprint Reader on Debian 13 Trixie (GNOME)

**Hardware:** Synaptics FS7604/FS7605 Touch Fingerprint Sensor (`USB 06CB:00F0`)  
**Driver:** `libfprint` Prometheus driver (built into the kernel stack)  
**Status:** ✅ Supported — requires firmware update + package install

---

## Step 1 — Verify the device is detected

Open a terminal and confirm the fingerprint sensor is visible to the system:

```bash
lsusb | grep -i synaptics
```

You should see something like:

```
Bus 003 Device 004: ID 06cb:00f0 Synaptics, Inc.
```

If you see this line, your sensor hardware is present and recognized. If not, try rebooting and check BIOS to make sure the fingerprint reader is enabled (Security → Device Security → Fingerprint Reader: **Enable**).

---

## Step 2 — Update firmware with fwupd (CRITICAL)

This is the most important step. Without the correct Prometheus firmware, libfprint will not recognize the device even if the USB ID is visible.

```bash
# Install fwupd if not already present
sudo apt update
sudo apt install -y fwupd

# Refresh firmware metadata from LVFS
fwupdmgr refresh --force

# Check for available updates (look for "Prometheus" in the list)
fwupdmgr get-updates

# Apply all firmware updates
fwupdmgr update
```

After updating, **reboot** before continuing:

```bash
sudo reboot
```

> **What to expect:** fwupdmgr will download and flash a firmware update for the Synaptics Prometheus sensor. The target version is `10.01.3478575` or newer. This step unlocks libfprint support.

---

## Step 3 — Install fingerprint packages

```bash
sudo apt install -y fprintd libpam-fprintd gir1.2-gusb-1.0
```

- `fprintd` — the fingerprint daemon that communicates with the sensor
- `libpam-fprintd` — PAM module to enable fingerprint authentication system-wide
- `gir1.2-gusb-1.0` — GObject introspection bindings for USB (needed by fprintd)

---

## Step 4 — Start and enable the fprintd service

```bash
sudo systemctl enable fprintd
sudo systemctl start fprintd
sudo systemctl status fprintd
```

The status should show `active (running)`.

---

## Step 5 — Enroll your fingerprints

Enroll each finger you want to use. You will be prompted to scan each finger multiple times (typically 8 scans per finger).

```bash
# Enroll your right index finger (recommended for login)
fprintd-enroll -f right-index-finger

# Optional: enroll additional fingers
fprintd-enroll -f right-middle-finger
fprintd-enroll -f left-index-finger
```

**Available finger names:**
`left-thumb`, `left-index-finger`, `left-middle-finger`, `left-ring-finger`, `left-little-finger`  
`right-thumb`, `right-index-finger`, `right-middle-finger`, `right-ring-finger`, `right-little-finger`

Verify enrollment worked:

```bash
fprintd-list $USER
```

Expected output:
```
found 1 devices
Device at /net/reactivated/Fprint/Device/0
Using device /net/reactivated/Fprint/Device/0
Fingerprints for user yourname on Synaptics Sensors (press):
 - #0: right-index-finger
```

---

## Step 6 — Enable fingerprint authentication system-wide

```bash
sudo pam-auth-update --enable fprintd
```

This launches a text-based menu. Make sure **Fingerprint authentication** is checked (press Space to toggle), then press Enter to confirm.

This enables fingerprint login for:
- GNOME lock screen / login
- `sudo` in terminal
- Any application using PAM

---

## Step 7 — Enable in GNOME Settings (GUI method)

In GNOME 48, you can also manage fingerprints graphically:

1. Open **Settings** → **Users**
2. Click on your user account
3. Scroll down to **Fingerprint Login**
4. Click **Add a Fingerprint** and follow the on-screen prompts

Both the CLI method (Step 5) and GUI method enroll to the same store — you can use either or both.

---

## Step 8 — Optional: Enable fingerprint for sudo specifically

If you want to use your fingerprint for `sudo` in the terminal, add this line to `/etc/pam.d/sudo`:

```bash
sudo nano /etc/pam.d/sudo
```

Add this as the **first line** under the `@include common-auth` block:

```
auth sufficient pam_fprintd.so
```

Save and exit. Test with:

```bash
sudo ls /root
```

You should be prompted to scan your finger instead of typing a password.

---

## Troubleshooting

### Device not found by fprintd after package install

```bash
# Check if fprintd sees the device
fprintd-enroll -f right-index-finger
# Expected: "Using device /net/reactivated/Fprint/Device/0"
# Problem:  "GDBus.Error:net.reactivated.Fprint.Error.NoSuchDevice"
```

If you get `NoSuchDevice`, the firmware update in Step 2 likely did not apply. Try:

```bash
fwupdmgr get-devices
```

Look for **Prometheus** in the list and confirm its firmware version is `10.01.3478575` or newer. If it shows an older version, run `fwupdmgr update` again and reboot.

### fwupdmgr says "No upgrades for Synaptics Prometheus"

This may mean the firmware is already up to date, or the LVFS entry requires enabling the `testing` repo:

```bash
# Enable LVFS testing repository
fwupdmgr enable-remote lvfs-testing

# Refresh and try again
fwupdmgr refresh --force
fwupdmgr update
```

### fprintd service fails to start

```bash
journalctl -u fprintd -n 50
```

Check the output for missing libraries or permission errors. A common fix:

```bash
sudo apt install --reinstall fprintd libfprint-2-2
sudo systemctl restart fprintd
```

### Fingerprint works in terminal but not on GNOME lock screen

Make sure `gdm3` PAM is configured:

```bash
cat /etc/pam.d/gdm-fingerprint
```

If the file is missing or empty:

```bash
sudo pam-auth-update --force
```

Then restart GDM:

```bash
sudo systemctl restart gdm3
```

### Delete enrolled fingerprints and start over

```bash
fprintd-delete $USER
```

---

## How to verify everything is working

```bash
# 1. Confirm device is detected
lsusb | grep -i synaptics

# 2. Confirm fprintd daemon is running
systemctl is-active fprintd

# 3. Confirm fingerprints are enrolled
fprintd-list $USER

# 4. Test a fingerprint-authenticated sudo command
sudo whoami
```

If all four checks pass, your fingerprint reader is fully configured.

---

## Quick Reference — All commands in order

```bash
# Step 1: Check hardware
lsusb | grep -i synaptics

# Step 2: Update firmware
sudo apt install -y fwupd
fwupdmgr refresh --force
fwupdmgr update
sudo reboot

# Step 3: Install packages
sudo apt install -y fprintd libpam-fprintd gir1.2-gusb-1.0

# Step 4: Enable daemon
sudo systemctl enable --now fprintd

# Step 5: Enroll fingerprint
fprintd-enroll -f right-index-finger

# Step 6: Enable PAM integration
sudo pam-auth-update --enable fprintd
```
