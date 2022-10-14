#!/bin/bash

# this script remove newlines and repeat spaces in the input text
TEXT="$1"
RESULT="$(echo "$TEXT" | tr '\n' ' ' | tr -s ' ')"
echo -n $RESULT
