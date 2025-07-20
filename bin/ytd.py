#!/usr/bin/env python3
import sys, os


def LinkAndName():
    VQuality = sys.argv[1]
    YTlink = sys.argv[2]
    Vnmae = sys.argv[3:]
    VnameJoint = "-".join(Vnmae)
    VnameSmall = VnameJoint.lower()
    return VQuality, YTlink, VnameSmall


VQuality, YTlink, VideoNmae = LinkAndName()
os.system(f'yt-dlp -f "{VQuality}+ba" --merge-output-format mp4 {YTlink} -o {VideoNmae}')
# print(f'yt-dlp -f "{VQuality}+ba" {YTlink} -o {VideoNmae}')
