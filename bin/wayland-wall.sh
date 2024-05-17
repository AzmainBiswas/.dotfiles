#!/usr/bin/env python3

import os
import random
import notify2

WallPath = "/mnt/media/wallpapers"


def Choose_wall():
    list_wallpaper = []
    all_wallpapers = os.listdir(WallPath)
    for _ in range(6):
        ch_wallpaper = random.choice(all_wallpapers)
        list_wallpaper.append(ch_wallpaper)
        all_wallpapers.remove(ch_wallpaper)
    wallpaper = random.choice(list_wallpaper)
    return wallpaper


if __name__ == "__main__":
    wallpaper = Choose_wall()
    fullpath = os.path.join(WallPath, wallpaper)
    os.system(f'cp -f "{fullpath}" $HOME/.config/background')

    # set wallaper
    os.system("killall swaybg && swaybg -m fill -i $HOME/.config/background &")

    # send notifucation
    notify2.init("Wallpaper")
    notification = notify2.Notification("Wallpaper Set!!", f"Wallpaper has been set to \n{fullpath}", fullpath)
    notification.set_urgency(notify2.URGENCY_NORMAL)
    notification.set_timeout(5000)
    notification.show()
