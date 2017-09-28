#!/bin/bash

# Verify the installed NFS server version.
docker exec --tty ${container_id} env TERM=xterm /usr/sbin/rpcinfo -p | grep nfs

if [ "${distribution}" = "ubuntu" ]; then
  # Output all versions and priority for the package.
  docker exec --tty ${container_id} env TERM=xterm apt-cache policy nfs-kernel-server
fi