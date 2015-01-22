# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# Send VT100 "Report Device OK" every 60 seconds to keep SSH from timing out
notidle() { printf "\033[0n"; sleep 60; notidle; }
{ notidle 2>&3 & } 3>&2 2>/dev/null
