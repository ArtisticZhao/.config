# -----  fzf 默认选项
export FZF_DEFAULT_OPTS='--bind=ctrl-t:top,change:top'
#export FZF_DEFAULT_OPTS='--bind=ctrl-t:top,change:top --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --theme=Visual\ Studio\ Dark\+ --style=numbers --color=always --line-range :500 {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore-vcs'
export FZF_COMPLETION_TRIGGER='\'
export FZF_PREVIEW_CMD='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --theme=Visual\ Studio\ Dark\+ --style=numbers --color=always --line-range :500 {}) 2> /dev/null | head -500'

# -----  fzf 默认增强配置
function zvm_init_fzf() {
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(zvm_init_fzf)

# 下面定义了三个方便用的命令：
# - fif <word>：查找 <word> 在当前目录中的文件
# - find-in-file：在当前文件夹启动fzf窗口来交互式搜索文件内容
# - fh：查找历史记录
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
zle -N fif

find-in-file() {
    #!/bin/bash

    ##
    # Interactive search.
    # Usage: `ff` or `ff <folder>`.
    #
    [[ -n $1 ]] && cd $1 # go to provided folder or noop
    RG_DEFAULT_COMMAND="rg -i -l --hidden --no-ignore-vcs"

    selected=$(
    FZF_DEFAULT_COMMAND="rg --files" fzf \
      -m \
      -e \
      --ansi \
      --phony \
      --reverse \
      --bind "ctrl-a:select-all" \
      --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
      --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2
    )

    [[ -n $selected ]] && vim $selected # open multiple files in editor
}
zle -N find-in-file
function zvm_bindkey_fzf (){
    zvm_bindkey viins '^F' find-in-file
}

zvm_after_init_commands+=(zvm_bindkey_fzf)
# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
zle -N fh
