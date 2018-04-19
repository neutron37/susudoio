#!/bin/bash

susudoio::logo() {
  echo -n "${STYLE_MAGENTA}"
  cat <<"EOF"
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  SUSUDOIO                       ...whoa oh oh ┃
┃                                               ┃
┃  Wraps su and sudo for non-admin MacOS users. ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
EOF
  echo "                                ©$( date +%Y ) Neutron37"
  echo "${STYLE_RED}"

  cat <<"EOF"
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ WARNING:                                      ┃
┃ This script might not be the most secure...   ┃
┃                         Use with caution!!!   ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
EOF
  echo "${STYLE_NORMAL}"
}

susudoio::help() {

  susudoio::logo
  
  MSG_HELP=$( cat <<"HELP"
usage: susudoio <command> [--help] [--admin-user] [--admin-pass] [--target-user]

The <command> argument is required, and all other arguents are optional:

--admin-user    The administrative user
                  defaults to first non-root member of the admin group.

--admin-pass    The administrative password,
                  if missing, will be asked for interactively.

--target-user   The target user
                  defaults to the current user.
HELP)
  bashlib::msg_stdout "${MSG_HELP}"
  bashlib::exit_fail ""
}

susudoio::members() {
  dscl . -list /Users | while read user; do printf "$user ";
    dsmemberutil checkmembership -U "$user" -G "$*";
  done | grep "is a member" | cut -d " " -f 1;
};

susudoio::set_target_user() {
  TARGET_USER="${ARG_TARGET_USER:-$TARGET_USER_DEFAULT}"
}

susudoio::set_admin_user() {
  ADMIN_USER="${ARG_ADMIN_USER:-$ADMIN_USER_DEFAULT}"
}

susudoio::set_admin_password() {
  if [ -z "${ARG_ADMIN_PASS:-}" ]; then
    read -s -p "Please provide ${STYLE_BOLD}${ADMIN_USER}${STYLE_NORMAL}'s password: " ADMIN_PASS
    echo
  else
    ADMIN_PASS="${ARG_ADMIN_PASS}"
  fi
}

susudoio::become() {
  ### @TODO Nest $COMMAND in wrapper.
  SU_CMD="echo ${ADMIN_PASS} | sudo -S --prompt='' ${INCLUDES_DIR}/command_wrapper.sh ${USER_PWD} ${ADMIN_USER} ${TARGET_USER} '${COMMAND}'"
  ${INCLUDES_DIR}/susudoio.expect "${ADMIN_USER}" "${ADMIN_PASS}" "$SU_CMD"
  return "$?"
}