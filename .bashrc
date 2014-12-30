# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

source ~/.git-completion.sh
source ~/.git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\h:\w" " \\\$ "'