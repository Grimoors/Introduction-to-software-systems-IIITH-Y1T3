#!/bin/bash
declare -l inputString
declare -l output
cat ./hamlet.txt | grep -i -o "to"
cat ./hamlet.txt | grep  " is "
cat ./hamlet.txt | grep -A 2 "bear"
chmod g-w ./hamlet.txt 
chmod g-x ./hamlet.txt
chmod o-w ./hamlet.txt 
chmod o-x ./hamlet.txt
chmod +r ./hamlet.txt
groups
ls -l -a | awk '{ if ($1 -eq "......x...") print $9}'