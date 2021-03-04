#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/run.sh" ]]; then
    . /apache-init.sh
     /regenerate-ssh-keys.sh
    nami_initialize php apache phabricator
    info "Starting gosu... "
    . /post-init.sh
fi

exec tini -- "$@"
