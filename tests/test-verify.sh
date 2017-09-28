#!/bin/bash

# Verify the installed NFS server version.
docker exec --tty ${container_id} env TERM=xterm /usr/sbin/rpcinfo -p | grep nfs

if [ "${distribution}" = "ubuntu" ]; then
  docker exec --tty ${container_id} env TERM=xterm apt-cache policy nfs-kernel-server
  docker exec --tty ${container_id} env TERM=xterm systemctl status nfs-server.service
  docker exec --tty ${container_id} env TERM=xterm journalctl -xe
fi