#!/usr/bin/env bash

_doc_param()
{
    coloredMessage "${1}" 2
}

_doc_yellow()
{
    coloredMessage "${1}" 3
}

_doc_blue()
{
    coloredMessage "${1}" 4
}

_help_clone()
{
  echo "`_doc_yellow "Command:"`
  `_doc_blue "clone"` `_doc_param "<host>"` `_doc_param "<project>"` `_doc_param "<git clone parameters>"`

  `_doc_yellow "Description:"`
  `_doc_blue "Clone Git repository from remote."`
  `_doc_blue "- all"` `_doc_param "git clone"` `_doc_blue "arguments available"`
  `_doc_blue "- any host can be added/overriden in file, where you include the CLIB"`

  `_doc_yellow "Examples:"`
  `_doc_blue "clone drupal drupal --branch=7.x"`
  `_doc_blue "clone ffw sla/unga test"`
  `_doc_blue "clone gh br0ken-/tqextension --quiet"`"
}

_help_jira()
{
  echo "`_doc_yellow "Command:"`
  `_doc_blue "jira"` `_doc_param "<project>"`

  `_doc_yellow "Description:"`
  `_doc_blue "Open the JIRA project or task in default browser. Project key is insensitive."`

  `_doc_yellow "Examples:"`
  `_doc_blue "jira pva"`
  `_doc_blue "jira pva-177"`"
}

_help_g()
{
  echo "`_doc_yellow "Command:"`
  `_doc_blue "g"` `_doc_param "<query>"`

  `_doc_yellow "Description:"`
  `_doc_blue "Perform search in Google. All search syntax available."`

  `_doc_yellow "Examples:"`
  `_doc_blue "g rammstein"`
  `_doc_blue "g latin site: wikipedia.org"`"
}
