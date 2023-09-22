#!/bin/sh

ROM_VERSION="lineage-20.0"
MODEL_DEVICE="CHANGE_FOR_NAME_DEVICE"

## OnePlus 6
# rom: lineage-20.0
# device: enchilada
# link: https://wiki.lineageos.org/devices/enchilada/build

## OnePlus 8T
# rom: lineage-20.0
# device: kebab
# link: https://wiki.lineageos.org/devices/kebab/build

mkdir -p $HOME/android/tools
mkdir -p $HOME/android/lineageos
mkdir -p $HOME/android/tools/google

ANDROID_TOOLS="$HOME/android/tools"
LINEAGEOS="$HOME/android/lineageos"
GOOGLE_REPO="$HOME/android/bin"

# download sdk tools
wget -c https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d $ANDROID_TOOLS

# add Android SDK platform tools to path
if [ -d "$ANDROID_TOOLS/platform-tools" ] ; then
    PATH="$ANDROID_TOOLS/platform-tools:$PATH"
fi

sudo apt update && sudo apt upgrade -y
sudo apt install -y openjdk-8-jdk unzip vim python bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-core gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
sudo apt clean all

echo "Donwload script from Google: "
curl https://storage.googleapis.com/git-repo-downloads/repo > $GOOGLE_REPO/repo
chmod a+x $GOOGLE_REPO/repo

# set PATH so it includes user's private bin if it exists
if [ -d "$GOOGLE_REPO" ] ; then
    PATH="$GOOGLE_REPO:$PATH"
fi

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
mkdir -p $HOME/.ccache
export CCACHE_DIR=$HOME/.ccache
ccache -M 50G
ccache -o compression=true

cd $LINEAGEOS
echo "Sync repo LineageOS, branch $ROM_VERSION: "
repo init -u git://github.com/LineageOS/android.git -b $ROM_VERSION --git-lfs
repo sync -c -j$(nproc --all)

source build/envsetup.sh
breakfast $MODEL_DEVICE

echo "Next step: Extract proprietary blobs, more info: https://wiki.lineageos.org/devices/kebab/build#extract-proprietary-blobs"
