#!/usr/bin/env sh
#
# UpdateGithub.sh 2.0
#
#
# Copyleft )C( 2013-2015 Luca Cappelletti <luca.cappelletti@gmail.com>
#
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# Version 2, December 2004
#
# Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
# 0. You just DO WHAT THE FUCK YOU WANT TO.
#

COMMENT=$1

[ -z $1 ] && COMMENT=""

git config --global user.name "mutek"
git config --global user.email mutek@inventati.org

echo "Aggiungo i cambiamenti al database locale"
git add -A .
#echo "Inserisci una descrizione dei tuoi cambiamenti"
#read n
echo "Eseguo la finalizzazione dei cambiamenti in locale"
EPOCA_UNIX=$(date +%N)

CHANGE_LOG=$EPOCA_UNIX" "$COMMENT

echo "Commento transazione: "$CHANGE_LOG
git commit -a -m "$CHANGE_LOG"

echo "Invio i cambiamenti locali al deposito remoto..."
git push origin master
#git push origin gh-pages
echo "ok"
