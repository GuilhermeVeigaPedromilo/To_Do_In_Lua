local taskModel = require("src.models.taskModel")

local function insertTask(task)
    taskModel.post_createTask(task.title, task.description)
end

return insertTask