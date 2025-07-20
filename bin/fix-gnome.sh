#!/bin/bash

systemctl --user mask xdg-desktop-portal-wlr
systemctl --user unmask xdg-desktop-portal-gnome
systemctl --user start xdg-desktop-portal-gnome
