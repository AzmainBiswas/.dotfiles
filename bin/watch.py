#!/usr/bin/env python3

import argparse
import os
import subprocess
import time


def watch_file(file_path: str, command: list[str]):
    last_mtime = os.path.getmtime(file_path)
    command_str = " ".join(command)
    while True:
        current_mtime = os.path.getmtime(file_path)
        if current_mtime != last_mtime:
            print(f"File {file_path} changed! Running: {command_str}")
            subprocess.run(command, shell=True)
            last_mtime = current_mtime
        time.sleep(1)


def parse_arguments():
    arg = argparse.ArgumentParser(
        description="Watch a file for changes and run a command when it does"
    )
    _ = arg.add_argument("file", type=str, help="The file to watch")
    _ = arg.add_argument(
        "command",
        nargs=argparse.REMAINDER,
        help="The command to run when the file changes",
    )
    return arg.parse_args()


def main():
    argument = parse_arguments()
    watch_file(argument.file, argument.command)


if __name__ == "__main__":
    main()
