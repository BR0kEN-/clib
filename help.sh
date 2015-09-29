#!/usr/bin/env bash

_clib_green()
{
  coloredMessage "${1}" 2
}

_clib_yellow()
{
  coloredMessage "${1}" 3
}

_clib_blue()
{
  coloredMessage "${1}" 4
}

_clib_command()
{
  local arguments=""

  for ((i = 4; i <= $#; i++)); do
    arguments+=" `_clib_green "<${!i}>"`"
  done

  echo "`_clib_yellow "Command:"`
  `_clib_blue "${1}"`${arguments}

  `_clib_yellow "Description:"`${2}
  `_clib_yellow "Examples:"`${3}"
}

_clib_help_clone()
{
  _clib_command clone "
  Clone Git repository from remote.
  - all `_clib_green "git clone"` arguments available
  - any host can be added/overriden in file, where you include the CLIB
  " "
  clone drupal drupal --branch=7.x
  clone ffw sla/unga test
  clone gh br0ken-/tqextension --quiet
  " "host" "project" "git clone parameters"
}

_clib_help_jira()
{
  _clib_command jira "
  Open JIRA project or task in default browser. Project key is insensitive.
  " "
  jira pva
  jira pva-177
  " "project"
}

_clib_help_g()
{
  _clib_command g "
  Perform search using Google. All search syntax available.
  " "
  g rammstein
  g latin site: wikipedia.org
  " "query"
}

_clib_help_so()
{
  _clib_command so "
  Perform search on StackOverflow.
  " "
  so how to install php
  " "query"
}
