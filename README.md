

# Open HTML5 speed test for OpenWrt

> Based on https://github.com/openspeedtest/Speed-Test



## Motivation
Current web speed test has a lots of limitations, like being forced to use another port or consuming a lots of memory.
Which does not play nicely with space-limited for OpenWRT Devices.


## Note

1. This package has been verified to my configuration.
2. Use nginx to achieve best result.
3. Takes 5MB runtime memory to store temp download file.
4. Use http may achieve better performance due to no encryption cost.
5. Tune the LuCI "Settings" tab to adjust ping samples, timeouts, thread counts and test durations without touching the upstream assets.
6. Temporary-payload mode uses a symlink outside the web root. With uhttpd
   `option no_symlinks '1'`, use flash mode or a web server that permits it.

## Layout

```text
oph5spdtst/
├── src/
│   ├── www/luci-static/resources/oph5spdtst/
│   └── LICENSE
├── packaging/
│   ├── packages/oph5spdtst/
│   └── luci/luci-app-oph5spdtst/
├── README.md
└── LICENSE
```

## Usage


```
# First Enter your openwrt compile root folder

git clone https://github.com/AzulEterno/oph5spdtst.git
cp -r oph5spdtst/packaging/packages/oph5spdtst package/oph5spdtst
cp -r oph5spdtst/packaging/luci/luci-app-oph5spdtst package/luci-app-oph5spdtst

# Then check luci-app-oph5spdtst

```
## Image

![Demo Pic](<img/屏幕截图 2025-01-24 171258.png>)

