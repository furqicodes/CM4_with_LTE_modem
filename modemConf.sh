#!/bin/bash

# Save modem path to variable
modemPath=$(mmcli -m any -K | grep modem.dbus-path | awk '{print $3}')
# Save modem model number and AT port to different variables
modemModel=$(mmcli -m $modemPath -K | grep modem.generic.model | awk '{print $3}')
modemPort=$(mmcli -m $modemPath -K | grep -e modem.generic.ports.value | grep at | awk '{print $3}')

# TODO: at mode support will be added later, mmcli wants to run in the
# debug mode in order to send AT commands

modemIMEI=$(mmcli -m $modemPath -K | grep modem.3gpp.imei | awk '{print $3}')
simNumber=$(mmcli -m $modemPath -K | grep modem.generic.own-numbers.value | awk '{print $3}')


echo Device: $modemModel found at: $modemPath
echo COM port: $modemPort
echo IMEI: $modemIMEI
echo My Number: $simNumber
