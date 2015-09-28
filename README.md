# CLI (Bash >= 3)

Helper functions for your daily-routine work in CLI. Execute `clib` for help.

## Installation

Clone this repository wherever you want and export the source file into your shell.

Example:

```
cd /usr/local/share
git clone git@github.com:BR0kEN-/clib.git
vim ~/.bash_profile
source /usr/local/share/clib/functions.sh
```

## Usage

The next commands will be available in your shell after installation.

### clone

Clone the one of Drupal.org projects.

```
clone drupal fpp_bundles --branch=7.x-1.x
```

Clone from FFW (UA) GitLab.

```
clone ffw sla/unga unga-project
```

Clone from GitHub.

```
clone gh br0ken-/tqextension --quiet
```

Override host.

```
vim ~/.bash_profile
CLIB_CLONE_ffw="ssh://git@git.propeople.md/"
source /usr/local/share/clib/functions.sh
```

Define new host.

```
vim ~/.bash_profile
CLIB_CLONE_bitbucket="git@bitbucket.org:"
source /usr/local/share/clib/functions.sh
```

And now, you able to perform:

```
clone bitbucket br0ken/cs
```

**Note**: All native `git clone` arguments are available.

### jira

Open the project.

```
jira pva
```

Open the task.

```
jira pva-177
```

**Note**: Project key is insensitive.

### g

Search by "rammstein" keyword in Google.

```
g rammstein
```

Search by "Latin" keyword on wikipedia.org. 

```
g latin site: wikipedia.org
```

**Note**: All Google search syntax are available.
