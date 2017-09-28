# Documentation

## Example

The machine exporting a shared directory `192.168.100.50`.

```
nfs_exports:
  - path: '/home/shared/media'
    opts: '192.168.100.80(rw,insecure,async,no_root_squash,no_all_squash,no_subtree_check)'
    owner: 'media'
    group: 'media'
```

The machine mounting a shared directory `192.168.100.80`.

```
nfs_mounts:
  - name: '/home/username/media'
    src: '192.168.100.50:/home/shared/media'
    opts: 'proto=tcp,port=2049,_netdev'
    state: 'mounted'
    fstype: 'nfs4'
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
nfs_packages:
```

A list of the NFS packages to install. Each package supports all parameters from the
[apt](http://docs.ansible.com/ansible/apt_module.html) or [yum](http://docs.ansible.com/ansible/yum_module.html) modules.
If the value remains omitted, the following packages will be installed by default.

| Debian/Ubuntu          | RedHat/CentOS           |
| :--------------------- | :---------------------- |
| nfs-common             |  nfs-utils              |
| nfs-kernel-server      |  libnfsidmap            |

```
nfs_service_name:
```

The name of the daemon under which NFS runs. Typically this can be omitted since it's automatically determined
based on the target operating system. For RedHat/CentOS this is `nfs-server` and Debian/Ubuntu it's `nfs-kernel-server`.

```
nfs_service_state: 'started'
```

The desired NFS service state, valid values are `started`, `stopped`, `restarted` or `reloaded`.

```
nfs_service_enabled: yes
```

Whether the NFS service should start on boot, valid values are `yes`, or `no`.

```
nfs_exports_template: 'exports.j2'
```

The NFS exports template file processed by the Jinja2 templating language. The `nfs_exports` variable is consumed
by this template to generate the access control list for filesystems which may be exported. If for some reason
you need to offer custom logic within this file, you can override this value with a template of your choice.

```
nfs_exports:
```

A dictionary of the NFS exports to define. Each item in the dictionary supports the following properties:

* `path` the directory path to export to other machines.
* `opts` export options understood by the `exportfs` program.
* `owner` name of the user that should own the directory.
* `group` name of the group that should own the directory.

For more information on NFS exports please refer to the [exports](https://linux.die.net/man/5/exports) and 
[exportfs](https://linux.die.net/man/8/exportfs) documentation.

```
nfs_mounts:
```

A dictionary of mount points to configure. Each item in the dictionary supports all parameters from the
[mount](http://docs.ansible.com/ansible/mount_module.html) module.