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
chsh -s $(which zsh)
# install zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
ln -s ~/.config/zsh/.zshrc ~/.zshrc
# install lua for z.lua
sudo apt install lua5.3
```

### Install Alacritty

```shell
# install independents
sudo apt install cargo
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install alacritty
# remember add ~/cargo/bin to PATH
```

**Download the Nerd Fonts for the Alacritty.**

[Nerd Fonts](https://www.nerdfonts.com/font-downloads)  
Now I use the **SpaceMono** Nerd Font.
```shell
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SpaceMono.zip
unzip SpaceMono.zip -d SpaceMono
mv SpaceMono ~/.local/share/fonts
fc-cache -f -v
# fc-list | grep "<name-of-font>" to checkout the installed fonts.
fc-list | grep  SpaceMono
```

**Change default terminal**

```shell
# Register alacritty terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/lilacsat/.cargo/bin/alacritty 90
# Select your terminal
sudo update-alternatives --config x-terminal-emulator
```

**[Alacritty color theme](https://github.com/rajasegar/alacritty-themes)**

```shell
npm i -g alacritty-themes
```

### linuxbrew

```shell
wget https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
/bin/bash ./install.sh
```

Use linuxbrew install some useful tools.

```shell
brew install exa
brew install lazygit
brew install git-delta
brew install bat
brew install ripgrep
brew install fd
```

### ranger

**Install ranger**

WARNNING! DONNOT Upgrade python to 3.8! It will cause the apt break down.

~~[How to upgrade to Python 3.8 on Ubuntu 18.04 LTS](https://www.itsupportwale.com/blog/how-to-upgrade-to-python-3-8-on-ubuntu-18-04-lts/)~~
```
# upgrade python3
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install python3.8
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
sudo update-alternatives --config python3
```

```shell
# install ranger via pip
pip3 install ranger-fm
# for picture preview
sudo apt install w3m-img
# for compress
sudo apt install atool
```

The ranger [Keymaps](ranger/README.md)

**Install ranger's plugins**

Use the git submodule to manage 

```shell
git submodule update --init --recursive
```

### FZF

**Install**
```
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
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
