#source $HOME/.nurc
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

export CUSTOMER_ID=""
export PS1="\[\033[0;34m\]\\u \[\033[01;32m\]\\w\[\033[0;31m\]\$(__git_ps1)"
export PS1=$PS1"\[\033[00m\] \$ "
export EDITOR=nvim
export GITHUB_TOKEN=
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

alias ll="ls"
alias ls="ls -laGFh --color"
alias bp="vim ~/.bash_profile"
alias cd..='cd ..'
alias cdn='cd ~/dev/nu; cd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../..'
alias grep='grep --color=auto'
alias c='clear'
set -o noclobber
alias ast="open -a \"Android Studio\""
alias mycid="echo $CUSTOMER_ID"
alias synctime='docker-machine ssh default "sudo ntpclient -s -h pool.ntp.org"'
alias ag='ag --ignore mothership'
alias cs="cat ~/cheatsheet; echo"
alias docker-exec-tty="docker exec -ti -u 0 mycontainer script -q -c "/bin/bash" /dev/null"

function gen-k8s-aliases {
    local prototype=$1
    alias k${prototype}="nu k8s ctl s$prototype --env prod --"
    alias k${prototype}g="nu k8s ctl s$prototype --env prod -- get"
    alias k${prototype}d="nu k8s ctl s$prototype --env prod -- describe"
    alias sk${prototype}="nu k8s ctl s$prototype --env staging --"
    alias sk${prototype}g="nu k8s ctl s$prototype --env staging -- get"
    alias sk${prototype}d="nu k8s ctl s$prototype --env staging -- describe"
 }
 
 for proto in 0 1 2 3 4 5 6
 do
   gen-k8s-aliases $proto
 done

alias kg='nu k8s ctl global --env prod -- "$@"'
alias kgd='nu k8s ctl global --env prod -- describe "$@"'
alias kgg='nu k8s ctl global --env prod -- get "$@"'
alias skg='nu k8s ctl global --env staging -- "$@"'
alias skgd='nu k8s ctl global --env staging -- describe "$@"'
alias skgg='nu k8s ctl global --env staging -- get "$@"'


alias vim=nvim
alias vi=nvim
alias vimake="nvim -c 'let g:plug_window=\"\"' +PlugClean! +PlugInstall! +PlugUpdate! +UpdateRemotePlugins +qall"
alias gti=git
alias nobracket='printf "\e[?2004l"'

export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH" # fastboot adb
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/2.7/bin"
eval "$(rbenv init -)"

findn() { find . -iname $1 -not -path '*.git*'; }
mkcd() { mkdir -p $1;cd $1; }
whereisfn() (shopt -s extdebug;declare -F $1;)
debug() (source ~/.bash_profile; export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'; set -x; bash -x "$@";)
# debug between pipes `| tee /dev/tty |`

# HISTORY
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" # Save and reload the history after each command finishes
export HISTIGNORE="*CHAT-ANSWERED*"
#unset PROMPT_COMMAND

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

unset -f lein

# Docker
mvn() { docker run -it --rm --name my-maven-project -v "$PWD":/usr/src/mymaven -w /usr/src/mymaven maven mvn "$@";}

# A bundle that has a docker image wih aws installed
#bundle ()
# {
#    docker run --rm -ti --volumes-from dev_rubygems_1 -v `pwd`:/project -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e TARGET_ENV ${EXTRA_CMD} nudev-ruby:eric2 bundle "$@"
#}

# OPAM configuration
. $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# KAFKA

k_home="$HOME/dev/kafka_2.12-0.10.2.1"
export KAFKA_DIR=$k_home
export KAFKA_HOME=$k_home

# GOOGLE CLOUD
source $HOME/dev/google-cloud-sdk/completion.bash.inc
source $HOME/dev/google-cloud-sdk/path.bash.inc
