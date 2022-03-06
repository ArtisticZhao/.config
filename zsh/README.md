# ZSH

## Keybinds and functions
Show keycode in zsh: press [c-v] then press the key.

Use [c-w]/[c-b] to go forward-word/backward-delete-word in zsh-autosuggestions.

[c-r] 增强历史记录搜索功能

Use Arrow-UP/Arrow-Down for history substring searching.

Use [c-f] to call find-in-file function.

Use fh to fzf the zsh history.

Use fif [key words] to find the [key words] in files.

## Trouble shooting

如果某些自定义快捷键未能按照预期工作，但是重新`source ~/.zshrc` 之后就恢复正常，
这是由于zvm的延迟启动机制导致的快捷键设定被其他插件覆盖(这里的其他插件指的就是zsh-vi-mode)。

解决办法：在zshrc file最上面有个自定义函数那里定义了一些快捷键，按照那个方式重新定义即可。
