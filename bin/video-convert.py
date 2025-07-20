#!/usr/bin/env python3

import os
import sys

FROM = sys.argv[1]
TO = "mp4"


def prCyan(skk):
    print("\033[96m {}\033[00m".format(skk))


def main():
    for file in os.listdir():
        name, ext = os.path.splitext(file)
        if ext == f".{FROM}":
            os.system(
                f'ffmpeg -i "{name}.{FROM}" -c:v copy -c:a copy "{name}.{TO}"')
            os.remove(file)
            prCyan(f"complete {name}.{TO}")


if __name__ == "__main__":
    print(f"This is convertiong {FROM} to {TO}.")
    confromation = input("Are you ok (Y/N)?: ")
    if confromation == "y" or confromation == "Y":
        main()
