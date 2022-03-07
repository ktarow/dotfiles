tap "homebrew/cask"
tap "aws/tap"

brew "neovim"
brew "anyenv"
brew "peco"
brew "tmux"
brew "jq"
brew "mas"
brew "awscli"
brew "mysql-client"
brew "ghq"
brew "ipcalc"
brew "sipcalc"

# JAVA_HOMEは$(brew --prefix)/opt/openjdk*
# jenvで管理
brew "java" unless system "/usr/libexec/java_home -F"
brew "java11" unless system "/usr/libexec/java_home -F"

cask "deepl"

mas "LINE", id: 539883307
mas "Feedly", id: 865500966
