#!/usr/bin/env bash
#
# install fonts in linux
# run this script after installation of new distro only

downloadFontDir="$HOME/Downloads/fonts"
installFontDir="/usr/local/share/fonts"

## change if necessary
nerdfontVersion="v3.4.0"
firaCodeVersion="6.2"

rm -rfv ${downloadFontDir}/*

# checking download font dir exists or not
if [[ ! -d ${downloadFontDir} ]]; then
    printf "${downloadFontDir} does not exist so making it.\n"
    mkdir -vp $downloadFontDir
fi

# checking install font dir
if [[ ! -d ${installFontDir} ]]; then
    printf "first make ${installFontDir} directory with:\n"
    printf "sudo mkdir -v ${installFontDir}\n"
    exit 1
fi

### fonts urls
fonts=(
    "https://github.com/tonsky/FiraCode/releases/download/${firaCodeVersion}/Fira_Code_v${firaCodeVersion}.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/ComicShannsMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/JetBrainsMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/UbuntuMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/CascadiaCode.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/Meslo.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/Iosevka.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/IosevkaTerm.zip"
)

for font in ${fonts[@]}; do
    printf "\n${font} .... \n"
    wget -c -q --show-progress -P ${downloadFontDir} ${font}
done

for font in "$downloadFontDir"/*; do
    fontName=$(printf "$font" | awk -F"/" '{print $NF}' | awk -F"." '{print $1}')
    sudo unzip $font -d "${installFontDir}/${fontName}"
done

## windows fonts
if [[ -d /mnt/media/downloads/dont_delete_ever/windows_fonts ]]; then
    sudo cp -rfv /mnt/media/downloads/dont_delete_ever/windows_fonts/windows_fonts ${installFontDir}
else
    printf "Please mount media drive.\n"
fi

fc-cache -f
printf "Done ...\n"
