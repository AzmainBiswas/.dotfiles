#!/bin/bash

# Load your shell environment (important if you disabled GDM)
[ -f ~/.profile ] && . ~/.profile

# Start i3
exec i3
