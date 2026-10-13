local dbConfig = require("src.config.database")

dbConfig:exec([[
  CREATE TABLE IF NOT EXISTS tasks (
    id_task INTEGER PRIMARY KEY AUTOINCREMENT,,
    id_control INTEGER NOT NULL, 
    title TEXT NOT NULL,
    description TEXT,
    status INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT fk_id_control FOREIGN KEY(id_control) REFERENCES controls(id_control)
  )
]])

local function post_createTask(
    title,
    description
)
    local query = dbConfig:prepare("INSERT INTO tasks (title, description, id_control) VALUES (?, ?, ?)")
    query:bind_values(title, description)
    local query_status = query:step()
    query:finalize()

    if query_status == require("lsqlite3").DONE then
        return "Task created successfully"
    else
        return "Error: couldn't create the task. Message: " .. dbConfig:errmsg()
    end
end

local function get_allTasks()
    local result = {
        data = dbConfig:nrows("SELECT * FROM tasks t INNER JOIN controls c ON t.id_control = c.id_control"),
        message = "All tasks were selected"
    }

    return result
end

local function get_findTask(id_task)
    local query = dbConfig:prepare(
    'SELECT * FROM tasks t WHERE t.id_task = ? INNER JOIN controls c ON t.id_control = c.id_control'
    )
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