#!/bin/sh

if [ "${VNC_USER}" = "" ]; then
    VNC_USER=vncuser
fi

if [ "${VNC_PASSWORD}" = "" ]; then
    VNC_PASSWORD=vncpass
fi

useradd -m -s /bin/bash ${VNC_USER}

if [ -d /project ]; then
    chown ${VNC_USER}:${VNC_USER} /project
    chmod 750 /project
fi

mkdir -p /home/${VNC_USER}/.vnc/
echo ${VNC_PASSWORD}|vncpasswd -f > /home/${VNC_USER}/.vnc/passwd
chown -R ${VNC_USER}:${VNC_USER} /home/${VNC_USER}/.vnc/
chmod 600 /home/${VNC_USER}/.vnc/passwd
su -l -c /run-in-user.sh ${VNC_USER}