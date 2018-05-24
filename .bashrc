# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source local definitions
if [ -f .bashrc.local ]; then
	. .bashrc.local
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
alias tig='env EDITOR=rmate tig'
alias tp=tig-pick
alias reftig='git reflog | perl -pe "s/\e\[?.*?[\@-~]//g" | cut -c 1-7 | tig --stdin'
alias co='select br in $(git recent); do git co $br; break; done'
alias coo='select br in $(git br -r|grep -v "("|grep -v HEAD|cut -c3-|sed "s/^origin.//"); do git co $br; break; done'
alias lmate='rmate lib/\!:1:as#::#/#.pm'
alias ma='git diff --name-only HEAD | xargs mate'
alias mm='( git diff --name-only master... ; git diff --name-only HEAD ) | sort -u | xargs mate'
alias md='( git diff --name-only develop... ; git diff --name-only HEAD ) | sort -u | xargs mate'
alias rma='git diff --name-only HEAD | xargs rmate'
alias rmm='( git diff --name-only master... ; git diff --name-only HEAD ) | sort -u | xargs rmate'
alias rmd='( git diff --name-only develop... ; git diff --name-only HEAD ) | sort -u | xargs rmate'
alias bench='hmperl -Ilib -MBenchmark'
alias jdm='git diff -U1 master... | jiradiff.pl'
alias xr='xargs rmate'
alias so='[ "$?" -eq 0 ]'

rebase-all () {
    old=`git rev-parse --abbrev-ref HEAD`
    stashed=`git stash`
    for b in $(git branch --format '%(authorname) %(refname:short)' | sed -ne "s/^`git config --get user.name` //p" | grep -- -)
    do
        git checkout $b && git rebase origin/develop && git push --force || (git rebase --abort && echo Could not rebase $b)
        echo
    done
    git checkout $old
    if [ "$stashed" != "No local changes to save" ]; then git stash pop; fi
}

errcolor()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[93m&\e[m,'>&2)3>&1
logcolor()(set -o pipefail;"$@" 2>&1>&3|sed $'s#DEBUG#\x1b[93m&#; s#INFO#\x1b[m&#; s#ERROR#\x1b[91m&#;' >&2) 3>&1

source ~/.git-completion.bash
source ~/.git-prompt.sh

export EDITOR=vi

export GOPATH=/Volumes/Develop/Go

export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend

export IGNOREEOF=2

export PROMPT_HOSTNAME=${NICKNAME-$HOSTNAME}
printf "\033]0;%s\007" "$PROMPT_HOSTNAME"
PROMPT_COMMAND='history -a;__git_ps1 "\n\[\e[0;32m\]$PROMPT_HOSTNAME: \[\e[1;32m\]\W\[\e[0;33m\]" \\\n"\[\e[1;32m\]\\\$\[\e[m\] "'

LS_COLORS='no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32';
export LS_COLORS

