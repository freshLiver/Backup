#!/bin/bash

# single line command for Klipper
# xclip -o | tr '\n' ' ' | tr -s ' ' | xclip -selection clipboard

# this script remove newlines and repeat spaces in the input text
TEXT="$1"
RESULT="$(echo "$TEXT" | tr '\n' ' ' | tr -s ' ')"
echo -n $RESULT
