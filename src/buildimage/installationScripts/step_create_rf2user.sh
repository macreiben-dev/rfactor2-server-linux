#!/bin/bash

useradd -ms /bin/bash rf2user -p $(perl -e 'print crypt("rf2user", "some_salt")')

mkdir /home/rf2user/Pictures/

chown -R rf2user:rf2user /home/rf2user
