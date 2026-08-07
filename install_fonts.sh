# Install Nerd Fonts
set -e

NERD_FONTS=(
    "ComicShannsMono"
    "DaddyTimeMono"
    "FiraCode"
    "Iosevka"
    "IosevkaTerm"
    "JetBrainsMono"
    "Meslo"
)
NERD_FONTS_VERSION="v3.4.0"


# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m' # Bold Yellow
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color / Reset

# https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/AurulentSansMono.tar.xz
for font in "${NERD_FONTS[@]}"; do
    [[ -d "${HOME}/.local/share/fonts/${font}" ]] && rm -rf "${HOME}/.local/share/fonts/${font}"

    printf "${BLUE}==== Downloading %s.tar.xz ====${NC}\n" "$font"
    curl -L "https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_VERSION}/${font}.tar.xz"\
        -o "/tmp/${font}.tar.xz"
    printf "${GREEN}==== Installing %s ====${NC}\n" "$font"
    mkdir -p "${HOME}/.local/share/fonts/${font}"
    tar -xf "/tmp/${font}.tar.xz" -C "${HOME}/.local/share/fonts/${font}"
    rm -f "/tmp/${font}.tar.xz"
done

printf "${YELLOW}==== Refreshing font cache ====${NC}\n"
fc-cache -f "${HOME}/.local/share/fonts"
