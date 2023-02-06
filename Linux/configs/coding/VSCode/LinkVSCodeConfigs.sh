VSCODE_CONFIG_HOME=~/.config/Code/User
VSCODE_SNIPPET_HOME=~/.config/Code/User/snippets

mkdir -p "$VSCODE_CONFIG_HOME"
mkdir -p "$VSCODE_SNIPPET_HOME"

# link settings.json
ln -srf ./settings.json "$VSCODE_CONFIG_HOME/"
ln -srf ./keybindings.json "$VSCODE_CONFIG_HOME/"

# link snippets

ln -srf ./snippets/c_cpp.code-snippets "$VSCODE_SNIPPET_HOME/"
ln -srf ./snippets/mkdocs.code-snippets "$VSCODE_SNIPPET_HOME/"

echo "done LinkVSCodeConfigs.sh!!"
