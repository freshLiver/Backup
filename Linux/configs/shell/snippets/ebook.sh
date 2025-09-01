#!/bin/bash

function epub2pdf_manga () {
    TMP_DIR=tmp

    for file in "$@"; do
        echo "==== Converting '$file' ..."

        rm -rf $TMP_DIR && mkdir $TMP_DIR
        nameonly="${file/%.epub}"
        ebook-convert "$nameonly.epub" "$nameonly.htmlz"

        unzip -q "$nameonly.htmlz" -d $TMP_DIR
        echo -e '@page {\n\tsize: A4;\n\tmargin: 0cm;\n}' >> $TMP_DIR/style.css
        chromium --headless --disable-gpu --print-to-pdf="$nameonly.pdf" "$TMP_DIR/index.html"
        rm "$nameonly.htmlz"
    done
}


