#!/usr/bin/env bash

CLIB_HOME="${BASH_SOURCE%/*}"

clibVariables()
{
  . ${CLIB_HOME}/variables.sh
}

clib()
{
  . ${CLIB_HOME}/help.sh

  local prefix="_clib_help_"
  local fn="${prefix}$1"

  if [[ $(type -t ${fn}) == "function" ]]; then
    echo "
  $(${fn})"
  elif [ "$1" == "update" ]; then
    cd ${CLIB_HOME}
    ls .git > /dev/null 2>&1

    if [ $? -gt 0 ]; then
      logMessage "You've installed the CLIB not by using Git. Package cannot be updated." $?
    else
      git pull origin master > /dev/null 2>&1

      if [ $? -eq 0 ]; then
        logMessage "Complete" $?
      else
        logMessage "Failed" $?
      fi
    fi
  else
    local functions=$(declare -F | grep ${prefix})

    for fn in ${functions//declare -f/}; do
      echo "
  $(${fn})
  =============================================================================="
    done
  fi
}

# Output a colored message.
#
# @param <string> $message
# @param <int> $color_code
coloredMessage()
{
  if [[ -n "$1" && -n "$2" ]]; then
    echo "$(tput setaf $2)$1$(tput sgr0)"
  fi
}

# Output a message to CLI with status, aligned to the right.
#
# @param <string> $message
# @param <int> [$status_code=$?]
logMessage()
{
  if [ -n "$1" ]; then
    local color=2
    local status="ok"

    if [[ -n "$2" && $2 -gt 0 ]]; then
      color=1
      status="error"
    fi

    status="[${status}]"

    printf "$1%$(($(tput cols)+${#status}-${#1}))s\n" $(coloredMessage ${status} ${color})
  fi
}

# Clone Git repo from predefined host.
#
# @param <string> $host
# @param <string> $repo
#
# @return <int>
clone()
{
  if [[ -n "$1" && -n "$2" ]]; then
    clibVariables
    local host="CLIB_CLONE_$1"

    if [ -z "${!host}" ]; then
      logMessage "The \"$1\" host does not exist." 1
      return 1
    fi

    local url="${!host}$2.git"
    logMessage "Check repo existence: ${url}"

    git ls-remote --exit-code ${url} > /dev/null 2>&1

    case $? in
      0)
        git clone ${url} ${@:3}
        ;;
      128)
        logMessage "Project \"$2\" at \"${url}\" does not exist." $?
        ;;
      *)
        ;;
    esac
  fi

  return $?
}

# Open JIRA project or issue.
#
# @param <string> $task_id
jira()
{
  clibVariables

  local project=${1%%-*}
  local task_id=${1##*-}
  local url="${CLIB_jira}/browse/${project}"

  if [ "${project}" != "${task_id}" ]; then
    url+="-${task_id}?jql=project=${project}"
  fi

  open ${url}
}

# Perform search using Google.
#
# @param <string> $query
g()
{
  clibVariables

  local query="$@"
  open "${CLIB_google}/search?q=${query}"
}

# Perform search on StackOverflow.
#
# @param <string> $query
so()
{
  g $@ site: stackoverflow.com
}

# Open your favorite online translator.
t()
{
  clibVariables

  local query="$@"
  open "https://translate.google.com?sl=auto&tl=ru&q=${query}"
}
