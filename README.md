![GitHub top language](https://img.shields.io/github/languages/top/azagramac/BuildLineageOS.svg) ![GitHub last commit (branch)](https://img.shields.io/github/last-commit/azagramac/BuildLineageOS/master.svg)

<p align="center">
        <img src="images/lineageos.png" alt="PNG" height="480px" />
</p>


## Device OnePlus 6 ("enchilada")
<img src="images/oneplus6.png" alt="PNG" height="256px" />
```
source build/envsetup.sh
breakfast enchilada
```

Now ensure your 6 is connected to your computer via the USB cable, with ADB and root enabled, and that you are in the ~/android/lineage/device/oneplus/enchilada folder. Then run the extract-files.sh script:
```
./extract-files.sh
```

Start the build
Time to start building! Now, type:
```
croot
brunch enchilada
```

## Device Google Nexus 10 ("manta")
<img src="images/nexus10.png" alt="PNG" height="256px" />

```
source build/envsetup.sh
breakfast manta
```

Now ensure your 6 is connected to your computer via the USB cable, with ADB and root enabled, and that you are in the ~/android/lineage/device/oneplus/enchilada folder. Then run the extract-files.sh script:
```
./extract-files.sh
```

Start the build
Time to start building! Now, type:
```
croot
brunch manta
```

## Ubuntu 16.04 LTS 64 bit
- 100Gb free disk

## Download the source code
```sh
chmmod a+x build.sh
```

