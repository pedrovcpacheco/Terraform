#!/bin/bash

echo -e 'o\nn\np\n1\n\n\nw' | fdisk /dev/vdb
mkdir -p /path
echo '/dev/vdb1 /path xfs  defaults 0 0' >> /etc/fstab
mkfs.xfs /dev/vdb1
mount -a
