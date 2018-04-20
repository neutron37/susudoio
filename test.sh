#!/bin/bash
whoami
susudoio::runas_admin whoami
susudoio::runas_admin 'ls -AlFh ~/Documents'
susudoio::runas_target whoami
susudoio::runas_target 'ls  -AlFh ~/Documents'
exit 37