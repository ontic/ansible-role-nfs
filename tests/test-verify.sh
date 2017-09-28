#!/bin/bash

# Verify the installed NFS server version.
docker exec --tty ${container_id} env TERM=xterm /usr/sbin/rpcinfo -p | grep nfs