# ASUS VivoBook 14 (X421EAY / X413EA) - OpenCore EFI

OpenCore EFI configuration for the **ASUS VivoBook 14 (X421EAY / X413EA)** running macOS.

---

## Hardware Specifications

| Component | Specification |
| :--- | :--- |
| **Laptop Model** | ASUS VivoBook 14 (X421EAY / X413EA) |
| **Processor** | Intel Core i3-1115G4 (Tiger Lake GT2, 2 Cores / 4 Threads, up to 4.10 GHz) |
| **Graphics** | Intel Iris Xe Graphics (G4 48EU) with full QE/CI acceleration |
| **Memory** | DDR4 3200MHz |
| **Audio Codec** | Realtek ALC256 (`layout-id` / `alcid=21`) |
| **Wi-Fi** | Intel Wireless-AC / Wi-Fi 6 (`AirportItlwm.kext`) |
| **Bluetooth** | Intel Bluetooth (`IntelBluetoothFirmware.kext` + `BlueToolFixup.kext`) |
| **Webcam** | Realtek / Azurewave 720p UVC Camera (`RealtekUVCFix.kext`) |
| **Touchpad** | ASUS Precision Touchpad (I2C-HID via `VoodooI2C.kext` + `VoodooI2CHID.kext`) |
| **Keyboard** | PS/2 Keyboard with ASUS Fn Brightness Keys (`SSDT-KBD.aml` + `VoodooPS2Controller.kext`) |
| **SMBIOS** | `MacBookPro16,2` |

---

## Working Status

| Feature | Status | Notes |
| :--- | :---: | :--- |
| **Graphics (QE/CI)** | Working | Full hardware acceleration via WhateverXe and Iris Xe framebuffer injection. |
| **Audio & Mic** | Working | Internal speakers, 3.5mm combo jack, and internal microphone (`alcid=21`). |
| **Wi-Fi** | Working | Native macOS Wi-Fi menu bar via OpenIntelWireless `AirportItlwm`. |
| **Bluetooth** | Working | Bluetooth 5.x working with native toggle in Control Center. |
| **Webcam** | Working | Working in FaceTime, Photo Booth, Discord via `RealtekUVCFix.kext`. |
| **Touchpad & Gestures** | Working | Multi-touch gestures (pinching, swipe spaces, mission control) via VoodooI2C. |
| **Keyboard & Hotkeys** | Working | Fn brightness (`F7`/`F8`) and volume controls mapped via `SSDT-KBD`. |
| **Battery & Power** | Working | Accurate battery percentage and native power management (`SMCBatteryManager`). |
| **Sleep & Wake** | Working | Lid close to sleep, power button wake, USB wake. |
| **AirDrop (Native AWDL)** | Unsupported | Intel Wi-Fi lacks Apple AWDL channel-hopping. Use **LocalSend** for wireless sharing. |
| **Passive HDMI Out** | Limited | Tiger Lake external DDI AUX channel restriction on passive HDMI. |

---

## ⚠️ MANDATORY: Generate Your Own SMBIOS Serials Before Booting

For security reasons, all personal serial numbers have been stripped from this `config.plist`. **You must generate your own unique serials before booting, or macOS iCloud and iMessage services will fail.**

1. Download **[GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)**.
2. Run `GenSMBIOS.command` and select option **3** (*Generate SMBIOS*).
3. Type:
   ```text
   MacBookPro16,2
   ```
4. Open `EFI/OC/config.plist` using **ProperTree** or **OpenCore Auxiliary Tools (OCAT)**.
5. Navigate to `PlatformInfo` -> `Generic` and fill in the fields with your generated values:
   * **`SystemProductName`**: `MacBookPro16,2`
   * **`SystemSerialNumber`**: *(Paste your generated Serial)*
   * **`MLB`**: *(Paste your generated Board Serial)*
   * **`SystemUUID`**: *(Paste your generated SmUUID)*
   * **`ROM`**: *(Use your system's MAC address or 12 random hex characters)*
6. Save the `config.plist`.

---

## Recommended BIOS Settings

Restart your ASUS laptop, press `F2` or `Delete` to enter the BIOS, switch to **Advanced Mode (F7)**:

### Disable:
* **Fast Boot**
* **Secure Boot**
* **Intel SGX** (Software Guard Extensions)
* **CFG Lock** (if visible)

### Enable:
* **VT-x** (Intel Virtualization Technology)
* **VT-d**
* **Above 4G Decoding**
* **SATA Mode:** AHCI

---

## Installation Guide

1. Format a USB drive as **FAT32** with GUID Partition Scheme (GPT).
2. Copy the `EFI` folder to the root of the EFI partition of your USB drive.
3. Generate your serials as described in the SMBIOS section above.
4. Boot into the USB by pressing `Esc` at boot.
5. Install macOS and enjoy!

---

## Credits
* [Acidanthera](https://github.com/acidanthera) for OpenCore, Lilu, VirtualSMC, WhateverGreen, AppleALC, and VoodooPS2.
* [OpenIntelWireless](https://github.com/OpenIntelWireless) for AirportItlwm and IntelBluetoothFirmware.
* [VoodooI2C Team](https://github.com/VoodooI2C/VoodooI2C) for I2C touchpad support.
* [Apple](https://www.apple.com) for macOS.
