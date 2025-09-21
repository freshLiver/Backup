#!/bin/bash

function conv2webm () {
    if [[ $# -lt 1 ]]; then
        echo "Usage: $0 \$SRC_EXT";
        exit 1
    fi

    ext=$1
    out=${2:-done}

    mkdir $ext && mv *.$ext $ext
    mkdir $out

    ext=$ext out=$out \
    find . -type f -name "*.$ext" -exec \
        bash -c '''
                name=$(basename "{}" .$ext); 
                ffmpeg -i "$ext/$name.$ext" -c:v libvpx-vp9 -crf 30 -b:v 0 -cpu-used 4 -c:a libopus "$out/$name.webm" && mv "$ext/$name.$ext" $out
                ''' \
        \;
}

command -v yt > /dev/null || alias yt="yt-dlp"

function yt-mpv() {
    yt-dlp -o - $1 | mpv -
}

function check_pts_slow() {
    for f in "$@"; do
        echo "Checking file '$f'..."
        ffprobe -select_streams v -show_frames -i $f -loglevel error | awk -F= '/pts_time/ {
            if (last != "" && $2 - last > 0.1) { 
              printf("PTS jump: from %.3f to %.3f\n", last, $2) 
            } 
            last=$2 
        }'
    done
}

function check_pts() {
    files=("$@")
    if [[ -z "$files" ]]; then
        while IFS= read -r -d '' f; do files+=("$f"); done < <(find . -type f -regextype egrep -regex ".*\.(mkv|mp4|webm)" -print0)
    fi

    for f in "${files[@]}"; do
        ffprobe -select_streams v -show_packets -i $f -loglevel error | awk -F= '/pts_time/ {print $2}' | sort -V | awk '
        BEGIN { BAD = 0; }
        
        {
            if (last != "" && $1 - last > 0.1) {
                BAD += 1;
                printf("PTS jump: from %.3f to %.3f\n", last, $1);
            } 
            last=$1
        }

        END { if (BAD > 0) exit -1 } ' || echo "ERROR! PTS jump detected : $f"
    done
}

function m3u8check () {

    for src in "$@"; do
        key="$(cat $src | grep -oE 'URI=.*\.m3u8key' | cut -d'"' -f2)"
        srcdir="$(dirname $src)"
        
        if [[ -z "$srcdir/$key" ]]; then
            echo "WARN: Not encrypted, decryption checks will be skipped"
        fi

        ts_files=($(grep ".ts" "$src"))

        echo "Checking files in $src (key=$srcdir/$key) ..."
        cnt=-1
        for f in "${ts_files[@]}"; do
            cnt=$(($cnt + 1))

            # simple check
            if [[ ! -e "$srcdir/$f" || ! -s "$srcdir/$f" ]]; then
                echo "file '$srcdir/$f' not exist or size == 0 ..."
                return 1
            fi

            # try decrypt
            if [[ ! -z "$key" ]]; then
                openssl aes-128-cbc -d -in "$srcdir/$f" -K "$(xxd -p $srcdir/$key)" -iv "$(printf "%032x" $cnt)" -out /dev/null
                if [[ $? -ne 0 ]]; then
                    echo "AES Decryption failed on $f ..."
                    return 1
                fi
            fi
        done
    done
}

function m3u8merge () {
    ext="${1}"
    dst="${2}"
    shift 2

    for f in "$@"; do
        src=$(realpath $f)
        dirpath="$(dirname $src)"
        dstname="$(basename $dirpath)"

        m3u8check "$f"
        if [[ $? -ne 0 ]]; then
            echo "Something wrong..."
            return 1
        fi

        mkdir -p "$dst"
        echo "Merging $dstname ..."
        ffmpeg -allowed_extensions ts,m3u8key -v warning -xerror -err_detect explode -i "$src" -c copy "$dst/$dstname.$ext"
        if [[ $? -ne 0 ]]; then
            echo "Something wrong..."
            return 1
        fi

        echo "Checking PTS jump..."
        check_pts "$dst/$dstname.$ext"
        if [[ $? -ne 0 ]]; then
            echo "Something wrong..."
            return 1
        fi
    done

}
