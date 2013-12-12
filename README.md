#Dotfiles
This is a simple repo containing my dotfiles. Most are commented, so you can jump right in and start looking around.

**Note**: I use zsh or bash depending on my workflow and what I'm trying to accomplish, hence the odd layout in comparison to others' dotfiles.

You'll probably want to `brew install bash zsh`, then add `/usr/local/bin/bash` and `/usr/local/bin/zsh` to `/etc/shells` before using these. You'll also want to `chsh -s /usr/local/bin/<shell of choice> $USER` beforehand, so that your default shell will be the newer version.

The structure is as follows:

---

##.dotfiles
This contains most of anything my dotfiles use. It contains a few folders:

* `all.sh`: Scripts that work for both zsh and bash
* `bash`: Scripts that are for bash only
* `zsh`: Scripts that are for zsh only

Those folders have the following structure:

###.dotfiles/&lt;shell&gt;/funcs
This folder contains any shell functions for the given shell. Those will be explained under the [**functions**](#functions) section below.

###.dotfiles/&lt;shell&gt;/alias
This file contains aliases for the given shell. Those will be explained under the [**aliases**](#aliases) section below.

###.dotfiles/&lt;shell&gt;/prompt
This file contains shell-specific prompt information. More information on the prompt can be found in the [**prompt**](#aliases) section below.

###.dotfiles/&lt;shell&gt;/*rc
This file contains any rc/profile information for a given shell. `.dotfiles/all.sh/rc` contains setup directives that work for both zsh and rsh, and `.dotfiles/bash/bash4rc` contains setup directives specific to bash 4.

###.dotfiles/bin
This folder contains any executables or the likes I've created. More information can be found in the [**executables**](#executables) section below.

###.dotfiles/etc/cache
Just a simple cache folder.

###.dotfiles/etc/man
Manpages that I've created. As `MANPATH` is updated in `.dotfiles/all.sh/rc`, these are callable via simply using `man <manpage>`. More information on my manpages can be found in the [**manpages**](#manpages) section below.

###.dotfiles/etc/setup
A folder containing setup for new systems, dotfiles, etc.

###.dotfiles/etc/templates
A folder containing templates for different things I commonly work on. More info can be found in the [**templates**](#templates) section below.

---

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

---

#Functions
I've created some functions to make life easier while in the CLI. They are as follows:

##Both bash and zsh
* `cpkey [<keyname>]`: Copies the public key in `~/.ssh/<keyname>.pub` to the clipboard. If `<keyname>` is not specified, it assumes `id_rsa`.
* `csl [<shell>]`: Changes `$USER`'s default shell to `<shell>`, where `<shell>` is just the basename of the shell (e.g. `zsh`, `bash`). If shell is given, it takes the *last* entry in `/etc/shells` whose basename is `<shell>` and changes the shell to that. If `<shell>` is not given, It reads `/etc/shells` and presents a list of shells to choose from.
* **dirswitch** `d [+ | - [<number>] | <number>]`: An easy way to switch between commonly used directories, similar to the directory stack in bash and zsh. `d +` will add the current directory to the end of the list. `d -` will remove the last directory from the list, unless `<number>` is given, in which case it will delete the entry whose index is `<number>` from the list. `d <number>` will change the current directory to the entry whose index is `<number>`. If no argument is given, it will print out the list.
* **django-manage** `m`: Just a shorter way of calling `python manage.py`, and can be called from either the project or app level.
* **git-cloners**:
	* `gh-clone <user> <repository> [<clone-to>]`: Simply runs `git clone git@github.com:<user>/<repository>.git <clone-to>`. If `<clone-to>` is not specified, it performs the default `git clone` action. Note that `<repository>` should not have `.git` on the end.
	* `bb-clone <user> <repository> [<clone-to>]`: Exact same as `gh-clone`, except it clones from BitBucket instead of GitHub.
* `mcd <dir>`: Creates the directory `<dir>` then changes the current working directory to it.
* **pman**:
	* `pman <entry>`: Caches (unless already cached) then opens the PDF version of `<entry>`'s manpage with Preview.
	* `qman <entry>`: Caches (unless already cached) then opens the PDF version of `<entry>`'s manpage with Quick Look.
	* `pmandb`: Goes through all available manpages and caches the PDF versions. **WARNING**: This takes well over a GB of hard drive space.
* **sman**:
	* `sman <entry>`: Caches (unless already cached) then opens the text version of `<entry>`'s manpage with Sublime Text in read-only mode.
	* `smandb`: Goes through all available manpages and caches the text versions.
* `use <varset>`: Sets a number of variables for use. Currenlty, the available `<varset>`s are:
	* `colors`: Check `.dotfiles/all.sh/funcs/varsets/colors`. Note that these are only the representation of the 256 color versions of the color. They do not include the leading `\e`, nor the trailing `m`.
* **venv-helper**:
	* `v create <name> [-p=<version_or_path>]`: Creates a virtualenv Python environment under the name `<name>`. If `-p=<version_or_path>` is specified and is a path, it uses that Python executable. If `-p=<version_or_path>` is a version, it will install that version on the local system (unless already installed) then use that version. Note, `-p=<version_or_path>` must be specified *after* `<name>` and must contain either a path to a Python executable, or a valid tag in the Python Mercurial repository.
	* `v use <name>`: Start using the Python virtualenv environment `<name>`.
* `warn`: Exact same as `echo`, but instead it echoes to `stderr`.

---

#Aliases
A few aliases. They are as follows:

##Both bash and zsh
* `chrome`: An alias to the Google Chrome executable, in case I want to open Chrome with any flags.
* `..`: Change to the parent directory.
* `..2`: Change to 2 parent directories above the current.
* `..#`: Change to # parent directories above the current (max 5).
* `getievms`: Either installs or reinstalls the VirtualBox IE VMs.
* `rp`: Outputs the `tail` of `$USER`'s processes, one per line, on the terminal, every 0.1 seconds. `watch` is required for this (`brew install watch`).
* `subl`: An alias to the subl executable included with Sublime Text (points to ST3).

##Zsh only
* **global** `dn`: `/dev/null`

---

#Executables
* `mountramdisk`: If the system has over 8 GB of RAM, it mounts a 500MB RAMdisk.

---

#Manpages
Manpages I've created for easy reference. Please note that they're all works in progress and likely incomplete.

* `git-tricks`: A few tricky things you can do with git.
* `osx-defaults`: A list of OSX defaults directives and what they do, so that I at least have a centralized reference.
* `vim-commands`: Just a reference for vim.

---

#Templates
Nothing here yet.

---

#Prompt
This is my crazy prompt. There are only a couple slight differences between zsh and rsh, the main difference being that zsh shows the current keymap for the line editor.

This is a little specification of how it looks:

#####`<exit>`
The exit status of the last command.

#####`<keymap>` (zsh only)
The current keymap the line editor is using.

#####`<history>`
The current number in the history.

#####`<tty>`
The current tty.

#####`<repo>`
The current repository information.

######Git
If there are changes, it looks like this:

`[git <branch> ~<files_changed> +<insertions> -<deletions>]`

If there are no changes, it looks like this:

`[git <branch> 0]`

If it is detached, it looks like this:

`[git detached <digest>]`

Where `<branch>` is the current branch, `<files_changed>` is the number of files changed, `<insertions>` is the number of insertions, `<deletions>` is the number of deletions, and `<digest>` is the shortened `HEAD` digest.

#####`<virtualenv>`
The current virtualenv information. It looks like this:

`[pyenv <env>]`

Where `<env>` is the current virtualenv environment name being used.

#####`<rbenv>`
This is not implemented yet.

#####`<battery>`
This is the battery info. It looks like this:

`<power><charge><power>`

Where `<power>` is simply a bar which depicts the current power status, and `<charge>` is one to ten dots representing the current charge level.

#####`<hostname>`
The computer's hostname.

#####`<directory>`
The user's current directory.

#####`<username>`
The username of the current user.

#####`<prompt>`
A `#` if the user is root, `$` if not root in bash, and `%` if not root in zsh.

##Display
The prompt looks like this:

###Bash
```
<exit> <<history>-<tty>> <repo> <virtualenv> <battery>
<hostname>:[<directory>] <username><prompt>
```

###Zsh
```
<exit> --<keymap>-- <<history>-<tty>> <repo> <virutalenv>
<hostname>:[<directory>] <username><prompt>
```

On the right side of the last line of the prompt will be `<battery>`.

##Variables
There are a ton of variables that you can set to alter the prompt as well. They are as follows:

######User
* `PROMPT_USER_NORMAL`: The color the username will be displayed in when the user is not root. Its default is green.
* `PROMPT_USER_ROOT`: The color the username will be displayed in when the user is root. Its default is blinking red.

######Directory
* `PROMPT_DIR_INHOME`: The color the brackets around the directory will be when the user is within their home directory. Its default is bold green.
* `PROMPT_DIR_OUTSIDE`: The color the brackets around the directory will be when the user is outside of their home directory. Its default is bold red.

######Prompt
* `PROMPT_PROMPT_NORMAL`: The color for the actual prompt at the end (`#` for root, otherwise `$` for bash and `%` for zsh) if the user is not root. Its default is bold green.
* `PROMPT_PROMPT_ROOT`: The color for the actual prompt at the end if the user is root. Its default is bold red.

######Exit Status
* `PROMPT_EXIT_ZERO`: The color for the exit status of the last command if it was 0. Its default is  green.
* `PROMPT_EXIT_NONZERO`: The color for the exit status of the last command if it was not 0. Its default is bold red.

######Repository
* `PROMPT_REPO`: If not empty, repository information will be shown in the prompt. Its default is `1`.
* `PROMPT_REPO_FILECHANGE_WARN_START`: The number of files changed before the warning color is used, inclusive. Its default is `4`.
* `PROMPT_REPO_FILECHANGE_WARN_END`: The number of files changed before the bad color is used, exclusive. Its default is `6`.
* `PROMPT_REPO_FILECHANGE_GOOD`: The color to use for the number of files changed if it is below the warning start number. Its default is bold green.
* `PROMPT_REPO_FILECHANGE_WARN`: The color to use for the number of files changed if it is between the warning start and warning end, inclusive. Its default is bold orange.
* `PROMPT_REPO_FILECHANGE_BAD`: The color to use for the number of files changed if it is above the warning end number. Its default is bold red.
* `PROMPT_REPO_INSERTION`: The color to show the insertions number in. Its default is green.
* `PROMPT_REPO_DELETION`: The color to show the deletions number in. Its default is red.
* `PROMPT_REPO_NO_CHANGE`: The color to show the `0` if there are no changes. Its default is dim green.
* `PROMPT_REPO_DETACHED`: The color to show the repo information in if it is in a detached state. The default is bold red.

######Virtualenv
* `PROMPT_VIRTUALENV`: If not empty, virtualenv information will be shown in the prompt. Its default is `1`.

######Rbenv
* `PROMPT_RBENV`: If not empty, rbenv information will be shown in the prompt. Its default is `1`.

######Battery
* `PROMPT_BATTERY`: If not empty, battery information will be shown in the prompt. Its default is `1`.
* `PROMPT_BATTERY_WARN_START`: The level of charge from 1-10 at which to start using the warn color, inclusive. Its default is `5` (Counting downward, in this case).
* `PROMPT_BATTERY_WARN_END`: The level of charge from 1-10 at which to stop using the warn color, inclusive. Its default is `3`.
* `PROMPT_BATTERY_GOOD`: The color to use for the battery charge level indicator if it is above the warning start number. Its default is bold green.
* `PROMPT_BATTERY_WARN`: The color to use for the battery charge level indicator if it is between the warning start and warning end, inclusive. Its default is bold orange.
* `PROMPT_BATTERY_BAD`: The color to use if for the battery charge level indicator if it is below the warning end number. Its default is bold red.
* `PROMPT_BATTERY_ALMOST_DEAD`: If the battery level is 1 or below, the entire battery indicator will fill up with this color. Its default is blinking red.
* `PROMPT_BATTERY_DISCHARGING`: The color to use for the power status indicators when the battery is discharging. Its default is bold red.
* `PROMPT_BATTERY_CHARGING`: The color to use for the power status indicators when the battery is charging. Its default is bold orange.
* `PROMPT_BATTERY_CHARGED`: The color to use for the power status indicators when the battery is charged. Its default is bold green.
* `PROMPT_BATTERY_OTHER`: The color to use for the power status indicators when the battery is in another state (e.g. finishing charge, AC connected). Its default is bold cyan.

---