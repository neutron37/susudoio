#!/bin/bash
USER_PWD="$1"
ADMIN_USER="$2"
TARGET_USER="$3"
ADMIN_FLAG="$4"
COMMAND="$5"

susudoio::runas_admin() {
  RUNAS_ADMIN_COMMAND="${@}"
  su "${SUSUDOIO_ADMIN}" -lc "${RUNAS_ADMIN_COMMAND}"
  return "$?"
}

susudoio::runas_target() {
  RUNAS_TARGET_COMMAND="${@}"
  su "${SUSUDOIO_TARGET}" -lc "${RUNAS_TARGET_COMMAND}"
  return "$?"
}

export SUSUDOIO_TARGET="${TARGET_USER}"
export SUSUDOIO_ADMIN="${ADMIN_USER}"
export -f 'susudoio::runas_admin'
export -f 'susudoio::runas_target'
cd "${USER_PWD}"

if [ "$ADMIN_FLAG" -gt 0 ]; then
  susudoio::runas_admin ${COMMAND}
  exit "$?"
else
  ${COMMAND}
  exit "$?"
fi