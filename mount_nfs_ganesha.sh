#!/bin/bash

SERVER_DIR="/tcserver"
CLIENT_DIR="/vfs0"

if [ -d $SERVER_DIR ]; then
    rm -rf $SERVER_DIR
fi

mkdir $SERVER_DIR

if [ -d $CLIENT_DIR ]; then
    rm -rf $CLIENT_DIR
fi

mkdir $CLIENT_DIR

if [ "$(mount | grep $SERVER_DIR)" ]; then
    runcmd umount -f $SERVER_DIR;
fi

mount -t nfs -o vers=4 127.0.0.1:$CLIENT_DIR $SERVER_DIR

