#Dotfiles

This is a simple repo containing my dotfiles. Most are commented, so you can jump right in and start looking around. The files are as follows:

##.man

A folder containing miscillaneous manpages which I can refer to. Via the `MANPATH` environment variable in `.bash_profile`, they are easily viewable via `man <manpage_name>` Currently, the following exist:

* `vim-commands`: Lists various vim commands

##.vim

A folder containing vim configuration, including plugins. I also have language-specific configurations for the following languages:

* Python

##.bash_profile

Standard shell configuration. It enables some options in bash and exports some environment variables.

##.bash_alias

Sourced by `.bash_profile`, contains useful aliases, including:

* `chrome`: Run Chrome from the command line so you can pass flags if necessary.
* `gh-clone <username> <repo_name_without_.git>`: Allows you to easily clone a GitHub repository.
* `bb-clone <username> <repo_name_without_.git>`: Allows you to easily clone a BitBucket repository.
* `m`: For Django, it runs manage.py from either the project or app level.

##.git_commit_template

A file containing a standard template for git commits that I (try to but generally don't) use.

##.gitconfig

My git configuration. It attemtps to include a file, `~/.gituser`, which will contain the user-specific configuration, e.g. name and email.

##.gitignore_global

A list of files for git to ignore for all repos on the machine.

##.osx

System preferencese that I generally use.

##.setup

The basic setup of a new machine.

##.vimrc
Vim configuration across all files.