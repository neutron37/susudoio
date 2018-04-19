#!/bin/bash
USER_PWD="$1"
ADMIN_USER="$2"
TARGET_USER="$3"
COMMAND="$4"

susudoio::runas_admin() {
  su ${SUSUDOIO_ADMIN} -lc "$@"
  return "$?"
}

susudoio::runas_target() {
  su ${SUSUDOIO_TARGET} -lc "$@"
  return "$?"
}

export SUSUDOIO_TARGET="${TARGET_USER}"
export SUSUDOIO_ADMIN="${ADMIN_USER}"
export -f 'susudoio::runas_admin'
export -f 'susudoio::runas_target'
cd "${USER_PWD}"
"$COMMAND"
exit "$?"