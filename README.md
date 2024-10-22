# LineageOS 13.0 for Huawei hi3635 devices (EMUI 3.1)
## This device tree is intended to be used with these repositories: 

[`android_kernel_huawei_hi3635`](https://github.com/schwienernitzel/android_kernel_huawei_hi3635) _(branch: cm-13.0)_
######
[`android_vendor_huawei_hi3635`](https://github.com/schwienernitzel/android_vendor_huawei_hi3635) _(branch: cm-13.0)_

## Currently supported models:

`Huawei MediaPad M2 8.0 (mozart)` → [Hardware specifications](https://www.gsmarena.com/huawei_mediapad_m2_8_0-7309.php)
- M2-801L
- M2-802L
- M2-803L
- M2-801W

`Huawei MediaPad M2 10.0 (liszt)` → [Hardware specifications](https://www.gsmarena.com/huawei_mediapad_m2_10_0-7854.php)
- M2-A01L
- M2-A01W

## How to build the ROM:

1. You need Linux to be able to build Android from source. Here, I use Ubuntu 20.04 LTS to build.
2. Now read [this manual](http://source.android.com/source/initializing.html) on how to set up your build environment and go through the steps.
3. Download the LineageOS source code by executing the following commands in your terminal.
```bash
mkdir los13 && cd los13
repo init -u https://github.com/LineageOS/android.git -b cm-13.0
repo sync -f --force-sync --no-clone-bundle --no-tags -j$(nproc --all)
```

4. Set up the device-specific repositories.
```bash
git clone https://github.com/schwienernitzel/android_device_huawei_hi3635 -b cm-13.0 device/huawei/hi3635
git clone https://github.com/schwienernitzel/android_kernel_huawei_hi3635 -b cm-13.0 kernel/huawei/hi3635
git clone https://github.com/schwienernitzel/android_vendor_huawei_hi3635 -b cm-13.0 vendor/huawei/hi3635
```

5. Kick off the ROM build.
```bash
. build/envsetup.sh
lunch lineage_hi3635-userdebug
export ANDROID_JACK_VM_ARGS="-Xmx32g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"
export USE_CCACHE=1
ccache -M 100G
mka bacon
```

> **Note:** You might have to adjust the memory assignments depending on your hardware specifications.

6. **Done!** Please note that this work is opensource and every kind of **contribution is highly appreciated.** Feel free to create a fork, pull request or issue to make your contribution. Please let me know if there are code mistakes, typos, or outdated information. If you like my work, [buy me a cup of coffee.](https://paypal.me/felixpat)

## Issue tracker:

| Feature                                  | Status                              | Device                             | Comments                       | 
| :------------------------------------  | :-------------------------------- | :-------------------------------- | :-------------------------------- | 
| ~~`Audio`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |
| ~~`Bluetooth`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |
| `Camera` | _not working_ | **liszt, mozart** | |
| `DRM` | _not working_ | **liszt, mozart** | |
| ~~`External Storage`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |
| `Fingerprint` | _not working_ | **liszt, ~~mozart~~** | | 
| `Gatekeeper` | _not working_ | **liszt, mozart** | |
| ~~`GPS`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |
| ~~`Hardware Composer`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **PARTIALLY FIXED** <br> → Currently using the implementation by [`Meticulus`](https://github.com/penn5/android_device_huawei_hi6250-common/tree/cm-13.0/libhwcomposer) |
| ~~`Init`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |
| `Keystore` | _not working_ | **liszt, mozart** | |
| ~~`Live Display`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |
| ~~`Offline Charging`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** | 
| ~~`OMX`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **PARTIALLY FIXED** <br> → Not completed... |
| ~~`SELinux`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **PARTIALLY FIXED** <br> → `androidboot.selinux` set to permissive | 
| ~~`Sensors`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **PARTIALLY FIXED** <br> → `E SensorHub:` failed open /sys/class/sensors/libsensor_ver <br> → `E SensorHub:` open /sys/class/sensors/mag_sensor/calibrate_method fail, ret=-1 |
| ~~`Thermal`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |
| ~~`Touchscreen`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **PARTIALLY FIXED** <br> → The default screen orientation needs to be set to _landscape_ on liszt |
| ~~`USB`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |
| `Webview` | _not working_ | **liszt, mozart** | |
| `Widevine` | _not working_ | **liszt, mozart** | |
| ~~`Wifi`~~ | _~~not working~~_ | **~~liszt, mozart~~** | **FIXED** |

## Screenshots:

| ![mozart](./screenshots/sc2.png) | ![liszt](./screenshots/sc1.png) |
|:--:|:--:|
