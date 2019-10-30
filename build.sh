#!/bin/sh

ROM_VERSION="CHANGE"
MODEL_DEVICE="CHANGE"

## OnePlus 6
# rom: lineage-16.0
# device: enchilada
# link: https://wiki.lineageos.org/devices/enchilada/build

## Nexus 10
# rom: cm-13.0
# device: manta
# link https://wiki.lineageos.org/devices/manta/build

mkdir -p /home/$USER/Desarrollo/Android/tools
mkdir -p /home/$USER/Desarrollo/Android/lineageos
mkdir -p /home/$USER/Desarrollo/Android/tools/google

ANDROID_TOOLS="/home/$USER/Desarrollo/Android/tools"
LINEAGEOS="/home/$USER/Desarrollo/Android/lineageos"
GOOGLE_API="/home/$USER/Desarrollo/Android/tools/google"

# download sdk tools
wget -c https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d $ANDROID_TOOLS

# add Android SDK platform tools to path
if [ -d "$ANDROID_TOOLS/platform-tools" ] ; then
    PATH="$ANDROID_TOOLS/platform-tools:$PATH"
fi

sudo apt update
sudo apt upgrade -y
sudo apt install -y openjdk-8-jdk unzip vim python bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-core gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
sudo apt clean all

echo "Donwload script from Google: "
curl https://storage.googleapis.com/git-repo-downloads/repo > $GOOGLE_API/repo
chmod a+x $GOOGLE_API/repo

# set PATH so it includes user's private bin if it exists
if [ -d "$GOOGLE_API" ] ; then
    PATH="$GOOGLE_API:$PATH"
fi

cd $LINEAGEOS
repo init -u git://github.com/LineageOS/android.git -b $ROM_VERSION
repo sync

source build/envsetup.sh
breakfast $MODEL_DEVICE


