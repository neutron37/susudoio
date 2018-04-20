#!/bin/bash
whoami
susudoio::runas_admin whoami
susudoio::runas_admin ls -AlFh
susudoio::runas_target whoami
susudoio::runas_target ls -AlFh
exit 37