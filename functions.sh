#!/usr/bin/env bash

CLIB_HOME="${BASH_SOURCE%/*}"

clibVariables()
{
  . ${CLIB_HOME}/variables.sh
}

clib()
{
  . ${CLIB_HOME}/help.sh

  local fn="_help_${1}"

  if [[ $(type -t ${fn}) == "function" ]]; then
    echo "
  $(${fn})"
  elif [ "${1}" == "update" ]; then
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
    local line="
  ==============================================================================
"
    echo "
  `_help_clone`${line}
  `_help_jira`${line}
  `_help_g`"
  fi
}

# Output a colored message.
#
# @param <string> $message
# @param <int> $color_code
coloredMessage()
{
  if [[ -n "${1}" && -n "${2}" ]]; then
    echo "$(tput setaf ${2})${1}$(tput sgr0)"
  fi
}

# Output a message to CLI with status, aligned to the right.
#
# @param <string> $message
# @param <int> [$status_code=$?]
logMessage()
{
  if [ -n "${1}" ]; then
    local color=2
    local status="ok"

    if [[ -n ${2} && ${2} -gt 0 ]]; then
      color=1
      status="error"
    fi

    status="[${status}]"

    printf "${1}%$(($(tput cols)+${#status}-${#1}))s\n" $(coloredMessage ${status} ${color})
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
  if [[ -n "${1}" && -n "${2}" ]]; then
    clibVariables
    local host="CLIB_CLONE_${1}"

    if [ -z "${!host}" ]; then
      logMessage "The \"${1}\" host does not exist." 1
      return 1
    fi

    local url="${!host}${2}.git"
    logMessage "Check repo existense: ${url}"

    git ls-remote --exit-code ${url} > /dev/null 2>&1

    case $? in
      0)
        git clone ${url} ${@:3}
        ;;
      128)
        logMessage "Project \"${2}\" at \"${url}\" does not exist." $?
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

# Perform Google search query from CLI.
#
# @example
# g rammstein
# g latin site: wikipedia.org
#
# @param <string> $query
g()
{
  clibVariables

  local query="$@"
  open "${CLIB_google}/search?q=${query}"
}
