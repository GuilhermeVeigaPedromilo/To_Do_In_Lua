# Guide for Ubuntu Environment

## Prepare Your Environment and Install Dependencies
Use this below prompt to prepare your environment and install dependencies:

```bash
sudo apt update

sudo apt install -y \
    luajit \
    libluajit-5.1-dev \
    luarocks \
    gcc \
    make \
    git \
    sqlite3 \
    libsqlite3-dev \
    pkg-config \
    libgtk-3-dev \
    libwebkit2gtk-4.1-dev

sudo luarocks install lua-cjson
sudo luarocks install lsqlite3
sudo luarocks install lua-webview

echo "Finished"
```

This command install:
- LuaJIT.
- GCC (compiler).
- LuaRocks (package manager of Lua)
- SQLite3 (database)
- Webkit
- lua-webview and lua-cjson.

You may test with these commmands the installation:
```bash
luajit -v
gcc --version
luarocks --version
```

## Problems with your Webkit Installation

### Problems with Webkit
If your terminal points to an error with the webkit installation, you need to follow these steps:

- #### Verify Which Webkit Dependencie Exists in Your Ubuntu:

```bash
apt search webkit2gtk
```

- #### Install the dependencie based on the last prompt, for example:

```bash
sudo apt install libgtk-3-dev libwebkit2gtk-4.1-dev
```

### WebView Build Error on New Ubuntu Versions

If `lua-webview` fails with an error similar to:

```text
Package webkit2gtk-4.0 not found
JavaScriptCore/JavaScript.h: No such file or directory
```

It is likely because newer Ubuntu versions ship only webkit2gtk-4.1, while the WebView dependency still expects webkit2gtk-4.0.

First, make sure WebKit 4.1 development packages are installed:

```bash
sudo apt install -y libgtk-3-dev libwebkit2gtk-4.1-dev
```

Then create compatibility aliases for pkg-config:

```bash
sudo ln -s \
/usr/lib/x86_64-linux-gnu/pkgconfig/webkit2gtk-4.1.pc \
/usr/lib/x86_64-linux-gnu/pkgconfig/webkit2gtk-4.0.pc

sudo ln -s \
/usr/lib/x86_64-linux-gnu/pkgconfig/javascriptcoregtk-4.1.pc \
/usr/lib/x86_64-linux-gnu/pkgconfig/javascriptcoregtk-4.0.pc
```

Verify the aliases:
```bash
pkg-config --modversion webkit2gtk-4.0
pkg-config --modversion javascriptcoregtk-4.0
```

After that, reinstall the package:
```bash
sudo luarocks install lua-webview
```