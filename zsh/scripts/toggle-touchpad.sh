#!/bin/bash
# https://askubuntu.com/questions/65951/how-to-disable-the-touchpad

padname=Touchpad
# padname=FingerSensingPad

declare -i ID
ID=`xinput list | grep -Eo $padname'\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
declare -i STATE
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $ID
    echo "Touchpad disabled."
else
    xinput enable $ID
    echo "Touchpad enabled."
fi

# Below solution is temporary only, like really temporary
# touchpad_state=$(synclient | grep Touchpad | grep -o '[0-9]$')
# echo $touchpad_state
# if [ $touchpad_state -eq 0 ]
# then
#   synclient TouchpadOff=1
#     echo "Touchpad enabled."
# else
#   synclient TouchpadOff=0
#     echo "Touchpad disabled."
# fi
