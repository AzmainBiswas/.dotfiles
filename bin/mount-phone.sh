#!/usr/bin/env bash

phone=$(simple-mtpfs -l | dmenu -l 2 -p "Select > " | cut -d ":" -f1)
simple-mtpfs --device $phone  ~/Phone/
sleep 3
simple-mtpfs --device $phone  ~/Phone/
