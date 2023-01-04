eval "$(anyenv init -)"
eval "$(pyenv init -)"
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init - zsh)"
# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
