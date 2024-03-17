#!/bin/bash

useradd -ms /bin/bash $RUNTIME_USER_ACCOUNT -p $(perl -e 'print crypt($ENV{"RUNTIME_USER_ACCOUNT"}, "some_salt")') \
    && usermod -aG adm rf2user

mkdir $RUNTIME_USER_HOME/Pictures/

chown -R $RUNTIME_USER_ACCOUNT:$RUNTIME_USER_ACCOUNT $RUNTIME_USER_HOME
