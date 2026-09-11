#!/bin/bash

function html_fix_cover() {
    INDEX_FILE="$1"

    grep 'type="cover"' "$INDEX_FILE" > /dev/null
    if [[ $? -ne 0 ]]; then

        HHHH=$(grep -m1 -oP '<svg.*viewBox="0 0 \d+ \d+' $INDEX_FILE | rev | cut -d ' ' -f1 | rev)
        WWWW=$(grep -m1 -oP '<svg.*viewBox="0 0 \d+ \d+' $INDEX_FILE | rev | cut -d ' ' -f2 | rev)

        cover='<div id="ebook-fix-cover">'
        cover+="<svg baseProfile=\"full\" version=\"1.1\" viewBox=\"0 0 $WWWW $HHHH\" class=\"calibre3\">"
        cover+="<image height=\"$HHHH\" width=\"$WWWW\" x=\"0\" href=\"cover.jpg\" y=\"0\"></image>"
        cover+='</svg></div>'

        echo "Insert cover image: \n$(echo $cover | sed 's/>/>\n/g')"

        # ensure no newline inside sed
        sed -i "s|<body>|\n\n<body>\n\n$cover\n|g" "$INDEX_FILE"
    fi
}

function html_fix_size() {
    INDEX_FILE="$1"
    CSS_FILE="$2"

    HHHH=$(grep -m1 -oP '<svg.*viewBox="0 0 \d+ \d+' $INDEX_FILE | rev | cut -d ' ' -f1 | rev)
    WWWW=$(grep -m1 -oP '<svg.*viewBox="0 0 \d+ \d+' $INDEX_FILE | rev | cut -d ' ' -f2 | rev)

    echo "Set page size: @page {\n\tsize: ${WWWW}pt ${HHHH}pt;\n\tmargin: 0cm;\n}"
    echo -e "@page {\n\tsize: ${WWWW}pt ${HHHH}pt;\n\tmargin: 0cm;\n}" >> "$CSS_FILE"
}

function epub2htmlz () {
    TMP_DIR=tmp

    for file in "$@"; do
        echo "==== ${FUNCNAME:-${funcstack[1]}} :: Converting '$file' ..."
        nameonly="${file/%.epub}"

        rm -rf $TMP_DIR && mkdir $TMP_DIR
        ebook-convert "$nameonly.epub" "$nameonly.htmlz"
    done
}

function htmlz2pdf () {
    TMP_DIR=tmp

    for file in "$@"; do
        echo "==== ${FUNCNAME:-${funcstack[1]}} :: Converting '$file' ..."
        nameonly="${file/%.*}"

        # extract from htmlz
        unzip -q "$nameonly.htmlz" -d $TMP_DIR

        # fix 
        html_fix_cover "$TMP_DIR/index.html"
        html_fix_size "$TMP_DIR/index.html" "$TMP_DIR/style.css"

        chromium --headless --disable-gpu --print-to-pdf="$nameonly.pdf" "$TMP_DIR/index.html"
        rm "$nameonly.htmlz"
    done
}

function epub2pdf4manga () {
    for file in "$@"; do
        epub2htmlz "$file"
        htmlz2pdf "$file"
    done
}

function imgs2pdf () {
    find . -mindepth 1 -type d \
        -exec echo "==== ${FUNCNAME:-${funcstack[1]}} :: Converting '{}' ..." \; \
        -exec bash -c "tmp=\$(echo '{}' | cut -c3-) && convert \"\${tmp}\"/* \"\${tmp}.pdf\"" \;
}

function htmls2epub() {
    title="$1"
    cover="$2"
    style="$3"
    shift 3

    mkdir out

    echo "$(cat $style)" > out/tmp-merged.html
    for dir in "$@"; do
        files=($(ls -v "$dir"))
        for f in "${files[@]}" ; do
            name="${$(basename $f)/%.html}"
            cat <(echo "<h1>$name</h1>") "$dir/$f" >> out/tmp-merged.html
        done
    done
    pandoc out/tmp-merged.html -o out/"$title".epub -M title="$title" --epub-cover-image="$cover"
}

function html2pdf_pandoc() {
    if [[ -n "$1" ]]; then
        pandoc "$1" -o "pdf/${1%.html}.pdf"
    else
        for f in *.html; do
            pandoc "$f" -o  "pdf/${f%.html}.pdf"
        done
    fi
}

function epub_extract_imgs() {
    rm -rf OPS out
    unzip $1 "OPS/*"

    page=0
    mkdir -p out
    for img in $(grep -oP 'href="\K[^"]+' OPS/standard.opf | grep -i "images/"); do
        echo "OPS/$img -> out/$(printf "%04d-$(basename $img)" $page)"
        mv "OPS/$img" "out/$(printf "%04d-$(basename $img)" $page)"
        page=$(($page + 1))
    done

    mv out "${1%.epub}"
    rm -rf OPS
}
