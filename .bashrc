# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source local definitions
if [ -f .bashrc.local ]; then
	. .bashrc.local
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
alias ps='ps ax -Ho pid,user,command'
alias czt='curl \!:1 | tar xzf -'
alias gg='git grep'
alias tig='env EDITOR=rmate tig'
alias lmate='rmate lib/\!:1:as#::#/#.pm'
alias rma='git diff --name-only HEAD | xargs rmate'
alias rmm='\( git diff --name-only master... ; git diff --name-only HEAD \) | sort -u | xargs rmate'
alias bench='hmperl -Ilib -MBenchmark'
alias jdm='git diff -U1 master... | jiradiff.pl'
alias xr='xargs rmate'

source ~/.git-completion.sh
source ~/.git-prompt.sh

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

PROMPT_COMMAND='history -a;__git_ps1 "\[\e[0;32m\]${NICKNAME-\h}:\[\e[1;32m\]\w\[\e[0;33m\]" " \[\e[1;32m\]\\\$\[\e[m\] "'

LS_COLORS='no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32';
export LS_COLORS

