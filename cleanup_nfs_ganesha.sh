#!/bin/bash

CONF_FILE="/root/yifei/NLP_NFS_Ganesha_Assertion/tejeshwar-branch-nfs-verifs-mcfs/nfs-validator/fs-state/ganesha.conf"
LOG_FILE="/tmp/ganesha.log"
NFSD_EXE="/root/yifei/NLP_NFS_Ganesha_Assertion/nfs-ganesha/src/build/ganesha.nfsd"
SERVICE="ganesha.nfsd"
PID_DIR="/var/run/ganesha"

SERVER_DIR="/tcserver"
CLIENT_DIR="/vfs0"

if pgrep -x "$SERVICE" >/dev/null
then
    pkill -f $SERVICE
fi

if [ "$(mount | grep $SERVER_DIR)" ]; then
    umount -f $SERVER_DIR;
fi

if [ ! -d $PID_DIR ]; then
    mkdir -p $PID_DIR
fi

if [ -f $LOG_FILE ]; then
    rm $LOG_FILE
fi
