#!/bin/bash
# Copyright (c) Ontic. (http://www.ontic.com.au). All rights reserved.
# See the COPYING file bundled with this package for license details.

# Verify the installed NFS server version.
docker exec --tty ${container_id} env TERM=xterm /usr/sbin/rpcinfo -p | grep nfs

# If the distribution is Ubuntu.
if [ "${distribution}" = "ubuntu" ]; then
  # Output all versions and priority for the package.
  # https://bugs.launchpad.net/ubuntu/+source/nfs-utils/+bug/1590799
  docker exec --tty ${container_id} env TERM=xterm apt-cache policy nfs-kernel-server
fi