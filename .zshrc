#環境変数
export LANG=ja_JP.UTF-8

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

#makeotf フォント用
export PATH=PATH=~/bin/FDK/Tools/osx:$PATH


#laravel
#export PATH="$HOME/.composer/vendor/bin:$PATH"
#--------------------------------Set Option------------------------------------#

setopt list_packed # できるだけ詰めて補完候補を表示
setopt print_eight_bit # 日本語ファイル名を表示
setopt no_beep # ビープ音を無効
setopt auto_cd # ディレクトリ名だけでの移動
setopt auto_pushd # cdしたら自動的にpushd
setopt pushd_ignore_dups # 重複したディレクトリを追加しない
setopt share_history # 同時に起動したzshのヒストリの共有
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_save_nodups # 重複したコマンドがあれば古い方を削除
setopt hist_reduce_blanks # ヒストリに保存するとき余分なスペースを削除
setopt auto_menu # 補完候補が複数あるときに自動的に一覧表示

#-----------Search---------------#

setopt inc_append_history
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

#-----------key---------------#

#emacs風キーバインド
bindkey -e

#-------------Histry---------------#

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

#------------------Load----------------------#

autoload -Uz colors; colors # 色
autoload -Uz compinit; compinit # 補完

#-----------------------PROMPT------------------------#
# %{${fg[color]}%}で色を指定 %{${reset_color}%}で解除
# %B~%b で太文字
# %~ カレントディレクトリ
# %n ユーザー名
# %# 一般ユーザなら% スーパユーザなら#
# %U~%u 下線
# %S~%s 強調


#------------------Complement--------------------#

zstyle ':completion:*:default' menu select # 補完の選択
zstyle ':completion:*' ignore-parents parent pwd .. # ../の後は今いるディレクトリを補完しない

#---------Color---------#
#export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

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

#二段表示
PROMPT="%{${fg[green]}%}%B[%n]%b%{${reset_color}%} [%{${fg[cyan]}%}%B%~%b%{${reset_color}%}] %B%1(v|%F{yellow}%1v%f|)%b
%# "

#---------Alias---------#

alias ls='ls -G'
#function cdls(){
#	\cd $1;
#	ls;
#}
#alias cd='cdls'

alias rm='rm -i'
alias cp='cp -i'
alias ...='cd ../../'
alias ....='cd ../../../'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/ktaro/.gvm/bin/gvm-init.sh" ]] && source "/Users/ktaro/.gvm/bin/gvm-init.sh"
