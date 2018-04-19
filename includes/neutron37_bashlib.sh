#!/bin/bash

#######################
## LIBRARY FUNCTIONS ##
#######################

# Thanks https://stackoverflow.com/a/27485157
# http://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
# See explanation of the case ${parameter/pattern/string}
bashlib::expand_path() {
  EXPANDED="${1/#\~/$HOME}"
  echo "${EXPANDED}"
}

bashlib::uuid() {
  NEW_UUID=$( LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 64 ; echo; )
  echo "${NEW_UUID}"
}

bashlib::lanip() {
  /sbin/ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1
}

bashlib::timestamp() {
  date +%Y.%m.%d_%H.%M.%S
}

# abrt: prints abort message and exits
# arg1: message
bashlib::exit_fail() {
  bashlib::msg_stderr "${STYLE_BOLD}${STYLE_RED}$@${STYLE_NORMAL}"
  exit 37;
}

# abrt: prints sussess message and exits
# arg1: message
bashlib::exit_success() {
  bashlib::msg_stdout "${STYLE_BOLD}${STYLE_GREEN}$@${STYLE_NORMAL}"
  exit 0;
}

# msg: prints a message to stdout
# arg1: message
bashlib::msg_stdout() {
  if [ ! -z "$@" ]; then
    echo "$@"
  fi
}

# msg: prints a message to stdout
# arg1: message
bashlib::msg_stdout_success() {
  if [ ! -z "$@" ]; then
    echo "${STYLE_GREEN}$@${STYLE_NORMAL}"
  fi
}

# vmsg: prints a message to stderr
# arg1: message
bashlib::msg_stderr() {
  if [ ! -z "$@" ]; then
    echo "${STYLE_RED}$@${STYLE_NORMAL}" >&2
  fi
}

#################
## Text styles ##
#################
readonly STYLE_NORMAL=$( tput sgr0 );
readonly STYLE_BOLD=$( tput bold );
readonly STYLE_BLACK=$( tput setaf 0 );
readonly STYLE_RED=$( tput setaf 1 );
readonly STYLE_GREEN=$( tput setaf 2 );
readonly STYLE_YELLOW=$( tput setaf 3 );
readonly STYLE_BLUE=$( tput setaf 4 );
readonly STYLE_MAGENTA=$( tput setaf 5 );
readonly STYLE_CYAN=$( tput setaf 6 );
readonly STYLE_WHITE=$( tput setaf 7 );

#############
## Utility ##
#############
readonly CMD_TIME=$( bashlib::timestamp )
