# Guide for Windowns Environment

## Prepare Your Environment
You need to prepare your environment. You may install it here: https://www.msys2.org/.

Then, open the MYSYS2 UCRT64 and put this prompt it:

```bash
pacman -Syu
```
## Install Dependencies
Then, use these below prompts to install them through UCRT64:

```bash
pacman -S mingw-w64-ucrt-x86_64-luajit mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-lua-luarocks
```

This command install:
- LuaJIT.
- GCC (compiler).
- LuaRocks (package manager of Lua).

You may test with these commmands the installation:
```bash
luajit -v
gcc --version
luarocks --version
```

To the environment be compatible with web-view, it's necessary to install the lua-webview. For this, test your environment has installed the git with this command:

```bash
git --version
```

If it hasn't, so install with this command:

```bash
pacman -S git
```

Then you must use this command to install the make (Old Version of MinGW as native executable - .exe):

```bash
pacman -S mingw-w64-ucrt-x86_64-make
```

Test the make with command below:

```bash
mingw32-make --version
```

Then you must use the next command to discover if the liblua51 has some package or it's empty:

```bash
ls -la /ucrt64/lib/liblua51*
```

If it's empty, run this command to create a file waited by -llua51:

```bash
cp /ucrt64/lib/libluajit-5.1.dll.a /ucrt64/lib/liblua51.dll.a
```

Finally, you are able to install the lua-webview with this command:

```bash
luarocks --lua-version=5.1 install lua-webview \
  LUA_INCDIR=/ucrt64/include/luajit-2.1 \
  LUA_LIBDIR=/ucrt64/lib \
  LUALIB=libluajit-5.1.dll.a \
  LUA=/ucrt64/bin/luajit.exe \
  MAKE=mingw32-make CC=gcc LD=gcc
```

The last package what you need to install is the lua-cjson. You must install it with this command:

```bash
luarocks --lua-version=5.1 install lua-cjson \
  LUA_INCDIR=/ucrt64/include/luajit-2.1 \
  LUA_LIBDIR=/ucrt64/lib \
  LUALIB=libluajit-5.1.dll.a \
  LUA=/ucrt64/bin/luajit.exe \
  MAKE=mingw32-make CC=gcc LD=gcc
```

### Errors with LuaJIT and SQLite Lib

If you try run this program by terminal and it generate this error or some looks like it:

```bash
C:\msys64\ucrt64\bin\luajit: .\src\config\database.lua:1: module 'lsqlite3' not found:
        no field package.preload['lsqlite3']
        no file '.\lsqlite3.lua'
        no file 'C:\msys64\ucrt64\bin\..\share\luajit-2.1\lsqlite3.lua'
        no file 'C:\msys64\ucrt64\bin\..\share\luajit-2.1\lsqlite3\init.lua'
        no file 'C:\msys64\ucrt64\bin\..\share\lua\5.1\lsqlite3.lua'
        no file 'C:\msys64\ucrt64\bin\..\share\lua\5.1\lsqlite3\init.lua'
        no file 'C:\msys64\ucrt64\bin\..\lib\lua\5.1\lsqlite3.lua'
        no file 'C:\msys64\ucrt64\bin\..\lib\lua\5.1\lsqlite3\init.lua'
        no file '.\lsqlite3.dll'
        no file 'C:\msys64\ucrt64\bin\..\lib\lua\5.1\lsqlite3.dll'
        no file 'C:\msys64\ucrt64\bin\..\lib\lua\5.1\loadall.dll'
stack traceback:
        [C]: in function 'require'
        .\src\config\database.lua:1: in main chunk
        [C]: in function 'require'
        .\src\models\taskModel.lua:1: in main chunk
        [C]: in function 'require'
        .\src\services\listTasks.lua:1: in main chunk
        [C]: in function 'require'
        main.lua:2: in main chunk
        [C]: at 0x7ff69cd42090
```

You must follow these steps to solve that problem:

- #### Find where your files were installed

First, you must be with your MSYS2 UCRT64 terminal open to use this prompts to discover where your LuaJIT files are installed:

```bash
find /ucrt64 -iname "luajit.h" 2>/dev/null
find /ucrt64 -iname "libluajit*" 2>/dev/null
```

Your output must be looks like this:
```bash
/ucrt64/include/luajit-2.1/luajit.h
/ucrt64/lib/libluajit-5.1.a
/ucrt64/lib/libluajit-5.1.dll.a
```

- #### Discover which your DDL runtime
Then, you must run this prompt to know where are installed your DDL Runtime and it's relative the last output:

```bash
/ucrt64/bin/lua51.dll
/ucrt64/bin/luajit
/ucrt64/bin/luajit-2.1.1785606157.exe
/ucrt64/bin/luajit.exe
```

- #### Install lsqlite3 pointing to LuaJIT
You must remove the old version of lsqlite3 through this command:

```bash
luarocks remove lsqlite3
```

Then, you reinstall pointing to the LuaJIT path with these commands:

```bash
luarocks --lua-version=5.1 install lsqlite3 \
  LUA_INCDIR=/ucrt64/include/luajit-2.1 \
  LUA_LIBDIR=/ucrt64/lib \
  LUALIB=libluajit-5.1.dll.a \
  LUA=/ucrt64/bin/luajit.exe
```

Your output must be looks like this:
```bash
Installing https://luarocks.org/lsqlite3-0.9.7-1.src.rock


lsqlite3 0.9.7-1 depends on lua >= 5.1, < 5.6 (5.1-1 provided by VM: success)
cc -O2 -fPIC -c -o lsqlite3.o -IC:/msys64/ucrt64/include/luajit-2.1 lsqlite3.c -DLSQLITE_VERSION="0.9.7" -IC:\msys64\ucrt64\include
cc  -shared -o C:\msys64\tmp\luarocks_build-lsqlite3-0.9.7-1-5290824\lsqlite3.dll lsqlite3.o -LC:\msys64\ucrt64\lib -lsqlite3 C:\msys64\ucrt64\lib\libluajit-5.1.dll.a -lm
No existing manifest. Attempting to rebuild...
lsqlite3 0.9.7-1 is now installed in C:/msys64/ucrt64 (license: MIT)
```