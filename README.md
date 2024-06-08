

## 80% Battery Charge Limit for Snapdragon-based Xiaomi/Redmi/POCO (a.k.a Night Charging)

### DISCLAIMER

THIS MODEL SHOULD BE SAFE TO USE, BUT I AM STILL NOT RESPONSIBLE IF ANYTHING HAPPENS TO THE DEVICE. 

### What does this module accomplish?

It limits battery charging to 80% (on Snapdragon-based Xiaomi/Redmi/POCO devices), to help extend the lifespan of its battery.

### How does it work?

By default, Xiaomi/Redmi/POCO does not give the option to limit battery charging anywhere in its UI (user interface), this is where the module comes in.

The module relies on the '/sys/class/qcom-battery/night_charging' file to accomplish that, which SEEMS like only the Snapdragon-based Xiaomi/Redmi/POCO devices have it. That file is already included with the stock firmware.

By default, the value of that file is "0", which doesn't do anything. When value of "1" gets written to that, it limits battery charging to 80%. 

It can be accomplished using Terminal/Termux by issuing the command "echo "1" > /sys/class/qcom-battery/night_charging", however whenever the device is unplugged from the charger and/or is rebooted, the file's value gets reverted back to "0", which turns it off. 

To alleviate that, this module not only sets the value of that file to "1", but it also changes its permission to read-only to prevent the system from reverting the value back to "0". Also, this needs to be done whenever the device is booted/rebooted, as the new value and permissions does not persist during reboot. This is where the script (in the module) comes in, by running the commands every time the device is booted/rebooted, (via service.d).

### Why use this over ACC or other apps?

With apps like Advanced Charging Controller (ACC), it has to be configured and could be unreliable. With this, no configuration required, essentially 'set and forget'.

### Testing
  
This has been tested on a POCO F5 (marble) running both MIUI 14 and Hyper OS 1. It's also been tested on a POCO F6 PRO (vermeer). From my research, Both the Mi 11 (venus) and POCO X3 PRO (Vayu) also has the '/sys/class/qcom-battery/night_charging' file, so anything with that file present, should theoretically work. YMMV.

This may or may not work with AOSP-based ROMs. 

### Installation

1. Go to the "Releases" section here on GitHub. Then download the .zip.
2. Open the Magisk App.
3. Go to "Modules".
4. Tap "Install from storage".
5. Select the .zip you downloaded.
6. When done, tap "reboot".

### Verification

One way to test is to charge the device, and see if it stops at 80%. 

Another way is to go to the Terminal/Termux and type the commands below.

1. su
2. cat /sys/class/qcom-battery/night_charging

If the value returns as "1", congrats, IT WORKS!

If the value returns as "0", then something went wrong. Maybe the device is not compatible with this module. Maybe it doesn't have the file (/sys/class/qcom-battery/night_charging) that this module relies on.
