#Dotfiles

This is a simple repo containing my dotfiles. Most are commented, so you can jump right in and start looking around. The files are as follows:

##.usr

A folder containing generally eveything I didn't want bloating my home folder. This includes bash functions, executables, extra configs, etc.

###.usr/bin

A folder containing executables I've created. It currently includes the following:

* `mountramdisk`: A utility that simply mounts a 500MB RAM disk (I'll be upgrading it soon).

###.usr/etc

The folder that holds most of the files I didn't want bloating my home folder. It includes the following files:

* `bash4rc`: A bash configuration script that is sourced if Bash 4 is being used.
* `bash_alias`: A bash configuration script containing any aliases I have, incuding:
	* `chrome`: Run Chrome from the command line so you can pass flags if necessary.
* `bash_prompt`: A file that handles how the prompt looks. Currently it's a tiny bit clunky and slow, so I'll likely be making some changes soon.
* `git_commit_template`: A file containing a standard template for git commits that I (try to but generally don't) use.

###.usr/etc/bash_funcs

This folder contains any functions I've created for bash.  It also contains a `utils` folder that contains any utilities any of these functions might harness.

####.usr/etc/bash_funcs/dirswitch

This file contains 1 function, `d`. `d` stores a list of directories in `~/.dlist`, which you can switch to easily with `d <dir_number>`. You can add directories with `d +`, remove with `d -`, and display the list with `d`. Run `d ?` for more information. I find it much easier to work with than `pushd`/`popd`.

####.usr/etc/bash_funcs/django-manage

This file contains 1 function, `m`, which is for Django. It runs manage.py from either the project or app level.

####.usr/etc/bash_funcs/git-cloners

This file contains 2 functions:

* `gh-clone <username> <repo_name_without_.git>`: Allows you to easily clone a GitHub repository.
* `bb-clone <username> <repo_name_without_.git>`: Allows you to easily clone a BitBucket repository.

####.usr/etc/bash_funcs/pman

This file contains 4 functions:

* `cache_man_pdf`: Saves a copy of the given man page into `.usr/etc/cache/pman`. There should generally never be a reason to call this function.
* `pman`: Opens the given man page as a PDF in Preview. If a cached version of the man page does not exist, it will call `cache_man_pdf` and create one.
* `qman`: Opens the given man page as a PDF in Quick Look. If a cached version of the man page does not exist, it will call `cache_man_pdf` and create one.
* `pmandb`: Obtains a list of available man pages and caches all of them. This function takes quite a while and will likely end up with over 1GB worth of PDF man pages.

####.usr/etc/bash_funcs/sman

This file contains 3 functions:

* `cache_man_txt`: Saves a copy of the given man page into `.usr/etc/cache/sman`. There should generally never be a reason to call this function.
* `sman`: Opens the given man page as a read-only plain text file in Sublime Text 3. If a cached version of the man page does not exist, it will call `cache_man_txt` and create one.
* `smandb`: Obtains a list of available man pages and caches all of them.

###.usr/etc/cache

This folder contains the caches for `pman` and `sman`.

###.usr/etc/man

A folder containing miscillaneous manpages which I can refer to. Via the `MANPATH` environment variable in `.bashrc`, they are easily viewable via `man <manpage_name>` Currently, the following exist:

* `vim-commands`: Lists various vim commands.
* `osx-defaults`: Lists various OS X preferences which can be changed using the `defaults` command.

###.usr/etc/setup

Contains files for setting up a new system, including:

* `osx`: Programmatically changes some system settings.
* `setup`: Sets up a system, installing various tools.

##.vim

A folder containing vim configuration, including plugins. I also have language-specific configurations for the following languages:

* Python

##.bash_profile

Simply sources `.bashrc`

##.bashrc
Standard shell configuration. It enables some options in bash and exports some environment variables.

##.gitconfig

My git configuration. It attemtps to include a file, `~/.gituser`, which will contain the user-specific configuration, e.g. name and email.

##.gitignore_global

A list of files for git to ignore for all repos on the machine.

##.inputrc

Readline configuration that maps some keys and sets up the config for terminal input.

##.vimrc
Vim configuration across all files.
