#!/bin/bash

# This script exists because 'jekyll serve --watch' does not notice changes
# inside the shared '/vagrant' folder.

set -e

rsync -a /vagrant/site /home/vagrant
jekyll serve --watch --source /home/vagrant/site --host 0.0.0.0 &

while [ 1 ]
do
  rsync -a /vagrant/site /home/vagrant 
  sleep 0.5
done
