export LANG=ja_JP.UTF-8
#export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export EDITOR=vim
export XDG_CONFIG_HOME=~/.config
GOPATH="$HOME/go"
PATH="$HOME/.krew/bin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="$HOME/.poetry/bin:$PATH"
PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH

eval "$(anyenv init -)"

# Crtl-vを押したあと、調べたいキーを押すとキーコードが表示される
# Ctrl-v押下後、上矢印キー
# > ^[[A

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
alias vim='nvim'

# Peco
function peco-branch() {
    local selected_line="$(git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads refs/remotes \
        | column -t -s '|' \
        | grep -v 'origin' \
        | peco \
        | head -n 1 \
        | awk '{print $1}')"
    if [ -n "$selected_line" ]; then
        BUFFER="git checkout ${selected_line}"
        CURSOR=$#BUFFER
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-branch
bindkey '∫' peco-branch

function open-git-remote() {
  git rev-parse --git-dir >/dev/null 2>&1
  if [[ $? == 0 ]]; then
    git config --get remote.origin.url | sed -e 's#ssh://git@#https://#g' -e 's#git@#https://#g' -e 's#github.com:#github.com/#g' | xargs open
  else
    echo ".git not found.\n"
  fi
}
zle -N open-git-remote
bindkey '^o' open-git-remote

function peco-src() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

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

### AWS
function peco-aws-profile() {
    local section=$(peco <(cat ~/.aws/credentials | egrep -i "\[.*]" | grep -v 'step' | sed -e "s/^\[\(.*\)\]$/\1/"))
    if [ -z "$section" ]; then
        echo "The profile is not selected."
        zle accept-line
        return
    fi
    echo "Choice: $section"
    setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR
    okta-awscli --okta-profile $section --profile $section-step --password $(security find-generic-password -a dena-okta -w) &
    while true; do
        if ps -p $! >&-; then
            echo -ne "."
            sleep 1
        else
            echo
            export AWS_PROFILE=$section
            echo "Change AWS_PROFILE: [$section]"
            zle accept-line
            break
        fi
    done
}
zle -N peco-aws-profile
bindkey '^x' peco-aws-profile

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C "$(which aws_completer)" aws
