#!/usr/bin/env sh
dpkg -l | grep ii | tr -s ' ' | cut -d" " -f 2 | cut -d":" -f 1 > pacchetti_installati.txt
