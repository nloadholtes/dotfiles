# dotfiles
THESE ARE MY DOTFILES. THERE ARE MANY LIKE THEM, BUT THIS ONE IS MINE.

## vscode
To get the list of extensions installed:

`code --list-extensions > vscode/extensions.txt`

To install the extensions, use this command:

`cat vscode/extensions.txt | xargs -L 1 code --install-extension`
