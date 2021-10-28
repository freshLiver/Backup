DirName="$(basename $(readlink -f . | sed -r 's/ /@@/g') | sed -r 's/@@/ /g')"
RelativePath="../$DirName/"
TargetDir="$(readlink -f ~/.local/share/plasma/layout-templates/$DirName)"

cp -Tr $RelativePath $TargetDir
