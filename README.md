# To_Do_In_Lua
This is My First Project in Lua. Fully Compatible with Windows Environment.

## Layered Architecture

```bash
To_Do_In_Lua/
|
|-data/
|   |-to_do.db #- Database in SQLite
|
|-docs/
|   |-guide_ubuntu.md
|   |-guide_win.md
|
|-src/
|   |-api/
|   |   |-api.lua #- Call services based on UI request received by main.lua
|   |
|   |-config/
|   |   |-database.lua #- Settings to the database connection
|   |   
|   |-models/
|   |   |-taskModels.lua #- Models to the Queries on Database
|   |
|   |-services/ #- Services to do request to the database through models and validations
|   |-ui/
|   |   |-src/
|   |   |   |-css/ #- Styles
|   |   |   |-js/ #- Functions to Request to the backend or work behaviors on pages
|   |   |   |-middleware/ #- Validations to the functions
|   |   |   |-pages/ #- Application Pages
|   |   |
|   |   |-index.html #- Main page of the application
|   |   |-webview.lua #- File to Generates the Webview and Receive Answers of Backend
|   |
|
|-main.lua #- Main File (Bridge to communication between services and ui)
|-test_drive.lua #- Sample Tour in Lua Focused on this applicaiton
|-README.MD
|-LICENSE
```

## What Do You Need to Run?

- Choose your environment to follow the guide:
- [Windows (Verified in Windows 11)](./docs/guide_win.md)
- [Ubuntu (Veirified in Ubuntu 26.04 LTS)](./docs/guide_ubuntu.md)

You need to install some dependencies to work with Lua.

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

If you try run this program and it fails, follow the guide for your environment to solve problems.