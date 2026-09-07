local taskModel = require("src.models.taskModel")

local function insertTask(task)
    return taskModel.post_createTask(task.title, task.description)
end

return insertTask