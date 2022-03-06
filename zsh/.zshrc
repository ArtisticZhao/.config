
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

#######################################################################
############################ 历史记录功能 #############################
#######################################################################
# 存储历史到文件中
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
# Remove superfluous blanks from each command line being added to the history
# list
setopt histreduceblanks
# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space
setopt histignorespace
# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt histignorealldups
# 允许多个zsh之间共享记录
setopt sharehistory


#######################################################################
################################ 补全系统 #############################
#######################################################################
# Use modern completion system
autoload -Uz compinit
compinit
# Enable ls colors
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
# 两次tab后 显示一个菜单可以进行选择
zstyle ':completion:*' menu select=2
# 增加彩色的补全菜单
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Automatically use menu completion after the second consecutive request for
# completion
setopt automenu
# 忽略没有匹配错误，以在命令中使用通配符
unsetopt nomatch


#######################################################################
################################ 插件系统 #############################
#######################################################################
# ----- spaceship主题和主题配置
zinit light spaceship-prompt/spaceship-prompt
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_VI_MODE_SHOW=false

# ----- vi-mode 增强
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
# 由于zvm的延迟加载机制，会导致他可以**覆盖**其他的快捷键映射
# 详情看 https://github.com/jeffreytse/zsh-vi-mode#execute-extra-commands

# ----- 自动建议，会根据输入自动查找历史
# 按-> 全部补全
# 按ctrl+w 前进一个单词
# 按ctrl+b 后退并删除一个单词
zinit light zsh-users/zsh-autosuggestions
function zvm_bindkey_autosuggestions() {
    zvm_bindkey viins '^W' forward-word
    zvm_bindkey viins '^B' backward-delete-word
    zvm_bindkey viins '^[[A' history-substring-search-up
    zvm_bindkey viins '^[[B' history-substring-search-down
}
zvm_after_init_commands+=(zvm_bindkey_autosuggestions)

# ----- 语法高亮插件
zinit light zdharma-continuum/fast-syntax-highlighting

# ----- z 命令 可以快速跳转目录
zinit light skywind3000/z.lua
alias zb='z -b'

# ----- 历史记录搜索
# 输入开头的一部分 然后按 上下键 搜索历史
zinit light zsh-users/zsh-history-substring-search
# arrow up % arrow down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-pattern-search-backward
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


### My vi mode
bindkey -v

### My indepent config
source ~/.config/zsh/env.zsh
source ~/.config/zsh/aliases.zsh
# source ~/.config/zsh/fzf.zsh
