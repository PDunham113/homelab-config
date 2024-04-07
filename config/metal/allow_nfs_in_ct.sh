#!/bin/bash
set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
readonly SCRIPT_DIR

# From https://forum.proxmox.com/threads/nfs-server-in-lxc.105073/
# They stick 'mount fstype=nfs*,' literally everywhere - I am pretty sure that's not needed
# CT will need privileged=true and 'lxc.apparmor.profile = lxc-default-with-nfsd'
main () {
    cp "${SCRIPT_DIR}/lxc-default-with-nfsd.apparmor" '/etc/apparmor.d/lxc/lxc-default-with-nfsd'
    apparmor_parser -r '/etc/apparmor.d/lxc-containers'
}

main "$@"
