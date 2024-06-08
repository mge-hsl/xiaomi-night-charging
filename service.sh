#!/bin/sh

sleep 30
echo 1 > /sys/class/qcom-battery/night_charging
chmod 444 /sys/class/qcom-battery/night_charging
exit