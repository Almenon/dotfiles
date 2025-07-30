#!/bin/bash
set -Eeou pipefail
# This script reminds me to take a quick eye break every 20 minutes
# I get a headache if I don't do this :(
# https://www.mayoclinic.org/diseases-conditions/eyestrain/diagnosis-treatment/drc-20372403

while :
do
    osascript -e 'display notification "Take a eye break!" with title "Eyes"'
    sleep 1200
done