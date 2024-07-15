# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Source local definitions
if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi

# Exit if not interactive shell
if [ -z "$PS1" ]; then
   return
fi

# User specific aliases and functions

alias l='ls -l'
alias -- -='cd -'
alias ..='cd ..'
alias h='history'
alias hg='history | grep'
alias ch='perl -pi -e s#\!:1#\!:2#g \!:3'
alias rn2n='perl -pi -e s#\\r\\n#\\n#g'
alias r2n='perl -pi -e s#\\r#\\n#g'
alias f='find . -type f | xargs grep'
if ! alias ps > /dev/null 2>&1; then alias ps='ps ax -Ho pid,user,command'; fi
alias czt='curl \!:1 | tar xzf -'
alias gg='git grep'
alias ggf='git grep --heading --break -n -W'
alias reftig='git reflog | perl -pe "s/\e\[?.*?[\@-~]//g" | cut -c 1-7 | tig --stdin'
alias co='select br in $(git recent); do git co $br; break; done'
alias coo='select br in $(git br -r|grep -v "("|grep -v HEAD|cut -c3-|sed "s/^origin.//"); do git co $br; break; done'
alias rmm='git branch --all --merged remotes/origin/master | egrep -v "develop|staging|master|HEAD" | cut -d "/" -f 3- | xargs -n 1 git push --delete origin'
alias so='[ "$?" -eq 0 ]'
alias scp='rsync --archive --xattrs --acls --progress --rsh="ssh"'
alias vmshell='docker run -it --rm --privileged --pid=host justincormack/nsenter1'
alias dcup='docker-compose up --abort-on-container-exit'
alias lint='docker-compose run --rm --no-deps ${PWD##*/}-test sh -c "flake8 . && isort --check-only --diff ."'


function timecurl() {
    curl -L -w "time_namelookup: %{time_namelookup}\ntime_connect: %{time_connect}\ntime_appconnect: %{time_appconnect}\ntime_pretransfer: %{time_pretransfer}\ntime_redirect: %{time_redirect}\ntime_starttransfer: %{time_starttransfer}\ntime_total: %{time_total}\n" "$1"

}

function url() {
	curl -s https://director.kubeprod.hearstapps.com/url -G -d url=$1 | jq
}

function cheat() {
  curl cht.sh/$1
}

errcolor()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[93m&\e[m,'>&2)3>&1
logcolor()(set -o pipefail;"$@" 2>&1>&3|sed $'s#DEBUG#\x1b[93m&#; s#INFO#\x1b[m&#; s#ERROR#\x1b[91m&#;' >&2) 3>&1

source ~/.git-completion.bash
source ~/.git-prompt.sh

export HOMEBREW_NO_AUTO_UPDATE=1

export EDITOR=vi

export GOPATH=/Volumes/Develop/Go

export XDG_CONFIG_HOME=/Users/nicwolff/.config

export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend

export IGNOREEOF=2

export PROMPT_HOSTNAME=${NICKNAME-$HOSTNAME}
printf "\033]0;%s\007" "$PROMPT_HOSTNAME"
PROMPT_COMMAND='update_terminal_cwd;history -a;__git_ps1 "\n\[\e[0;32m\]In \[\e[1;32m\]\W\[\e[0;33m\]" \\\n"\[\e[1;32m\]\\\$\[\e[m\] " " on %s"'

LS_COLORS='no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32';
export LS_COLORS

