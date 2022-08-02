#!/bin/bash

# dependency: translate-shell (https://github.com/soimort/translate-shell)

# single line for klipper:
# kdialog --passivepopup "`trans -b :en "$(echo "%s" | tr '\n' ' ' | tr -s ' ')"`" 3

TEXT="$1"
RESULT=`trans -b :en "$(echo "$TEXT" | tr '\n' ' ' | tr -s ' ')"`
kdialog --passivepopup "$RESULT" 3
