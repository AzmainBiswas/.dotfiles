#!/usr/bin/env bash
#
# install fonts in linux
# run this script after installation of new distro only

downloadFontDir="$HOME/Downloads/fonts"
installFontDir="/usr/local/share/fonts"

## change if necessary
nerdfontVersion="v3.2.1"
firaCodeVersion="6.2"

rm -rfv ${downloadFontDir}

# checking download font dir exists or not
if [[ ! -d ${downloadFontDir} ]]; then
	echo "${downloadFontDir} does not exist so making it."
    mkdir -vp $downloadFontDir
fi

# checking install font dir
if [[ ! -d ${installFontDir} ]]; then
    echo "first make ${installFontDir} directory with:"
    echo "sudo mkdir -v ${installFontDir}"
    exit 1
fi

### fonts urls
FiraCode="https://github.com/tonsky/FiraCode/releases/download/${firaCodeVersion}/Fira_Code_v${firaCodeVersion}.zip"
ComicShannsMono="https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/ComicShannsMono.zip"
JetBrainsMono="https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/JetBrainsMono.zip"
UbuntuMono="https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/UbuntuMono.zip"
CascadiaCodeMono="https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/CascadiaCode.zip"
Meslo="https://github.com/ryanoasis/nerd-fonts/releases/download/${nerdfontVersion}/Meslo.zip"

wget ${FiraCode} --directory-prefix=${downloadFontDir}
wget ${ComicShannsMono} --directory-prefix=${downloadFontDir}
wget ${CascadiaCodeMono} --directory-prefix=${downloadFontDir}
wget ${UbuntuMono} --directory-prefix=${downloadFontDir}
wget ${JetBrainsMono} --directory-prefix=${downloadFontDir}
wget ${Meslo} --directory-prefix=${downloadFontDir}

for font in "$downloadFontDir"/*; do
    fontName=$(echo "$font" | awk -F"/" '{print $NF}' | awk -F"." '{print $1}') 
    sudo unzip $font -d "${installFontDir}/${fontName}"
done

## windows fonts
if [[ -d /mnt/media/downloads/dont_delete_ever/windows_fonts ]]; then
    sudo cp -rfv /mnt/media/downloads/dont_delete_ever/windows_fonts/windows_fonts ${installFontDir}
else
    echo "Please mount media drive."
fi

fc-cache -f
echo "Done ..."
