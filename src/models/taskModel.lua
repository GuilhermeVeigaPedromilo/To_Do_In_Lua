local dbConfig = require("src.config.database")

dbConfig:exec([[
  CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    status INTEGER NOT NULL DEFAULT 0
  )
]])

-- dbConfig:exec("DELETE FROM tasks")

local function post_createTask(
    title,
    description
)
    local query = dbConfig:prepare("INSERT INTO tasks (title, description) VALUES (?, ?)")
    query:bind_values(title, description)
    local query_status = query:step()
    query:finalize()

    if query_status == require("lsqlite3").DONE then
        print("Task created successfully")
    else
        print("Error: couldn't create the task. Message: " .. dbConfig:errmsg())
    end
end

local function get_allTasks()
    return dbConfig:nrows("SELECT * FROM tasks")
end

local function get_findTask(id_task)
    local query = dbConfig:prepare("SELECT * FROM tasks WHERE id = ?")
    query:bind_values(id_task)

    local query_status = query:step()
    if (query_status == require("lsqlite3").ROW) then
        local task = {
            id = query:get_value(0),
            title = query:get_value(1),
            description = query:get_value(2),
            status = query:get_value(3)
        }
        query:finalize()
        return task
    else
        query:finalize()
        return nil
    end
end

local function put_toggleStatus(id, status)
    local query = dbConfig:prepare("UPDATE tasks SET status = ? WHERE id = ?")
    query:bind_values(status, id)
    local query_status = query:step()
    query:finalize()

    if (query_status == require("lsqlite3").DONE) then
        print("Task status toggled successfully")
        return true
    else
        print("Error: couldn't toggle the task status. Message: " .. dbConfig:errmsg())
        return false
    end
end

local function delete_removeTask(id)
    local query = dbConfig:prepare("DELETE FROM tasks WHERE id = ?")
    query:bind_values(id)

    local query_status = query:step()
    query:finalize()

    if (query_status == require("lsqlite3").DONE) then
        print("Task deleted successfully")
        return true
    else
        print("Error: couldn't delete the task. Message: " .. dbConfig:errmsg())
        return false
    end
end

return {
    post_createTask = post_createTask,
    get_allTasks = get_allTasks,
    get_findTask = get_findTask,
    put_toggleStatus = put_toggleStatus,
    delete_removeTask = delete_removeTask
}