
GOPATH="$HOME/go"
export LANG=ja_JP.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export PATH="${PATH}:${HOME}/.krew/bin:${GOPATH}/bin"

#--------------------------------Set Option------------------------------------#

setopt auto_menu
setopt auto_list
setopt auto_pushd
setopt auto_param_slash
setopt equals
setopt pushd_ignore_dups
setopt always_last_prompt
setopt complete_in_word
setopt list_ambiguous
setopt list_beep
setopt list_packed
setopt list_rows_first

#-----------Search---------------#

setopt inc_append_history
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

#-------------Histry---------------#

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# ZLE
# https://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9
bindkey -v
bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank

#------------------Load----------------------#

autoload -Uz colors; colors # 色
autoload -Uz compinit; compinit # 補完

#------------------Complement--------------------#

zstyle ':completion:*:default' menu select # 補完の選択
zstyle ':completion:*' ignore-parents parent pwd .. # ../の後は今いるディレクトリを補完しない

#---------Color---------#
#export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#---------Git-----------#
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '[%b](%c%u%m)'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "-"
precmd(){
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


#---------Alias---------#

case ${OSTYPE} in
    linux* ) alias ls='ls -F --color' ;;
    darwin*) alias ls='ls -FG' ;;
esac
alias rm='rm -i'
alias cp='cp -i'
alias ...='cd ../../'
alias ....='cd ../../../'

# Peco
function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
        zle clear-screen
    fi
}
zle -N peco-src
stty -ixon
bindkey '^s' peco-src

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

PROMPT="[%{${fg[cyan]}%}%B%~%b%{${reset_color}%}]"
PROMPT="$PROMPT%B%1(v|%F{yellow}%1v%f|)%b "
if [[ -s "/usr/local/opt/kube-ps1/share/kube-ps1.sh" ]]; then
    source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
    KUBE_PS1_SYMBOL_COLOR=""
    KUBE_PS1_CTX_COLOR=""
    KUBE_PS1_NS_COLOR=""
    PROMPT=$PROMPT'$(kube_ps1)'
fi
NEWLINE=$'\n'
PROMPT="$PROMPT ${NEWLINE}$ "
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
