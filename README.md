# CLI (Bash)

Helper functions for your daily-routine work in CLI. Execute `clib [command]` for help.

## Installation

Clone this repository wherever you want and export the source file into your shell.

Example:

```shell
cd /usr/local/share
git clone git@github.com:BR0kEN-/clib.git
vim ~/.bash_profile
source /usr/local/share/clib/functions.sh
```

**NOTE**! If you are not a Mac OS user, then create an alias for the `open` command inside of one of available boot files for your shell (e.g. `~/.profile`, `~/.bash_profile`, `/etc/bashrc` etc.).

Example for Ubuntu:

```shell
alias open="sensible-browser"
```

## Update

Execute the `clib update` and latest code will be grabbed from remote.

## Usage

The next commands will be available in your shell after installation.

**Note**: Updating won't work if you installed scripts not via Git.

### clone

All arguments for `git clone` are available and can be passed after first couple.

#### Clone from Drupal.org.

```shell
clone drupal fpp_bundles
```

#### Clone from FFW (UA) GitLab.

```shell
clone ffw sla/unga
```

#### Clone from GitHub.

```shell
clone gh br0ken-/tqextension
```

#### Clone from BitBucket.

```shell
clone bb br0ken/gta
```

Override host.

```shell
vim ~/.bash_profile
CLIB_CLONE_ffw="ssh://git@git.propeople.md/"
source /usr/local/share/clib/functions.sh
```

Define new host.

```shell
vim ~/.bash_profile
CLIB_CLONE_bitbucket="git@bitbucket.org:"
source /usr/local/share/clib/functions.sh
```

And now, you able to perform:

```shell
clone bitbucket br0ken/cs
```

**Note**: All native `git clone` arguments are available.

### jira

Open the project.

```shell
jira pva
```

Open the task.

```shell
jira pva-177
```

**Note**: Project key is insensitive.

### g

Search by "rammstein" keyword in Google.

```shell
g rammstein
```

Search by "Latin" keyword on wikipedia.org. 

```shell
g latin site: wikipedia.org
```

**Note**: All Google search syntax are available.

### so

Useful alias for `g [query] site: stackoverflow.com`

```shell
so how to install php
```

### t

Open Google Trnaslator.

```shell
t [query]
```
