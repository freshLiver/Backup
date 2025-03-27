#!/bin/bash
IFS='
'

SRC_DIR="frags"
VF=303
AF=140
EXT="mkv"

VOUT=f$VF.$EXT.part
AOUT=f$AF.$EXT.part

# Mege video part or not
echo "Skip video part [y/N]?"
read do_skip_video_default_false

if [ "$do_skip_video_default_false" != "y" ] && [ "$do_skip_video_default_false" != "Y" ]; then
    echo -n "" > $VOUT
    for v in $(ls -v $SRC_DIR | grep -P "f$VF.$EXT.part-Frag\d+$"); do
        cat "$SRC_DIR/$v" >> $VOUT
    done
fi

# Merge audio part or not
echo "Skip audio part [y/N]?"
read do_skip_audio_default_false

if [ "$do_skip_audio_default_false" != "y" ] && [ "$do_skip_audio_default_false" != "Y" ]; then
    echo -n "" > $AOUT
    for a in $(ls -v $SRC_DIR | grep -P "f$AF.$EXT.part-Frag\d+$"); do
        cat "$SRC_DIR/$a" >> $AOUT
    done
fi

# Merge audio and video part together or not
echo "Merge video and audio part [y/N] ?"
read do_merge_default_false
if [ "$do_merge_default_false" = "y" ] || [ "$do_merge_default_false" = "Y" ]; then
    ffmpeg -i $VOUT -i $AOUT -c copy "out.f${AF}+f${VF}.$EXT"
fi

