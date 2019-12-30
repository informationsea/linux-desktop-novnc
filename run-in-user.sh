#!/bin/bash

set -ex

echo Running in user: ${USER}

if [ -d /project ]; then
    if [ ! -e $HOME/project ];then
        ln -s /project $HOME/project
    fi
fi

if [ -d /dist ]; then
    if [ ! -e $HOME/dist ];then
        ln -s /dist $HOME/dist
    fi
fi


websockify --web /usr/share/novnc/ 5901 -- vncserver :1 -localhost no -fg