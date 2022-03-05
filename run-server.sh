#!/bin/sh
/usr/sbin/run-vsftpd.sh &
/usr/sbin/syncthing --no-default-folder  --gui-address=0.0.0.0:8384 --config=/home/.config/${NUMBER} --data=/home/.data
