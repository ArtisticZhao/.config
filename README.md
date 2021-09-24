# My linux .config

## Quick Start

### Clone this repo to your ~/.config dir

```shell
cd ~/.config
git clone --no-checkout https://github.com/artisticzhao/.config.git tmp
mv tmp/.git .
rmdir tmp
git reset --hard HEAD
```

### Install zsh

```shell
sudo apt install zsh
# set zsh as default
chsh /bin/zsh
# install zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
cp ~/.config/zsh/.zshrc .
```

### Install Alacritty

```
sudo apt install cargo
cargo install alacritty
# remember add ~/cargo/bin to PATH
```
Change default terminal
```
# Register deepin terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/lilacsat/.cargo/bin/alacritty 90
# Select your terminal
sudo update-alternatives --config x-terminal-emulator
```

## Pull the submodules

```shell
git submodule update --init --recursive
```

## Useful tools

- [Alacritty](https://github.com/alacritty/alacritty)
- [exa](https://github.com/ogham/exa)
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [rg](https://github.com/BurntSushi/ripgrep)
- [linuxbrew](https://docs.brew.sh/Homebrew-on-Linux)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [ranger](https://github.com/ranger/ranger)
- [Delta](https://github.com/dandavison/delta) for lazygit git diff
- [Peek](https://github.com/phw/peek) for shoot gif

## Problem record

1. In Alacritty the input method will miss the first character after press the "left key"
    [When using an input method, the first character following an arrow key is lost.](https://github.com/alacritty/alacritty/issues/4588)
    It the bug of alacritty cause that in version 6.0. Use the new version of alacritty will fix the issue.
