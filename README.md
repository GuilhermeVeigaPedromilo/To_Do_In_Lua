# To_Do_In_Lua
This is My First Project in Lua. Fully Compatible with Windows Environment.

## What Do You Need to Run?

You need to install some dependencies to work with Lua. But before install them, you need to prepare your environment. You may install it here: https://www.msys2.org/.

Then, open the MYSYS2 UCRT64 and put this prompt it:

```bash
pacman -Syu
```

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

## My Experience as Software Engineering Student with Lua (Example)

In this example, I developed a console application as to do app. This example is a sample crud and that language (Lua) remember Python, ABAP (Native Language of SAP) and JS (JavaScript) syntax.

### Source Code:

```Lua
local lastId_registered = 3

-- In Lua, there isn't a struct or object-orinted, just tables.
local task = {
    id = 1,
    title = "Sample Task",
    status = false
}

-- Remember of JS
print(task.title)

-- Tables can be used as arrays or dictionaries
local tasks = {
    task,
    { id = 2, title = "Create a example in Lua", status = true },
    { id = 3, title = "Work with tables", status = true }
}

-- In Lua, tables start with index 1
print(tasks[1].title)

-- The for loop looks like the logical of ABAP and Python
for i, n in ipairs(tasks) do
    print(i, n.title, n.status)
end


local function addTask(title)
    local newTask = {
        id = lastId_registered + 1,
        title = title,
        status = false
    }
    -- In JS, use push
    table.insert(tasks, newTask)
    lastId_registered = lastId_registered + 1
    return newTask
end

addTask("Learn Lua")
addTask("Read Lua Documentation")

local function listAllTasks()
    for i, n in ipairs(tasks) do
        print("\n", n.id, n.title, n.status)
    end
end

listAllTasks()

-- Output:
-- 1       Sample Task     false
-- 2       Create a example in Lua true
-- 3       Work with tables        true
-- 4       Learn Lua       false
-- 5       Read Lua Documentation  false

local function findTask(id_task)
    for i, n in ipairs(tasks) do
        if n.id == id_task then
            print("\nTask found: \n- " .. n.title)
            return n
        end
    end
    print("Error: that task does not exist")
    return nil
end

local function removeTask(id)
    local task_founded = findTask(id)
    if task_founded then
        for i, n in ipairs(tasks) do
            if n.id == id then
                table.remove(tasks, i)
                print("\nTask removed successfully")
                return true
            end
        end
    else
        print("Error: cannot possible remove this task")
        return false
    end
end

findTask(2)
print(findTask(10))
removeTask(3)
listAllTasks()

-- Output:
-- 1       Sample Task     false

-- 2       Create a example in Lua true

-- 4       Learn Lua       false

-- 5       Read Lua Documentation  false

-- Function as variable, like JS
local toggleTask = function(id)
    local task_founded = findTask(id)
    if task_founded then
        task_founded.status = not task_founded.status
        print("\nTask toggled successfully")
        return true
    else
        print("Error: cannot possible toggle this task")
        return false
    end
end

toggleTask(3)
toggleTask(5)
listAllTasks()

-- Output:
-- 1       Sample Task     false

-- 2       Create a example in Lua true

-- 4       Learn Lua       false

-- 5       Read Lua Documentation  true
```

### Running the Script:

```Bash
luajit test.lua
```

## How can I run this project?

To run this program, clone this repository and open your destiny folder of download. Open the MYSYS2 UCRT64 terminal in your directory and run this command:

```lua
luajit main.lua
```

### Problems to Run this Code

If you try run this program and it fails with some error below, follow these steps to solve this problem.

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