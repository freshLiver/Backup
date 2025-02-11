#!/bin/bash

# single line command for Klipper
# goldendict -- $(echo "%s" | tr '\n' ' ' | tr -s ' ')

# this script remove newlines and repeat spaces in the input text
TEXT="$1"
RESULT="$(goldendict -- $(echo \"$TEXT\" | tr '\n' ' ' | tr -s ' '))"
echo -n $RESULT
