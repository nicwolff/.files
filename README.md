# .files
My bash dotfiles. To overwrite yours with these:

    cd
    git clone https://github.com/nicwolff/.files.git
    ln -fs .files/.????* .

then add ~/.bashrc.local with any host-specific settings.

## What do they do?

Lots of helpful stuff:

* Mute the login message
* Set up many handy Bash aliases
* Set Bash history to include timestamps and be shared among shells
* Set up- and down-arrows to search Bash history
* Define `rebase-all` function which will rebase all your Git branches on `origin/develop`
* Define `errcolor` function which will run a command with stderr printed in yellow
* Set up Git completion and a nice Git prompt
* Lots of Git settings and aliases
* Send VT100 "Report Device OK" every 60 seconds to keep SSH from timing out
* Set the `psql` PostgreSQL client to show verbose results automatically
