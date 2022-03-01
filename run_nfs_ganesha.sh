#!/bin/bash

CONF_FILE="/root/yifei/NLP_NFS_Ganesha_Assertion/tejeshwar-branch-nfs-verifs-mcfs/nfs-validator/fs-state/ganesha.conf"
LOG_FILE="/tmp/ganesha.log"
NFSD_EXE="/root/yifei/NLP_NFS_Ganesha_Assertion/nfs-ganesha/src/build/ganesha.nfsd"

if [ "$(mount | grep $SERVER_DIR)" ]; then
    runcmd umount -f $SERVER_DIR;
fi

if [ -f $LOG_FILE ]; then
    rm $LOG_FILE
fi

sudo $NFSD_EXE -F -f $CONF_FILE -L $LOG_FILE
#mount -t nfs -o vers=4 127.0.0.1:/vfs0 /tcserver

