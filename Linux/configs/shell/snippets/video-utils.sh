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
    src="$(realpath $1)"
    
    ts_files=($(grep ".ts" "$src"))

    echo "Checking files in .m3u8 ..."
    for f in "${ts_files[@]}"; do
        if [[ ! -e $f ]]; then
            echo "file '$f' not exist...."
            return 1
        fi
    done
}

function m3u8merge () {
    src="$(realpath $1)"
    ext="${2:-webm}"
    dst="${3:-out}"

    dirpath="$(dirname $src)"
    dstname="$(basename $dirpath)"

    m3u8check "$src"
    if [[ $? -eq 0 ]]; then
        mkdir -p "$dst"
        echo "Merging $dstname ..."
        ffmpeg -allowed_extensions ts,m3u8key -v warning -i "$src" "$dst/$dstname.$ext"
    fi

}
